<template>
  <div class="wechat">
    <!-- header头部组件引用 -->
    <headertop></headertop>
    <div class="container clearfix">
      <div class="code-main fl">
        <p>订单将在2小时后关闭，请及时付款</p>
        <canvas id="canvas"></canvas>
        <p>请使用微信扫一扫完成支付</p>
      </div>
      <div id='code' class="fl">
        <p>大麦网订单</p>
        <p>支付订单号 :
          <span>{{this.orderinfos.orderNo}}</span>
        </p>
        <p>商品名称 :
          <span>{{this.orderinfos.itemName}}</span>
        </p>
        <p>订单金额 :
          <span>￥
            <i>{{this.orderinfos.totalAmount}}</i>
          </span>
        </p>
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

import Vue from "vue";
import QRCode from "qrcode";
Vue.use(QRCode);
export default {
  data() {
    return {
      codes: "",
      orderinfos: ""
    };
  },
  components: {
    headertop,
    footersimple
  },
  methods: {
    // 生成二维码的函数
    useqrcode() {
      // 盛放二维码的容器
      var canvas = document.getElementById("canvas");
      // 调用专门的函数去生成二维码 -盛放的容器-要生成的内容-回调函数
      QRCode.toCanvas(canvas, this.orderinfos.codeUrl, function(error) {
        if (error) {
          console.error(error);
        } else {
          // 成功之后可回调的函数
          // console.log("success!");
        }
      });
    },
    // 接收微信支付的信息（订单的相关信息）
    getQueryData() {
      // 接收通过编程路由传递的参数
      this.orderinfos = this.$route.query;
      // console.log("接收的参数 = " + JSON.stringify(this.orderinfos));
    }
  },
  mounted() {
    //调用函数获得数据
    this.getQueryData();
    // 组件挂载的时候去调用生成的函数
    this.useqrcode();
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../static/less/custom.less";

.container {
  margin-top: 10px ;
  margin-bottom: 10px ;
  padding: 80px 0;
  background-color: @body-background;
  #code {
    p {
      line-height: 40px;
      color: #333;
      font-size: 16px;
      span {
        margin-left: 10px;
        i {
          color: @primary-color;
          font-weight: bold;
        }
      }
    }
  }
}
.code-main {
  margin: 0 150px;
  p {
    text-align: center;
    line-height: 30px;
    font-size: 14px;
  }
  #canvas {
    width: 200px !important;
    height: 200px !important;
  }
}
</style>
