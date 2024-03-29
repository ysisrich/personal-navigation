import Vue from 'vue'
import './plugins/axios'
import App from './App.vue'
import router from './router'
import './plugins/ant-design-vue.js'



// 图片查看器
import Viewer from 'v-viewer'
import 'viewerjs/dist/viewer.css'

Vue.use(Viewer)
Viewer.setDefaults({
  Options: { 'inline': true, 'button': true, 'navbar': true, 'title': true, 'toolbar': true, 'tooltip': true, 'movable': true, 'zoomable': true, 'rotatable': true, 'scalable': true, 'transition': true, 'fullscreen': true, 'keyboard': true, 'url': 'data-source' }
})

// 渲染md
import 'github-markdown-css/github-markdown.css'
import hljs from 'highlight.js'
import 'highlight.js/styles/googlecode.css' //样式文件
// 如果开启了typescript 需要额外安装 npm install @types/highlight.js
// 通过 import * as hljs from 'highlight.js' 引入
Vue.directive('highlight', function (el) {
  const blocks = el.querySelectorAll('pre code')
  blocks.forEach(block => {
    hljs.highlightBlock(block)
  })
})
// 也可以把这自定义指令封装 通过Vue.use()，来注入


// 使用 vue-meta
import Meta from "vue-meta";
Vue.use(Meta);

import VueLazyload from 'vue-lazyload'
Vue.use(VueLazyload)
// 配置项
Vue.use(VueLazyload, {
  preLoad: 1.3,
  error: '@/asset/img/lazyload.png',
  loading: '@/asset/img/lazyload.png',
  attempt: 1
})


Vue.config.productionTip = false


router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面title */
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
})


// 引入自己的组件库
import niubilityUi from 'niubility-ui'
import 'niubility-ui/dist/niubility-ui.css'
Vue.use(niubilityUi)


new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
