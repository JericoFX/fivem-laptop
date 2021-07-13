import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import VueAxios from "vue-axios";

const http = axios.create({
  baseURL: process.env.BASE_MODULE_URL,
  headers: {
    'Content-type': 'application/json; charset=UTF-8',
  },
})
createApp(App)
  .use(store)
  .use(router)
  .use(VueAxios, http)
  .mount('#app')
