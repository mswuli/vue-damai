// 整个应用的共享数据，参考vuex官方文档：https://vuex.vuejs.org/zh-cn/
import Vue from 'vue'
import Vuex from 'vuex'

let loginInfo = {}
const storageKey = 'loginInfo'

Vue.use(Vuex)

// 取持久化数据
if (window.localStorage.getItem(storageKey)) {
  loginInfo = window.localStorage.getItem(storageKey)
  loginInfo = JSON.parse(loginInfo)
}

const state = {
  // 用户登录信息
  sLoginInfo: loginInfo
}

const mutations = {
  // 登录
  mLogin: (state, loginInfo) => {
    loginInfo.extTime -= 0
    loginInfo.genTime -= 0
    state.sLoginInfo = loginInfo
    window.localStorage.setItem(storageKey, JSON.stringify(loginInfo))
  },
  // 退出
  mLogout: (state) => {
    state.sLoginInfo = {}
    window.localStorage.removeItem(storageKey)
  }
}

const actions = {}

const getters = {
  // 通过token，判断用户是否登录
  gIsLogin: state => !!state.sLoginInfo.token
}

export default new Vuex.Store({
  state,
  getters,
  actions,
  mutations
})
