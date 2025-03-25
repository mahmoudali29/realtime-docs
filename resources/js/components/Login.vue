<template>
    <div class="container">
      <h2>Login</h2>
      <form @submit.prevent="handleLogin">
        <input v-model="email" type="email" placeholder="Email" required />
        <input v-model="password" type="password" placeholder="Password" required />
        <button type="submit">Login</button>
        <p v-if="error" style="color: red">{{ error }}</p>
      </form>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import axios from 'axios'
  import { useRouter } from 'vue-router'
  
  const router = useRouter()
  
  const email = ref('')
  const password = ref('')
  const error = ref('')
  
  const handleLogin = async () => {
    error.value = ''
    try {
      const response = await axios.post('/api/v1/login', {
        email: email.value,
        password: password.value
      })
  
      const token = response.data.token
      localStorage.setItem('token', token)
  
      router.push('/documents')
    } catch (err) {
      error.value = 'Invalid credentials. Please try again.'
    }
  }
  </script>
  