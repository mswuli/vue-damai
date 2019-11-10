<template>
  <div class="orderconfirm">
    <!-- header头部组件引用 -->
    <headertop></headertop>
    <div class="container">
      <!-- step开始 -->
      <!-- <div class="steps">
        <Steps :current="1">
          <Step title="选择商品"></Step>
          <Step title="确认订单信息"></Step>
          <Step title="支付订单"></Step>
          <Step title="收取商品"></Step>
        </Steps>
      </div> -->
      <div class="choose-seat-container">
        <div class="choose-seat-head">
          <div class="head-first">1 选择商品</div>
          <div class="head-second">2 确认订单信息</div>
          <div class="head-third">3 支付订单</div>
          <div class="head-third">4 收取商品</div>
        </div>
      </div>
      <!-- step结束 -->
      <!-- 收票人信息开始 -->
      <!-- <div class="buyerinfo">
                <div class="hd">
                    <h2 class="hd-title">购票人信息</h2>
                </div>
                <div class="buyer-main">
                    <Card dis-hover>
                        <p slot="title">身份证电子票</p>
                        <p class="username">用户姓名：
                            <Input v-model="username" placeholder="请输入用户名"></Input>
                        </p>
                        <p class="phonenum">用户手机号：
                            <Input v-model="phonenum" placeholder="请输入手机号"></Input>
                        </p>

                        <span class="tips">
                            <em>
                                <Icon type="information"></Icon>
                            </em>
                            温馨提示：请持购票时所填写的二代身份证到演出（赛事）地点或自助机换票
                        </span>
                    </Card>
                </div>
            </div> -->
      <!-- 收票人信息结束 -->

      <!-- 实名证件信息开始 -->
      <div class="userid">
        <div class="hd">
          <h2 class="hd-title">实名证件信息</h2>
        </div>
        <div class="user-main">
          购票人：
          <Button type="primary" @click="modalconfirm = true">选择购票人</Button>
          <!-- 常用购票人开始 -->
          <div class="selectbuyer" v-show="modalconfirm">
            <ticketbuyer :params="buyer" :num="ticketnum" @listenbuyer="getbuyerinfo"></ticketbuyer>
          </div>
          <!-- 常用购票人结束 -->

        </div>
      </div>
      <!-- 实名证件信息结束 -->
      <!-- 选择付款方式开始 -->
      <div class="pay">
        <div class="hd">
          <h2 class="hd-title">选择付款方式</h2>
        </div>
        <div class="pay-main">
          <RadioGroup v-model="pay">
            <Radio label="payinline">
              <span>网上付款</span>
            </Radio>
          </RadioGroup>
        </div>
      </div>
      <!-- 选择付款方式结束 -->
      <!-- 商品清单开始 -->
      <div class="orderlist">
        <div class="hd">
          <h2 class="hd-title">商品清单</h2>
        </div>
        <div class="orderlist-main">
          <Table border :columns="columns1" :data="data1"></Table>
        </div>
      </div>
      <!-- 商品清单结束 -->
      <!-- 我要开发票开始 -->
      <div class="invoice">
        <div class="hd">
          <h2 class="hd-title">我要开发票</h2>
        </div>
        <div class="invoice-main">
          <Tabs name="name1" :animated="false" @on-click="invoice">
            <TabPane name="name1" label="公司">
              <div class="invoice-wrapper clearfix">
                <span class="fl">公司抬头：</span>
                <p class="invoiceHead fl">
                  <input id="inhead" v-model="invoiceHead" placeholder="请输入公司抬头"></input>
                </p>
              </div>
              <div class="invoice-wrapper clearfix">
                <span class="fl">公司税号：</span>
                <p class="invoiceId fl">
                  <input id="inid" v-model="invoiceId" placeholder="请输入公司税号"></input>
                </p>
              </div>
              <Button type="primary" @click="compsubmit">确认发票信息</Button>
            </TabPane>
            <TabPane name="name2" label="个人">
              <Button type="primary" @click="percubmit">确认发票信息</Button>
            </TabPane>
          </Tabs>
        </div>
      </div>
      <!-- 我要开发票结束 -->
      <!-- 保险开始 -->
      <div class="discount">
        <div class="discount-bd">
          <p class="row">
            <label class="u-checkbox">
              <input type="checkbox" id="insurance" @click="safe">
              <span class="txt">购买“安心订票保险”，本单保费金额：20.00 元</span>
            </label>
          </p>
          <p class="row">
            查看
            <a href="javascript:;">保险服务说明</a> 和
            <a href="javascript:;">《安心订票保险条款》</a>
          </p>
          <p class="row">购买保险，请填写真实姓名</p>
          <p class="row">商品金额：
            <span class="cell">¥{{this.totalpirce}}</span>
          </p>
          <p v-show="insurancefalg" class="row">商品保险：
            <span class="cell">
              <i>+</i> ¥20.00</span>
          </p>
        </div>
        <!-- 待支付金额开始 -->
        <div class="ft">
          <p class="row txt">
            待支付总额：
            <span>¥ {{this.paymount}}</span>
          </p>
          <p class="row">
            <label class="u-checkbox">
              <input type="checkbox" id="agreement" @click="agree">
              <span class="txt">我已阅读并同意
                <Tooltip placement="top">
                  <a href="javascript;;">《订购服务条款》</a>
                  <div slot="content">
                    <p>本服务条款适用于所有登陆大麦网/中国票务在线的用户，包括个人用户、团体用户、单位用户等。</p>
                    <p>大麦网/中国票务在线，以下简称“本网站”。</p>
                    <p>登陆大麦网/中国票务在线的用户，包括个人用户、团体用户、单位用户。以下统称“用户”。</p>
                  </div>
                </Tooltip>
                <Tooltip placement="top">
                  <a href="javascript;;">《退换货约定》</a>
                  <div slot="content">
                    <p>（1） 符合退、换货时间规定（依据：主办方通知的因演出取消/延期安排的退票时间、转场时间段）；</p>
                    <p>（2） 需将票品完好无损退回；</p>
                    <p>（3） 如开发票，需将发票完好无损退回；</p>
                  </div>
                </Tooltip>
                <Tooltip placement="top">
                  <a href="javascript;;">《退款约定》</a>
                  <div slot="content">
                    <p>1、因不可抗力因素导致演出取消或延期，大麦网会主动与您确认变更或退款事宜，不收取任何手续费。</p>
                    <p>2、办理退款或变更要求需符合时间规定（依据：主办方通知的因演出取消/延期安排的退款时间、转场时间段）。</p>
                  </div>
                </Tooltip>
              </span>
            </label>
          </p>
          <p class="row">同意“票品为不记名凭证，请您妥善保管，遗失不补”</p>
          <Button type="primary" :disabled='disabled' @click="submitorder">同意以上协议并提交订单</Button>
        </div>
        <!-- 待支付金额结束 -->
      </div>
      <!-- 保险结束 -->
    </div>

    <!-- footer组件引用 -->
    <footersimple></footersimple>
  </div>
