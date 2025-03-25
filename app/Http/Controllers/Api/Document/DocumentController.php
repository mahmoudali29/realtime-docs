<?php

namespace App\Http\Controllers\Api\Document;

use App\Http\Controllers\Controller;
use App\Models\Document;
use App\Models\DocumentVersion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Events\DocumentUpdated;

class DocumentController extends Controller
{

    public function index()
    {
        $user = Auth::user();

        // Get owned documents
        $ownedDocs = $user->ownedDocuments()->with('owner', 'collaborators')->get();

        // Get shared documents
        $sharedDocs = $user->documents()->with('owner', 'collaborators')->get();

        // Merge and remove duplicates if needed
        $allDocs = $ownedDocs->merge($sharedDocs)->unique('id')->values();

        return response()->json([
            'message' => 'List of documents you can access.',
            'documents' => $allDocs
        ]);
    }

    public function show($id)
    {
        $user = auth()->user();

        $document = Document::with('collaborators:id,name')  
            ->where('id', $id)
            ->where(function ($q) use ($user) {
                $q->where('owner_id', $user->id)
                ->orWhereHas('collaborators', function ($q) use ($user) {
                    $q->where('user_id', $user->id);
                });
            })
            ->first();

        if (!$document) {
            return response()->json(['message' => 'Document not found or access denied'], 404);
        }

        return response()->json([
            'document' => $document
        ]);
    }





    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'nullable|string',
            'collaborators' => 'nullable|array',
            'collaborators.*' => 'integer|exists:users,id',
        ], [
            'collaborators.*.exists' => 'One or more collaborators are invalid or do not exist.',
        ]);

        $user = Auth::user();

         
        $document = Document::create([
            'title'     => $request->title,
            'content'   => $request->content,
            'owner_id'  => $user->id,
        ]);

         
        if ($request->has('collaborators')) {
            $document->collaborators()->syncWithoutDetaching($request->collaborators);
        }

         
        DocumentVersion::create([
            'document_id' => $document->id,
            'user_id'     => $user->id,
            'content'     => $request->content,
        ]);

        return response()->json([
            'message' => 'Document created successfully',
            'document' => $document->load('collaborators', 'owner'),
        ], 201);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'nullable|string|max:255',
            'content' => 'nullable|string',
            'collaborators' => 'nullable|array',
            'collaborators.*' => 'integer|exists:users,id',
        ], [
            'collaborators.*.exists' => 'One or more collaborators are invalid or do not exist.',
        ]);

        $user = Auth::user();
        $document = Document::findOrFail($id);

        // Authorization check: must be owner or collaborator
        $isOwner = $document->owner_id === $user->id;
        $isCollaborator = $document->collaborators()->where('users.id', $user->id)->exists();

        if (!$isOwner && !$isCollaborator) {
            return response()->json(['message' => 'Forbidden: You are not allowed to edit this document.'], 403);
        }

        // Update fields
        if ($request->filled('title')) {
            $document->title = $request->title;
        }
        if ($request->filled('content')) {
            $document->content = $request->content;
        }

        $document->save();

        event(new DocumentUpdated(
            $document->id,
            $user->only('id', 'name'),
            $document->content
        ));

        // Save version history (if content changed)
        if ($request->filled('content')) {
            DocumentVersion::create([
                'document_id' => $document->id,
                'user_id' => $user->id,
                'content' => $request->content,
            ]);
        }

        // Sync collaborators (if provided)
        if ($request->has('collaborators')) {
            $document->collaborators()->syncWithoutDetaching($request->collaborators);
        }



        return response()->json([
            'message' => 'Document updated successfully.',
            'document' => $document->load('collaborators', 'owner'),
        ]);
    }

    public function versions($id)
    {
        $user = Auth::user();
        $document = Document::findOrFail($id);

        // Allow access only if user is owner or collaborator
        $isOwner = $document->owner_id === $user->id;
        $isCollaborator = $document->collaborators()->where('users.id', $user->id)->exists();

        if (!$isOwner && !$isCollaborator) {
            return response()->json(['message' => 'Forbidden: You do not have access to this document.'], 403);
        }

        // Get versions with user info
        $versions = $document->versions()->with('user:id,name,email')->latest()->get();

        return response()->json([
            'message' => 'Version history fetched successfully.',
            'versions' => $versions
        ]);
    }

    public function activate($id)
    {
        $user = auth()->user();

        $document = Document::findOrFail($id);

        // Ensure user is a collaborator
        if (!$document->collaborators->contains($user->id) && $document->owner_id !== $user->id) {
            return response()->json(['message' => 'Unauthorized'], 403);
        }

        // Update pivot
        $document->collaborators()->updateExistingPivot($user->id, ['is_active' => 1]);

        return response()->json(['message' => 'Marked as active']);
    }



}
