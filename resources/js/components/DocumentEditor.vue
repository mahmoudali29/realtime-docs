<template>
  <div v-if="document.title">
    <h2>{{ document.title }}</h2>

    <h4>Collaborators:</h4>
    <table border="1" style="margin-bottom: 1rem;">
      <thead>
        <tr>
          <th>User ID</th>
          <th>Name</th>
          <th>Active?</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in document.collaborators" :key="user.id">
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>
            <span :style="{ color: user.pivot?.is_active ? 'green' : 'gray' }">
              {{ user.pivot?.is_active ? 'Yes' : 'No' }}
            </span>
          </td>
        </tr>
      </tbody>
    </table>

    <textarea
      v-model="document.content"
      @input="broadcastEdit"
      rows="15"
      style="width: 100%; font-size: 16px;"
    ></textarea>
  </div>

  <div v-else>
    <p>Loading document...</p>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'
import Echo from 'laravel-echo'
import Pusher from 'pusher-js'

const props = defineProps({
  id: {
    type: [String, Number],
    required: true
  }
})

// Token for authentication
const token = localStorage.getItem('token')  

 

const document = ref({
  title: '',
  content: '',
  collaborators: []
})

const fetchDocument = async () => {
  console.log('🔄 Fetching document with ID:', props.id)
  console.log('🔑 Token:', token)

  try {
    const res = await axios.get(`/api/v1/documents/${props.id}`, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })

    console.log('✅ Response:', res.data)
    document.value = res.data.document

    //  Mark user as active collaborator
    await axios.post(`/api/v1/documents/${props.id}/activate`, {}, {
      headers: { Authorization: `Bearer ${token}` }
    })
    console.log('✅ User marked as active')

  } catch (err) {
    console.error('❌ Failed to fetch document or activate:', err)
  }
}





const broadcastEdit = async () => {
  try {
    await axios.put(`/api/v1/documents/${props.id}`, {
      content: document.value.content
    }, {
      headers: {
        Authorization: `Bearer ${token}`
      }
    })
  } catch (err) {
    console.error('Failed to update:', err)
  }
}

const listenToRealtimeUpdates = () => {
  window.Pusher = Pusher

  window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'local-key',
    cluster: 'mt1', 
    wsHost: window.location.hostname,
    wsPort: 6001,
    forceTLS: false,
    disableStats: true,
    encrypted: false,
    authEndpoint: '/broadcasting/auth',
    auth: {
      headers: {
        Authorization: `Bearer ${token}`
      }
    }
  })

  let onlineUsers = ref([])

  window.Echo.private(`document.${props.id}`)
    .listen('DocumentUpdated', (e) => {
      console.log(' Real-time update received:', e)
      document.value.content = e.content
    })
}

onMounted(() => {
  fetchDocument()
  listenToRealtimeUpdates()
})
</script>