</template>

<script>
/* header头部组件 */
import headertop from "@/components/headertop";

import footersimple from "@/components/footerSimple";
// 引入常用购票人组件
import ticketbuyer from "@/components/orderlist/ticketbuyer";

export default {
  data() {
    return {
      // 用户id
      userId: "02220",
      // 排期
      schedulerId: 2,
      // 商品Id
      itemId: 100,
      // 剧场Id
      cinemaId: 300,
      // 订单来源(0:WEB端 1:手机端 2:其他客户端)
      sourceType: 0,
      // 是否需要发票（0：不需要 1：需要）
      isNeedInvoice: 0,
      // 发票类型（0：个人 1：公司）
      invoiceType: 0,
      // 发票信息
      invoiceHead: "",
      invoiceId: "",
      // 是否需要保险(0：不需要 1:需要)
      isNeedInsurance: 0,
      // 座位坐标使用(x1_y1,x2_y2,...的形式提交)
      seatPositions: "",
      // 支付类型
      pay: "payinline",
      // 表格
      columns1: [
        {
          title: "商品名称",
          key: "itemName"
        },
        {
          title: "座位号",
          key: "seatPositions"
        },
        {
          title: "价格",
          key: "price"
        },
        {
          title: "数量",
          key: "num"
        },
        {
          title: "价格小计（元）",
          key: "totalAmount"
        }
      ],
      data1: [
        {
          itemName: "John Brown",
          seatPositions: 18,
          price: "1000",
          num: "1",
          totalAmount: "1000"
        }
      ],
      // 提交
      disabled: true,
      // total
      totalpirce: 0,
      // 保险
      insurancefalg: false,
      // 待支付金额
      paymount: 0,
      // 订单编号
      orderNo: "",
      // 常用购票人
      modalconfirm: false,
      // 购票人渲染信息
      columnbuyer: [
        {
          type: "selection",
          width: 60,
          align: "center"
        },
        {
          title: "姓名",
          key: "name"
        },
        {
          title: "卡类型",
          key: "cardType"
        },
        {
          title: "身份证号",
          key: "idCard"
        }
      ],
      buyer: [],
      // 购票的数量
      ticketnum: 2,
      // 常用购票人的ID
      linkIds: "",
      // 页面传递的信息
      seatinfos: {}
    };
  },
  components: {
    headertop,
    footersimple,
    ticketbuyer
  },
  methods: {
    total() {
      var sum = 0;
      this.data1.forEach(item => {
        // 遍历数组中的所有项目，然后取出每一个项目小计，然后求总和
        sum += parseInt(item.totalAmount);
      });
      this.totalpirce = sum;
      this.paymount = this.totalpirce;
    },
    // 保险选择选项
    safe() {
      var insurance = document.getElementById("insurance");
      if (insurance.checked == true) {
        // 选择之后说明需要发票
        this.isNeedInsurance = 1;
        this.insurancefalg = !this.insurancefalg;
        this.paymount = this.totalpirce + 20;
      } else {
        // 不选择说明 不需要发票
        this.isNeedInsurance = 0;
        this.insurancefalg = !this.insurancefalg;
        this.paymount = this.paymount - 20;
      }
    },
    // 同意条款
    agree() {
      var agreement = document.getElementById("agreement");
      if (agreement.checked == true) {
        this.disabled = !this.disabled;
      } else {
        this.disabled = true;
      }
    },
    // 发票
    invoice(e) {
      let type = e;
      if (type == num1) {
        this.invoiceType = 1;
      } else {
        this.invoiceType = 0;
      }
    },
    // 公司按钮提交
    compsubmit() {
      var companyname = document.getElementById("inhead").value;
      var companyid = document.getElementById("inid").value;
      this.invoiceHead = companyname;
      this.invoiceId = companyid;
      // 需要发票
      this.isNeedInvoice = 1;
    },
    // 个人发票提交
    percubmit() {
      // 公司相关信息置为空
      this.invoiceHead = "";
      this.invoiceId = "";
      // 需要发票
      this.isNeedInvoice = 1;
    },
    // 被选择购票人的信息,通过子组件传递给父组件
    getbuyerinfo(data) {
      // console.log('data=='+data);
      this.linkIds = data;
    },
    // 提交订单
    submitorder() {
      // 提交最终订单
      // 调用下单接口，把下单的相关信息提交到数据库
      this.$http
        .postRequest({
          type: "submitOrder",
          data: {
            // 用户id
            userId: this.userId,
            // 排期
            schedulerId: this.schedulerId,
            // 商品Id
            itemId: this.itemId,
            // 剧场Id
            cinemaId: this.cinemaId,
            // 订单来源(0:WEB端 1:手机端 2:其他客户端)
            sourceType: this.sourceType,
            // 是否需要发票（0：不需要 1：需要）
            isNeedInvoice: this.isNeedInvoice,
            // 发票类型（0：个人 1：公司）
            invoiceType: this.invoiceType,
            // 发票信息
            invoiceHead: this.invoiceHead,
            invoiceId: this.invoiceId,
            // 是否需要保险(0：不需要 1:需要)
            isNeedInsurance: this.isNeedInsurance,
            // 座位坐标使用(x1_y1,x2_y2,...的形式提交)
            seatPositions: this.seatPositions,
            // 被选择购票人的信息
            linkIds: this.linkIds
          }
        })
        .then(res => {
          // 下单情况
          // console.log("下单情况 = " + JSON.stringify(res.data.orderNo));
          // 取到订单编号
          this.orderNo = res.data.orderNo;

          // 跳转页面需要带着orderNo，支付页面需要orderNo取查询订单的详情
          //编程路由-跳转到确认支付页面
          if (this.orderNo != "") {
            this.$router.push({
              path: "paymethod",
              query: { orderNo: this.orderNo }
            });
          }
        });
    }
  },
  mounted() {
    // 获得详情页传递的数据，并对应赋值
    // console.log("seatdata==" + JSON.stringify(this.$route.query));
    this.seatinfos = this.$route.query;
    this.schedulerId = this.seatinfos.comData.schedulerId;
    this.cinemaId = this.seatinfos.comData.cinemaId;
    // 购票数量
    this.ticketnum = this.seatinfos.seatData.length;
    // 遍历数组对象取值
    let arr = [];
    this.seatinfos.seatData.forEach(item => {
      arr.push({
        itemName: item.itemName,
        seatPositions: item.x + "排" + item.y + "座",
        price: item.price,
        num: 1,
        totalAmount: item.price
      });
    });
    this.data1 = arr;
    // 获得座位信息地址
    let str = "";
    this.seatinfos.seatData.forEach(item => {
      if (str == "") {
        str = item.x + "_" + item.y;
      } else {
        str = str + "," + item.x + "_" + item.y;
      }
    });
    // console.log("str ==" + str);
    // 获得座位的信息传递给后台
    this.seatPositions = str;

    // 遍历数组中的所有项目
    this.total();
  },
  watch: {
    modalconfirm: function() {
      if (this.modalconfirm == true) {
        this.buyer = this.columnbuyer;
      }
    }
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../static/less/custom.less";
@top: 50px;
@red: #ff3c1b;
.orderconfirm {
  .container {
    padding: 0 20px 50px;
    background-color: @body-background;
  }
  .steps {
    padding: 30px 0;
  }

  .hd {
    position: relative;
    border-bottom: 1px solid #d7d7d7;
    &:after {
      content: "";
      position: absolute;
      left: 0;
      top: 100%;
      z-index: 0;
      width: 120px;
      border-bottom: 1px solid @primary-color;
    }
    .hd-title {
      color: @primary-color;
      line-height: 30px;
      font-size: 16px;
      font-weight: 400;
      padding-left: 10px;
    }
  }
  // 购票人信息开始
  .buyerinfo {
    .buyer-main {
      margin-top: 15px;
      .username {
        padding-bottom: 10px;
      }
      .phonenum {
        padding-bottom: 20px;
      }
      .tips {
        margin-top: 20px;
        padding: 10px;
        background: #fdf7e4;
        em {
          margin-right: 5px;
          display: inline-block;
          width: 20px;
          height: 20px;
          line-height: 20px;
          text-align: center;
          border-radius: 20px;
          background: #5893d7;
        }
      }
    }
  }
  //   实名证件信息开始
  .userid {
    margin-top: 20px;
    .user-main {
      padding: 10px 0;
    }
  }
  // 选择付款方式
  .pay {
    margin-top: 20px;
    .pay-main {
      padding: 10px 0;
    }
  }
  //商品清单开始
  .orderlist {
    margin-top: 20px;
    .orderlist-main {
      padding: 10px 0;
    }
  }
  // 我要开发票开始
  .invoice {
    margin-top: 20px;
    margin-bottom: 20px;

    p {
      width: 300px;
    }
    .invoice-wrapper {
      line-height: 50px;
      input {
        width: 300px;
        border: 1px solid #c3c3c3;
        line-height: 30px;
        border-radius: 3px;
        text-indent: 4px;
      }
    }
    button {
      margin: 20px 0 0 30px;
    }
  }
  // 保险开始
  .discount-bd {
    padding: 20px 0;
    border-top: 1px solid #c3c3c3;
    text-align: right;
    .row {
      line-height: 24px;
      vertical-align: text-top;
      .u-checkbox {
        input {
          margin-right: 10px;
        }
      }
      .cell {
        margin-left: 15px;
        color: @primary-color;
        i {
          color: #333;
        }
      }
    }
  }
  // 待支付金额开始
  .ft {
    padding: 20px 0;
    border-top: 1px dashed #c3c3c3;
    text-align: right;
    .row {
      line-height: 24px;
    }
    .txt {
      font-weight: bold;
      span {
        color: @primary-color;
        font-weight: bold;
      }
    }
    button {
      margin: 20px 0 0 10px;
    }
  }
  // 选择购票人
  .selectbuyer {
    width: 700px;
    padding: 20px;
    border: 1px solid #efefef;
    margin-top: 20px;
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

<style lang="less">
// 发票
.invoice {
  .ivu-tabs-bar {
    margin-bottom: 0;
  }
  .ivu-tabs-no-animation {
    .ivu-tabs-content {
      padding: 15px;
      height: 200px;
      border: 1px solid #dddee1;
      border-top: none;
    }
  }
}
.discount {
  .ivu-tooltip-inner {
    white-space: normal;
  }
}
</style>


