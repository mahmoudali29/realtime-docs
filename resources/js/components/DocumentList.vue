<template>
    <div class="container">
      <h2>Your Documents</h2>
  
      <ul>
        <li
          v-for="doc in documents"
          :key="doc.id"
          style="margin-bottom: 12px; font-size: 18px;"
        >
          <router-link
            :to="{ name: 'editor', params: { id: doc.id } }"
            style="text-decoration: none; color: #0ea5e9;"
          >
            📄 {{ doc.title }}
          </router-link>
        </li>
      </ul>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue'
  import axios from 'axios'
  
  const token = localStorage.getItem('token')
  const documents = ref([])
  
  onMounted(async () => {
    const res = await axios.get('/api/v1/documents', {
      headers: { Authorization: `Bearer ${token}` }
    })
    documents.value = res.data.documents
  })
  </script>
  