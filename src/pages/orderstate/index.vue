<template>
    <div class="paystate">
        <!-- header头部组件引用 -->
        <headertop></headertop>
        <div class="container">
            <!-- 0:未支付 -1:支付超时/支付取消 2:已支付 -->
            <div v-if="paystate != 2" class="state-main cancle">
                <!-- 支付超时/支付取消 -->
                <Icon type="close-circled"></Icon>
                <p>交易超时失效</p>
                <span>该订单目前已过期。请重新下单</span>
                <Button type="info" @click="backIndex">返回首页</Button>
            </div>
            <div v-if="paystate == 2" class="state-main success">
                <!-- 已支付 -->
                <Icon type="checkmark-circled"></Icon>
                <p>交易成功</p>
                <Button type="success"  @click="backList">返回订单页面</Button>
            </div>
        </div>
        <!-- footer组件引用 -->
        <footersimple></footersimple>

    </div>
</template>

<script>
/* header头部组件 */
import headertop from "@/components/headertop";
/* footer底部组件 */
import footersimple from "@/components/footerSimple";

export default {
  data() {
    return {
      paystate: 2
    };
  },
  components: {
    headertop,
    footersimple
  },
  methods: {
    // 获得监控函数返给的 订单支付情况数据
    getStateData() {
      // 直接获得订单支付的状态码
      this.paystate = this.$route.query.orderType;
    },
    // 返回首页
    backIndex(){
      // 编程路由
      this.$router.push({ path: '/' })
    },
    // 返回订单列表页
    backList(){
      this.$router.push({ path: '/orderlist' })      
    }
  },
  mounted() {
    // 挂载的时候，直接调用获得订单的状态码
    this.getStateData();
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../static/less/custom.less";

.container {
  margin-top: 10px;
  margin-bottom: 10px;
  background-color: @body-background;
  padding: 80px 0;
  .state-main {
    margin: 0 auto;
    text-align: center;
    font-size: 50px;
    color: @primary-color;
    span {
      line-height: 25px;
      color: #666;
      font-size: 14px;
      display: block;
    }
  }
  .success {
    color: #09bb07;
  }
  p {
    line-height: 50px;
    font-size: 30px;
    color: #333;
  }
}
</style>
