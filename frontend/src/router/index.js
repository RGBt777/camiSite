import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'userPosts',
    component: () => import(/* webpackChunkName: "data" */ '../views/userPosts.vue')
  },
  

  {
    path: '/data/:id',
    name: 'Data',
    component: () => import(/* webpackChunkName: "data" */ '../views/userPage.vue')
  },
  
  
  {
    path: '/about',
    name: 'About',
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
  
    {
    path: '/register',
    name: 'Register',
    component: () => import(/* webpackChunkName: "about" */ '../views/Register.vue')
  },
      {
    path: '/login',
    name: 'Login',
    component: () => import(/* webpackChunkName: "about" */ '../views/Login.vue')
  },
        {
    path: '/post',
    name: 'Post',
    component: () => import(/* webpackChunkName: "about" */ '../views/PostImage.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
