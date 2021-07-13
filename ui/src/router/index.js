import { createRouter, createWebHistory } from 'vue-router'
import Password from "../views/LockScreen";

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Password
  },
  {
    path: '/desktop',
    name: 'Desktop',
    component: () => import(/* webpackChunkName: "about" */ '../views/Desktop.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
