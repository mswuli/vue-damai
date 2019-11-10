import request from '@/common/request'
import store from '@/store'
import * as url from "./url"

// 记录登录信息
function rememberLogin (res, phone) {
  if (res.errorCode === '0000') {
    const loginInfo = res.data
    loginInfo.phone = phone
    store.commit('mLogin', loginInfo)
  }
}

// 获取注册验证码
export function postUserCode (phone) {
  return request('post', '/api/user/code', { phone })
}

// 使用手机号注册
export function postUserRegister (phone, password, vcode) {
  return request('post', '/api/user/register', { phone, password, vcode })
}

// 密码登录接口
export function postUserLogin (phone, password) {
  return request('post', '/api/user/login', { phone, password }).then(res => {
    rememberLogin(res, phone)
    return res
  })
}

// 获取登录验证码
export function postUserMsg (phone) {
  return request('post', '/api/user/msg', { phone })
}

// 短信登录接口
export function postUserLoginForMsg (phone, vcode) {
  return request('post', '/api/user/msg/login', { phone, vcode }).then(res => {
    rememberLogin(res, phone)
    return res
  })
}

// 获取首页商品分类导航
export function postIndexNav () {
  return request('post', '/api/index/nav')
}

// 获取首页横向导航
export function postIndexLineNav () {
  return request('post', '/api/index/lineNav')
}

// 获取轮播图
export function postIndexCarousel () {
  return request('post', '/api/index/carousel')
}

// 获取今日推荐
export function postIndexRecommend () {
  return request('post', '/api/index/recommend')
}

// 获取即将开售
export function postIndexSell () {
  return request('post', '/api/index/sell')
}

// 获取楼层数据
export function postFloorData () {
  return request('post', '/api/index/floor')
}

// 获取分类排行
export function postIndexSeniority (itemTypeId) {
  return request('post', '/api/index/seniority', { itemTypeId })
}



/*
通过postRequest 请求数据
参数params格式为：
      {
        type:"string", //type请求变量的url地址常量名称，参考url.js文件里面的常量.
        data:{object}  //data传递到后台的参数信息，主要是object对象，传入时进行对象转换
      }
*/
export function postRequest (params) {
  return request('post', url[params.type], {...params.data})
}
/* 测试示例 */
export function indexWebTopNav () {
  return request('post', '/api/index/webtopnav')
}
export function  getUrlParam (name) {
  var reg = new RegExp(name + "=([^&]*)(&|$)");
  var r = window.location.hash.match(reg);
  if (r != null) return unescape(r[1]); return null;
}


