<template>
  <div class="orderlist">
    <!-- 头部组件 -->
    <Vheader/>
    <!-- main -->
    <div class="list-main">
      <div class="container">
        <div class="layout clearfix">
          <Layout>
            <Layout>
              <Sider :style="{background: '#fff',width: '200px',float: 'left',margin: '0 20px 0 0'}">
                <Menu @on-select="handleChange" active-name="订单管理" theme="light" width="auto" :open-names="['1']" @on-collapse="handleChange">
                  <MenuItem name="3" :style="{background: '#FF5C41',color:'#fff'}">我的大麦</MenuItem>
                  <Submenu name="1">
                    <template slot="title">
                      交易中心
                    </template>
                    <MenuItem name="订单管理">订单管理</MenuItem>
                  </Submenu>
                  <Submenu name="2">
                    <template slot="title">
                      账户中心
                    </template>
                    <MenuItem name="个人信息">个人信息</MenuItem>
                    <MenuItem name="常用购票人">常用购票人</MenuItem>
                  </Submenu>
                </Menu>
              </Sider>
              <Layout :style="{width:'980px',float: 'left'}">
                <div class="breadcrumb h5">
                  <a href="javascript:;" target="_self">我的大麦</a>&gt;
                  <span>{{this.menuName}}</span>&gt;
                  <span>{{this.submenuName}}</span>
                </div>
                <!-- 近期订单列表开始 -->
                <recentlyorderlist v-show="ordershow"></recentlyorderlist>
                <!-- 近期订单列表结束 -->

                <!-- 个人信息开始 -->
                <personinfo v-show="personinfoshow" :infos="perinfos" :isinfo="isperinfo"></personinfo>
                <!-- 个人信息结束 -->
                <!-- 常用购票人开始 -->
                <ticketbuyer v-show="tbuyershow"></ticketbuyer>
                <!-- 常用购票人结束 -->
              </Layout>
            </Layout>
          </Layout>
        </div>
      </div>
    </div>
    <!-- 底部组件 -->
    <Vfooter/>
  </div>
</template>

<script>
// 引入头部组件
import header from "@/components/header";
// 引入底部组件
import footer from "@/components/footer";
// 引入最近订单列表组件
import recentlyorderlist from "@/components/orderlist/recentlyorderlist";
// 引入个人信息组件
import personinfo from "@/components/orderlist/personinfo";
// 引入常用购票人组件
import ticketbuyer from "@/components/orderlist/ticketbuyer";

export default {
  data() {
    return {
      // 用户信息
      userId: "",
      // 菜单名称
      menuName: "交易中心",
      submenuName: "订单管理",
      /* menuName: "账户中心",
      submenuName: "个人信息", */
      // 订单列表
      ordershow: true,
      // 个人信息是否显示
      personinfoshow: false,
      // 常用购票人是否显示
      tbuyershow: false,
      // 用户信息组件数据
      perinfos: {},
      isperinfo: ""
    };
  },
  components: {
    Vheader: header,
    Vfooter: footer,
    recentlyorderlist,
    personinfo,
    ticketbuyer
  },
  methods: {
    handleChange(e) {
      //   console.log("侧边栏==" + e);
      this.submenuName = e;
      if (e == "订单管理") {
        this.ordershow = true;
        this.personinfoshow = false;
        this.tbuyershow = false;

        this.menuName = "交易中心";
      } else if (e == "个人信息") {
        this.ordershow = false;
        this.personinfoshow = true;
        this.tbuyershow = false;

        this.menuName = "账户中心";
      } else {
        this.ordershow = false;
        this.personinfoshow = false;
        this.tbuyershow = true;

        this.menuName = "账户中心";
      }
    },
    // 根据用户Id返回用户信息
    getPersonIofo() {
      this.$http
        .postRequest({
          type: "queryPersonInfo",
          data: {
            // 输入为 用户ID
            userId: this.userId
          }
        })
        .then(res => {
          //  对用用户的信息
          // console.log("对用用户的信息 = " + JSON.stringify(res.data));
          // 把个人信息 赋值给 formValidate,用于数据回显
          // this.formValidate = res.data;
          this.perinfos = res.data;
          // res.data.birthday = res.data.birthday.getTime();
          this.isperinfo = JSON.stringify(res.data);
          // console.log("父组件对用用户的信息perinfos = " + JSON.stringify(this.perinfos));
        });
    }
  },
  mounted() {
    // 组件加载的时候获得个人的ID?
    this.userId = "12345";
    // 获得用户的个人资料
    this.getPersonIofo();
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../static/less/custom.less";
.orderlist {
  .list-main {
    width: 100%;
    border-top: 2px solid @primary-color;
    padding: 20px 0;
    .breadcrumb {
      border: 1px solid #efefef;
      height: 38px;
      overflow: hidden;
      padding: 0 15px;
      line-height: 38px;
      color: #333;
      margin-bottom: 15px;
      background: linear-gradient(top, #efefef, #fff);
    }
  }
}
</style>
<style lang="less">
.orderlist {
  .ivu-menu-vertical {
    .ivu-menu-item:hover,
    .ivu-menu-submenu-title:hover {
      background: #e6e6e6;
    }
  }
  .ivu-layout {
    background: #fff;
  }
  .ivu-menu-light {
    border: 1px solid #efefef;
  }
  .ivu-layout-sider {
    z-index: 1;
  }
}
</style>

