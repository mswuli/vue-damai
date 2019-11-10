<template>
  <div class="page">
    <!-- header头部组件引用 -->
    <headertop></headertop>
    <!-- header头部组件下方搜索部分引用 -->
    <headersearch></headersearch>
  </div>
</template>

<script>
/* header头部组件 */
import headertop from "@/components/headertop";
/* header头部组件下方搜索部分 */
import headersearch from "@/components/headersearch";

export default {
  data() {
    return {
      // tokenFile: null
    };
  },
  components: {
    headertop,
    headersearch
  },
  methods: {},
  // 完全挂载之后加载
  mounted() {
    // this.$http.postRequest({type:"topNavUrl"}).then(res => {
    //   console.log(res.data);
    //   this.city = res.data;
    // });

      // 首页根据token返回用户信息接口
    // this.$http.postIndexToken().then(res => {
    //   console.log(tokenFile)
    //   this.tokenFile = res.data;
    // });
  }

};
</script>

<style lang="less" scoped>

</style>
