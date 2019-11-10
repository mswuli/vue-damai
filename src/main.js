// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import store from '@/store'
import App from './App'
import router from './router'
import http from './http'
import iView from 'iview'
import   './common/utils'

/* 引入抽取的公共样式 */
import '../static/less/common.less'


Vue.use(iView)
Vue.use(http)
Vue.config.productionTip = false

//将store, router加入并生成应用
new Vue({
  el: '#app',
  router,
  store,
  template: '<App/>',
  components: { App }
})
