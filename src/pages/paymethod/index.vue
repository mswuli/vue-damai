<template>
  <div class="paymethod">
    <!-- header头部组件引用 -->
    <headertop></headertop>
    <div class="container">
      <!-- step开始 -->
      <!-- <div class="steps">
        <Steps :current="2">
          <Step title="选择商品"></Step>
          <Step title="确认订单信息"></Step>
          <Step title="支付订单"></Step>
          <Step title="收取商品"></Step>
        </Steps>
      </div> -->

      <div class="choose-seat-container">
        <div class="choose-seat-head">
          <div class="head-first">1 选择商品</div>
          <div class="head-third">2 确认订单信息</div>
          <div class="head-second">3 支付订单</div>
          <div class="head-third">4 收取商品</div>
        </div>
      </div>
      <!-- step结束 -->

      <!-- 商品清单开始 -->
      <div class="orderlist">
        <div class="orderlist-main">
          <Table border :columns="columns1" :data="data1"></Table>
        </div>
        <p>应付总金额:
          <span>{{this.data1[0].payAmount}}</span> 元</p>
      </div>
      <!-- 商品清单结束 -->

      <!-- 支付方式开始 -->
      <div class="payment">
        <p>以下支付平台都支持大多数银行卡:</p>
        <!-- 方式选择 -->
        <div class="pay-main">
          <RadioGroup v-model="payway" @on-change="handleRadio">
            <Radio label="微信"><img :src="imgUrlWx"></Radio>
            <Radio label="支付宝"><img :src="imgUrlZfb"></Radio>
          </RadioGroup>
        </div>
        <Button type="primary" @click="submitPay">确认无误，支付</Button>
      </div>
      <!-- 支付方式结束 -->
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

import img_wx from "./img/wx_10127.jpg";
import img_zfb from "./img/zfb_8129.jpg";

