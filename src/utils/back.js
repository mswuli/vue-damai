import router from '@/router'

// decodeURIComponent() 函数可对 encodeURIComponent() 函数编码的 URI 进行解码。
export default (route) => {
  router.push({
    path: decodeURIComponent(route.query.redirect || '/')
  })
}
