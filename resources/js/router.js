import { createRouter, createWebHistory } from 'vue-router';
import DocumentList from './components/DocumentList.vue';
import DocumentEditor from './components/DocumentEditor.vue';
import Login from './components/Login.vue'

const routes = [
    { path: '/', redirect: '/login' },
    { path: '/login', name: 'login', component: Login },
    { path: '/documents', name: 'documents', component: DocumentList },
    { path: '/documents/:id', name: 'editor', component: DocumentEditor, props: true },
  ]

export default createRouter({
  history: createWebHistory(),
  routes,
});