export default {
  data() {
    return {
      // 表格
      columns1: [
        {
          title: "订单编号",
          key: "orderNo"
        },
        {
          title: "商品名称",
          key: "itemName"
        },
        {
          title: "订单金额",
          key: "totalAmount"
        },
        {
          title: "应付金额",
          key: "payAmount"
        }
      ],
      data1: [
        {
          orderNo: "",
          itemName: "",
          totalAmount: 0,
          payAmount: 0
        }
      ],
      payway: "支付宝",
      imgUrlWx: img_wx,
      imgUrlZfb: img_zfb,
      // 订单编号
      orderNo: "1234",
      paytype: "支付宝",
      zfbUrl: "https://www.baidu.com",
      // 微信返回数据
      wxdata: [],
      // 支付状态
      ordertype: 0
    };
  },
  components: {
    headertop,
    footersimple
  },
  mounted() {
    // 组件挂载时候，请求请求订单详情
    this.orderInfos();
    // 获取确认订单页面传递的订单号
    this.orderNo = this.$route.query.orderNo;
  },
  methods: {
    // 获得上个页面传递来的 订单编号，赋值给 this.orderNo？

    // 根据订单编号请求后台获取订单详情
    orderInfos() {
      this.$http
        .postRequest({
          type: "confirmPay",
          data: {
            // 订单编号
            orderNo: this.orderNo
          }
        })
        .then(res => {
          // 订单详情
          // 应付金额 应该和 订单金额 一样，这里创建一个新的属性 payAmount
          res.data.payAmount = res.data.totalAmount;
          // 如果只是改动数组里面的某一个下标对应的值，这里是不会更新变化的
          //   this.data1[0] = res.data;
          //   this.data1[0].payAmount =res.data.totalAmount;
          //   console.log("订单详情 = " + JSON.stringify([res.data]));
          this.data1 = [res.data];
        });
    },
    handleRadio(e) {
      this.paytype = e;
      if (this.paytype == "支付宝") {
        this.zfbUrl = "https://www.baidu.com";
      } else {
        this.$http
          .postRequest({
            type: "weChatPay",
            data: {
              // 订单编号
              orderNo: this.orderNo
            }
          })
          .then(res => {
            // 微信支付返回的值
            // console.log ("微信支付：=" + JSON.stringify( res.data ));
            this.wxdata = res.data;
          });
      }
    },
    // 刷新订单状态函数
    getOrderStatus() {
      let timer = null;
      // 定义超时时间
      let timeout = 2 * 60 * 60;
      clearTimeout(timer);
      this.$http
        .postRequest({
          type: "orderState",
          data: {
            // 订单编号
            orderNo: this.orderNo
          }
        })
        .then(res => {
          // 微信支付返回的值
          //  console.log ("微信支付：=" + JSON.stringify( res.data ));
          if (res.data.orderType === 2) {
            this.ordertype = res.data.orderType;
            this.$router.push({
              path: "orderstate",
              query: { orderType: this.ordertype }
            });
          } else {
            timer = setTimeout(this.getOrderStatus, 1000);
            timeout--;
          }
          // 判断是否超过两个小时,应该属于未支付情况
          if (timeout < 0) {
            this.$router.push({
              path: "orderstate",
              query: { orderType: 0 }
            });
          } else if (res.data.orderType === -1) {
            this.$router.push({
              path: "orderstate",
              query: { orderType: res.data.orderType }
            });
          }
        });
    },
    // 点击付款按钮之后事件
    submitPay() {
      if (this.paytype == "支付宝") {
        /* Vue项目中跳转外部链接时候，直接写的www.baidu.com不行，需要前面加了https:// */
        // 重新打开新页面
        window.open(this.zfbUrl);
        // 本页面跳转
        // window.location.href = this.zfbUrl ;
      } else {
        // 传给微信组件
        this.$router.push({ path: "wechatpay", query: this.wxdata });
        // 调用刷新函数，检测是否付款
        this.getOrderStatus();
      }
    }
    //
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../static/less/custom.less";

@top: 50px;
@red: #ff3c1b;
.paymethod {
  .container {
    padding: 0 20px 50px;
    background-color: @body-background;
  }
  .steps {
    padding: 30px 0;
  }
  //商品清单开始
  .orderlist {
    margin-top: 20px;
    .orderlist-main {
      padding: 10px 0;
    }
    p {
      font-size: 16px;
    }
    span {
      color: @primary-color;
      margin: 0 5px;
    }
  }
  //  支付方式
  .payment {
    margin-top: 10px;
    .pay-main {
      margin: 15px 0;
      line-height: 30px;
      img {
        vertical-align: middle;
      }
    }
  }

    // step开始
  .choose-seat-container {
    height: 50px;
    position: relative;
    .choose-seat-head {
      width: 1160px;
      position: absolute;
      top: 10px;
      z-index: 1;
      div {
        float: left;
        display: inline;
        width: 25%;
        height: 50px;
        background: #65a9fd;
        color: #fff;
        text-align: center;
        line-height: 50px;
        font-size: 18px;
        background: linear-gradient(
          #565656,
          #484848,
          #3e3e3e,
          #484848,
          #565656
        );
      }

      .head-second {
        background: #ff3c1b;
        position: relative;
        height: 52px;
        top: -2px;
      }
      .head-second:before {
        content: "";
        position: absolute;
        display: block;
        top: 0px;
        width: 60px;
        border: 25px solid @red;
        border-bottom: 26px solid @red;
        border-top: 26px solid @red;
        height: 50px;
        z-index: 1;
      }
      .head-second:after {
        content: "";
        position: absolute;
        display: block;
        top: -1px;
        width: 60px;
        border: 27px solid @red;
        border-left: 30px solid @red;
        height: 54px;
        z-index: 1;
      }
      .head-second:before {
        left: -26px;
        border-left-color: transparent;
      }
      .head-second:after {
        right: -60px;
        border-top-color: transparent;
        border-bottom-color: transparent;
        border-right-color: transparent;
      }
    }
  }
  // step结束  

}
</style>
