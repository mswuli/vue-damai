<template>
    <div class="recentorder">
        <!-- 近期订单列表开始 -->
        <div class="orderlist">
            <div class="hd">
                <h2 class="hd-title">近期订单列表</h2>
            </div>
            <div class="filter-order clearfix">
                <div class="fl">
                    <Select v-model="ordertypeval" style="width:150px" @on-change="handelOrderType">
                        <Option v-for="item in orderTypeSelect" :value="item.value" :key="item.value">{{ item.label }}</Option>
                    </Select>
                    <Select v-model="creattimeval" style="width:150px" @on-change="handelOrderTime">
                        <Option v-for="item in creatTime" :value="item.value" :key="item.value">{{ item.label }}</Option>
                    </Select>
                </div>
                <div class="fr">
                    <Input v-model="keywordval" placeholder="请输入订单编号、商品名称..." style="width: 300px"></Input>
                    <Button type="ghost" @click="addKeyWord">查询</Button>
                </div>

            </div>
            <div class="orderlist-main">
                <Table border :columns="columns1" :data="data1"></Table>
            </div>
        </div>
        <!-- 近期订单列表结束 -->
    </div>
</template>

<script>
export default {
  data() {
    return {
      // 订单列表的表格
      columns1: [
        {
          title: "订单编号",
          key: "orderNo"
        },
        {
          title: "购买时间",
          key: "sellTime"
        },
        {
          title: "商品名称",
          key: "itemName"
        },
        {
          title: "数量",
          key: "num",
          width: 80
        },
        {
          title: "单价",
          key: "unitPrice",
          width: 80
        },
        {
          title: "订单金额",
          key: "totalAmount",
          width: 100
        },
        {
          title: "交易状态",
          key: "orderType",
          width: 100
        },
        {
          title: "操作",
          key: "operate",
          width: 80
          /* align: 'center',
          render: (h, params) => {
            return h("div", [
              h(
                "Button",
                {
                  props: {
                    type: "success",
                    size: "small"
                  },
                  on: {
                    click: () => {
                    //   this.show(params.index);
                    }
                  }
                },
                ""
              )
            ]);
          } */
        }
      ],
      data1: [],
      // 订单类型(0:未支付 -1:支付超时/支付取消 2:已支付 全部订单 不传)
      orderTypeSelect: [
        {
          value: "全部订单",
          label: "全部订单"
        },
        {
          value: "已取消",
          label: "已取消"
        },
        {
          value: "待支付",
          label: "待支付"
        },
        {
          value: "完成",
          label: "完成"
        }
      ],
      ordertypeval: "全部订单",
      // 订单创建时间
      creatTime: [
        {
          value: "全部",
          label: "全部"
        },
        {
          value: "一年内",
          label: "一年内"
        },
        {
          value: "近3个月",
          label: "近3个月"
        }
      ],
      creattimeval: "全部",
      // 订单编号、商品名称
      keywordval: "",
      // 传空
      orderType: "",
      // 订单时间
      orderTime: 0,
      //  关键词
      keyword: ""
    };
  },
  components: {},
  methods: {
    // 调用订单接口，获得订单信息
    getOrderData() {
      this.$http
        .postRequest({
          type: "queryOrderList",
          data: {
            // 订单类型传空，可以获得全部订单
            orderType: this.orderType,
            orderTime: this.orderTime,
            keyword: this.keyword
          }
        })
        .then(res => {
          // 全部订单列表情况
          // console.log("全部订单列表 = " + JSON.stringify(res.data));
          // 订单赋值赋值给 data1
          for (var i in res.data) {
            // res.data[i]
            if (res.data[i].orderType == 0) {
              res.data[i].orderType = "待支付";
            } else if (res.data[i].orderType == -1) {
              res.data[i].orderType = "已取消";
            } else {
              res.data[i].orderType = "完成";
            }
          }
          this.data1 = res.data;
        });
    },
    // 选择订单类型时候触发
    // 订单类型(0:未支付 -1:支付超时/支付取消 2:已支付)
    handelOrderType() {
        // console.log(this.ordertypeval);
        // 数据的双向绑定
      if (this.ordertypeval == "全部订单") {
        this.orderType = "";
      } else if (this.ordertypeval == "待支付") {
        this.orderType = 0;
      } else if (this.ordertypeval == "已取消") {
        this.orderType = -1;
      } else {
        this.orderType = 2;
      }
      // console.log(this.orderType);
      // 调用获得后台订单的数据的方法
      this.getOrderData();
    },
    // 按照订单时间查询
    // 订单创建时间范围(0:全部,1:一年内,2:近三个月)
    handelOrderTime() {
      // console.log(this.creattimeval);
      if (this.creattimeval == "全部") {
        this.orderTime = 0;
      } else if (this.creattimeval == "一年内") {
        this.orderTime = 1;
      } else {
        this.orderTime = 2;
      }
      // 调用获得后台订单的数据的方法
      this.getOrderData();
    },
    // 按照关键词查询
    // 关键词：订单编号、商品名称
    addKeyWord() {
      this.keyword = this.keywordval;
      //   console.log("关键词="+this.keyword)

      // 调用获得后台订单的数据的方法
      this.getOrderData();
      // 将关键词栏目置为空 
      this.keywordval = "";
    }
  },
  mounted() {
    //  组件挂载调用获得全部订单数据
    this.getOrderData();
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../../static/less/custom.less";
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
//近期商品清单开始
.orderlist {
  margin-top: 20px;
  .orderlist-main {
    padding: 10px 0;
  }
  .filter-order {
    margin: 15px 0;
  }
}
</style>
