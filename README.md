# 📄 Real-Time Collaborative Document Editor

A Laravel + Vue.js-based **Real-Time Document Collaboration Tool** inspired by Google Docs.

---

## 🚀 Features

- ✅ JWT Authentication (Register/Login/Logout)
- ✅ Create, Edit, and View Documents
- ✅ Real-Time Collaboration using WebSockets
- ✅ Track Online Users with Presence Channels
- ✅ View Document Collaborators
- ✅ Basic Version Management
- ✅ Professional Frontend (Vue 3 + Vite)

---

## 🧰 Tech Stack

| Layer         | Tech                              |
|---------------|-----------------------------------|
| Backend       | Laravel 9                         |
| Frontend      | Vue 3 with Vite                   |
| Realtime      | Laravel Echo + Laravel WebSockets |
| Auth          | JWT (tymon/jwt-auth)              |
| Database      | MySQL                             |

---

## 🛠️ Setup Instructions

### 1️⃣ Clone the Repo

```bash
git clone <REPO_URL>
cd realtime-docs
```

---

### 2️⃣ Backend Setup (Laravel)

```bash
composer install
cp .env.example .env
php artisan key:generate
```

Edit your `.env` file with your MySQL credentials.

---

### 3️⃣ Database Setup

1. Create a database named `realtime_docs`
2. Import the SQL dump:

```bash
mysql -u root -p realtime_docs < realtime-docs.sql
```

---

### 4️⃣ Frontend Setup (Vue 3)

```bash
npm install
npm run dev
```

---

### 5️⃣ Laravel WebSockets Setup

Start the Laravel WebSocket server:

```bash
php artisan websockets:serve
```

Make sure your `.env` has the following:

```env
BROADCAST_DRIVER=pusher

PUSHER_APP_ID=local
PUSHER_APP_KEY=local-key
PUSHER_APP_SECRET=local-secret
PUSHER_HOST=127.0.0.1
PUSHER_PORT=6001
PUSHER_SCHEME=http
PUSHER_APP_CLUSTER=mt1
```

In `config/broadcasting.php`, verify:

```php
'pusher' => [
    'driver' => 'pusher',
    'key' => env('PUSHER_APP_KEY'),
    'secret' => env('PUSHER_APP_SECRET'),
    'app_id' => env('PUSHER_APP_ID'),
    'options' => [
        'cluster' => env('PUSHER_APP_CLUSTER'),
        'useTLS' => false,
        'host' => env('PUSHER_HOST'),
        'port' => env('PUSHER_PORT'),
        'scheme' => env('PUSHER_SCHEME'),
        'encrypted' => false,
    ],
],
```

---

## 👤 Test Credentials

| Email                            | Password   |
|----------------------------------|------------|
| mahmoud.ali.29992@gmail.com      | admin123   |
| kareem.ali.29992@gmail.com       | admin123   |

---

## 🔐 API Endpoints

| Method | Endpoint                              | Description                      |
|--------|----------------------------------------|----------------------------------|
| POST   | `/api/v1/register`                    | Register a new user              |
| POST   | `/api/v1/login`                       | Login and receive JWT token      |
| POST   | `/api/v1/logout`                      | Logout (requires token)          |
| GET    | `/api/v1/documents`                   | List user's documents            |
| GET    | `/api/v1/documents/{id}`             | Fetch a document and collaborators |
| PUT    | `/api/v1/documents/{id}`             | Update document content          |
| POST   | `/api/v1/documents/{id}/activate`    | Mark user as active              |
| POST   | `/api/v1/documents/{id}/deactivate`  | Mark user as inactive (optional) |

---

## 🧪 Testing Real-Time Features

1. Open two browser tabs.
2. Login using different users.
3. Open the same document on both tabs.
4. Type in one → it appears in the other in real time.
5. Online users will show under “Collaborators”.

---

## 📂 File Structure Highlights

- `routes/api.php` → Auth + Document APIs
- `routes/channels.php` → Private & Presence Channels
- `app/Events/DocumentUpdated.php` → Broadcasts real-time edits
- `resources/js/components/DocumentEditor.vue` → Main editing view
- `resources/js/router.js` → Vue routing with `/login`, `/documents`, `/documents/:id`
- `resources/views/editor.blade.php` → Single-page app entrypoint

---

## 📸 Optional Screenshots

(Add preview images here if needed)

---

## 🧠 Notes

- Real-time collaboration powered by WebSockets (`laravel/websockets`)
- Presence uses `Echo.join()` with `PresenceChannel`
- Document-user pivot table includes `is_active` to track live editors
- Tokens are stored in `localStorage` for secure API access

---

## 🙌 Author

Made with ❤️ by Mahmoud Ali  
For technical interviews or real-world collaborative tools.
