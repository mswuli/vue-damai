<template>
  <div>
    <!-- 头部组件 -->
    <Vheader/>
    <div class="container">
      <div class="list-top">
        <p id="navigation_show">共
          <span class="list-cf">{{this.itemdescp.total}}</span> 个商品</p>
      </div>
      <!-- 主体部分 -->
      <div class="list-con clearfix">
        <div class="list-left fl">
          <!-- 条件筛选开始 -->
          <div class="list-condition clearfix">
            <!-- 城市筛选开始 -->
            <dl class="clearfix">
              <dt>城 市:</dt>
              <dd>
                <a href="javascript:;" :class="{active:flag}" @click="queryAll('city')">全部</a>
              </dd>
              <dd class="list-city-item">
                <ul>
                  <li v-for="(item,index) in city" :key="index" @click="queryID(item.id,index,'city')">
                    <a href="javascript:;" :class="{'active':ind === index}">{{item.name}}</a>
                  </li>

                </ul>
              </dd>
            </dl>
            <!-- 城市筛选结束 -->
            <!-- 分类筛选开始 -->
            <dl class="clearfix">
              <dt>分 类:</dt>
              <dd>
                <a href="javascript:;" :class="{active:categrayflag}" @click="queryAll('categray')">全部</a>
              </dd>
              <dd class="list-city-item">
                <ul>
                  <li v-for="(item,index) in categray" :key="index" @click="queryID(item.id,index,'categray')">
                    <a href="javascript:;" :class="{'active':categrayind === index}">{{item.itemType}}</a>
                  </li>
                </ul>
              </dd>
            </dl>
            <!-- 分类筛选结束 -->
            <!-- 子类筛选开始 -->
            <dl class="clearfix" v-show="!categrayflag">
              <dt>子 类:</dt>
              <dd>
                <a href="javascript:;" :class="{active:soncategrayflag}" @click="queryAll('soncategray')">全部</a>
              </dd>
              <dd class="list-city-item">
                <ul>
                  <li v-for="(item,index) in soncategray" :key="index" @click="queryID(item.id,index,'soncategray')">
                    <a href="javascript:;" :class="{'active':soncategrayind === index}">{{item.itemType}}</a>
                  </li>
                </ul>
              </dd>
            </dl>
            <!-- 子类筛选结束 -->
            <!-- 时间筛选开始 -->
            <dl class="child clearfix">
              <dt>时 间:</dt>
              <dd>
                <a href="javascript:;" :class="{active:timeflag}" @click="queryAll('time')">全部</a>
              </dd>
              <dd class="list-city-item">
                <ul>
                  <li @click="querytime('today')">
                    <a href="javascript:;" :class="{'active':timeind == 1}">今天</a>
                  </li>
                  <li @click="querytime('tomorrow')">
                    <a href="javascript:;" :class="{'active':timeind == 2}">明天</a>
                  </li>
                  <li>
                    <Date-picker type="date" size="small" placeholder="选择日期" style="width: 150px" @on-change="handlestart"></Date-picker>
                  </li>
                  <li>-</li>
                  <li>
                    <Date-picker type="date" size="small" placeholder="选择日期" style="width: 150px" @on-change="handleChange"></Date-picker>
                  </li>
                </ul>
              </dd>
            </dl>
            <!-- 时间筛选结束 -->
          </div>
          <!-- 条件筛选结束 -->

          <!-- 排序开始 -->
          <div class="list-main">
            <Tabs type="card" :animated="false" name="name2" @on-click="recommend()">
              <Tab-pane name="name1" label="热门推荐">
                <!-- 列表开始 -->
                <ul class="clearfix">
                  <listitem :switchlist="(buttonswitch=='list')?'list':'big'" v-for="(item, index) in itemdata" :key="index" :item-info="item"></listitem>
                </ul>
                <!-- 列表大图start -->
                <!-- <ul v-show="buttonswitch=='big'" class="list-item clearfix">
                  <listitembig v-for="item in itemdata" :item-info="item"></listitembig>
                </ul> -->

                <!-- 分页 -->
                <div v-show="this.itemdescp.total > 16" class="pagena">
                  <Page :current="1" :total="this.itemdescp.total" @on-change="pageclick" :page-size="pagesize" show-total></Page>
                </div>
              </Tab-pane>
              <Tab-pane name="name2" label="最近开场">
                <!-- 列表开始 -->
                <ul class="clearfix">
                  <listitem :switchlist="(buttonswitch=='list')?'list':'big'" v-for="(item, index) in itemdata" :key="index" :item-info="item"></listitem>
                </ul>
                <!-- 分页 -->
                <div v-show="this.itemdescp.total > 16" class="pagena">
                  <Page :current="1" :total="this.itemdescp.total" @on-change="pageclick" :page-size="pagesize" show-total></Page>
                </div>

              </Tab-pane>
              <Tab-pane name="name3" label="最新上架">
                <!-- 列表开始 -->
                <ul class="clearfix">
                  <listitem :switchlist="(buttonswitch=='list')?'list':'big'" v-for="(item, index) in itemdata" :key="index" :item-info="item"></listitem>
                </ul>

                <!-- 分页 -->
                <div v-show="this.itemdescp.total > 16" class="pagena">
                  <Page :current="1" :total="this.itemdescp.total" @on-change="pageclick" :page-size="pagesize" show-total></Page>
                </div>

              </Tab-pane>

            </Tabs>
            <div class="list-radio">
              <RadioGroup v-model="buttonswitch" type="button">
                <Radio label="list">
                  <Icon type="navicon-round"></Icon>
                </Radio>
                <Radio label="big">
                  <Icon type="social-windows"></Icon>
                </Radio>
              </RadioGroup>
            </div>

          </div>
          <!-- 排序结束 -->
        </div>
        <!-- 您可能还喜欢 开始 -->
        <div class="list-right fr">
          <div class="list-box">
            <p class="list-box-title">您可能还喜欢</p>
            <div class="list-box-con">
              <!-- 猜您喜欢引入 -->
              <listitemlike v-for="(item, index) in guessinfo" :key="index" :guess="item"></listitemlike>
            </div>
          </div>
        </div>
        <!-- 您可能还喜欢 结束 -->

      </div>

    </div>

    <!-- 底部组件 -->
    <Vfooter/>

  </div>
</template>

<script>
import header from "@/components/header";
import footer from "@/components/footer";
// 引入列表组件
import listitem from "@/components/ticketlist/listitem";
// 引入你喜欢的组件
import listitemlike from "@/components/ticketlist/listitemlike";

// import { history } from 'vue-router'

export default {
  data() {
    return {
      city: [],
      ind: "",
      categrayind: "",
      soncategrayind: "",
      timeind: "",
      // 标志
      flag: true,
      categrayflag: true,
      soncategrayflag: true,
      timeflag: true,
      // 城市
      areaId: 0,
      // 分类
      parent: 0,
      itemTypeId1: 0,
      categray: [],
      // 子类
      itemTypeId2: 0,
      soncategray: "",
      // 时间
      startTime: "",
      endTime: "",
      // 分类排序字符串
      sort: "",
      // 商品信息
      itemdescp: "",
      itemdata: [],
      // button
      buttonswitch: "list",
      // 猜你喜欢
      itemTypeId: "0",
      guessinfo: [],
      // 分页
      currentpage: 1,
      pagesize: 16,
      // 关键词
      keyword: ""
    };
  },
  components: {
    Vheader: header,
    Vfooter: footer,
    listitem,
    listitemlike
  },
  // 组件挂载之后执行
  mounted() {
    // 根据关键词查找
    // console.log("keyword="+ this.$route.query.keyword)
    if (this.$route.query.keyword != "") {
      this.keyword = this.$route.query.keyword;
    }
    // 根据首页传递的分类查询
    if (
      this.$route.query.itemTypeId1 != "" &&
      this.$route.query.itemTypeId2 == ""
    ) {
      // 此时点击的是父类
      /* 
      实现步骤：
      1.加载全部分类包括分类和子类
      2.根据传递的父类ID，确认是哪一个分类，并高亮显示
      3，根据这个父类id，去请求子类并显示
      */
      // 接收首页传递的参数
      this.itemTypeId1 = this.$route.query.itemTypeId1;

      this.listPost();
      this.itemdescp.forEach((ele, index) => {
        if (ele.id == this.$route.query.itemTypeId1) {
          // 对应的传来的分类名称  ele.itemType;
          /* 判断是否为当前li，然后添加active类 */
          this.categrayind = index;
          /* 点击li之后 全部去掉active类 */
          this.categrayflag = false;
          // 父级分类的id 赋值给 parent
          this.parent = ele.id;
          // 列表页 2. 根据父级分类的id查询分类接口
          this.$http
            .postRequest({
              type: "listSortGoods",
              data: { parent: this.parent }
            })
            .then(res => {
              // console.log("查询分类接口 = " + JSON.stringify(res.data));
              this.categray = res.data;
            });
        }
      });
    } else if (
      this.$route.query.itemTypeId1 != "" &&
      this.$route.query.itemTypeId2 != ""
    ) {
      // 点击子类
      /* 
      实现步骤：
      1.加载全部分类包括分类和子类
      2.根据传递的父类ID，确认是哪一个分类，并高亮显示
      3，根据这个父类id，去请求子类并显示
      4.根据子类id，确认是哪一个子类，并高亮显示
      */
      // 接收首页传递的参数
      /* this.itemTypeId1 = this.$route.query.itemTypeId1;
      this.itemTypeId2 = this.$route.query.itemTypeId2;

      this.listPost();
      this.itemdescp.forEach((ele, index) => {
        // 判断父类的情况
        if (ele.id == this.$route.query.itemTypeId1) {
          // 对应的传来的分类名称  ele.itemType;

          // 判断是否为当前li，然后添加active类
          this.categrayind = index;
          // 点击li之后 全部去掉active类
          this.categrayflag = false;
          // 父级分类的id 赋值给 parent
          this.parent = ele.id;
          // 列表页 2. 根据父级分类的id查询分类接口
          this.$http
            .postRequest({
              type: "listSortGoods",
              data: { parent: this.parent }
            })
            .then(res => {
              // console.log("查询分类接口 = " + JSON.stringify(res.data));
              this.categray = res.data;
            });
        }
        // 判断子类的情况
        if (ele.id == this.$route.query.itemTypeId2) {
          // 判断是否为当前li，然后添加active类
          this.soncategrayind = index;
          // 点击li之后 全部去掉active类
          this.soncategrayflag = false;
        }
      }); */
    }

    // 列表页 1. 查询市区API接口(全部)
    this.$http.postRequest({ type: "listQueryCity" }).then(res => {
      // console.log(res.data);
      this.city = res.data;
    });
    // 列表页 2. 查询分类接口
    this.$http
      .postRequest({ type: "listSortGoods", data: { parent: this.parent } })
      .then(res => {
        // console.log("查询分类接口 = " + JSON.stringify(res.data));
        this.categray = res.data;
      });
    //3. 根据城市、一级分类、二级分类查询商品信息
    // 调用接口获取数据
    this.listPost();

    //4 猜你喜欢数据获取
    this.guess();
  },
  methods: {
    // 点击全部返回 0
    queryAll(name) {
      if (name == "city") {
        this.areaId = 0;
        this.flag = true;
        this.ind = "";
        // 调用接口获取数据
        this.listPost();
      } else if (name == "categray") {
        this.itemTypeId1 = 0;
        this.categrayflag = true;
        this.categrayind = "";
        // 调用接口获取数据
        this.listPost();

        // 猜你喜欢数据获取
        this.itemTypeId = "0";
        this.guess();
      } else if (name == "soncategray") {
        this.itemTypeId2 = 0;
        this.soncategrayflag = true;
        this.soncategrayind = "";
        // 调用接口获取数据
        this.listPost();
        // 猜你喜欢数据获取
        this.itemTypeId = "0";
        this.guess();
      } else {
        this.startTime = "";
        this.endTime = "";
        this.timeflag = true;
        this.timeind = "";
        // 调用接口获取数据
        this.listPost();
      }
    },
    // 点击城市获得城市ID
    queryID(id, index, name) {
      if (name == "city") {
        this.areaId = id;
        /* 判断是否为当前li，然后添加active类 */
        this.ind = index;
        /* 点击li之后 全部去掉active类 */
        this.flag = false;
        // 调用接口获取数据
        this.listPost();
      } else if (name == "categray") {
        // alert(id);
        this.itemTypeId1 = id;
        this.itemTypeId = id;
        /* 判断是否为当前li，然后添加active类 */
        this.categrayind = index;
        /* 点击li之后 全部去掉active类 */
        this.categrayflag = false;

        // 调用接口获取数据
        this.listPost();

        //获取子类
        this.parent = id;

        //  封装获取分类数据方法
        this.listcategray();

        // 猜你喜欢数据获取
        this.guess();
      } else if (name == "soncategray") {
        this.itemTypeId2 = id;
        this.itemTypeId = id;
        /* 判断是否为当前li，然后添加active类 */
        this.soncategrayind = index;
        /* 点击li之后 全部去掉active类 */
        this.soncategrayflag = false;
        // 调用接口获取数据
        this.listPost();

        // 猜你喜欢数据获取
        this.guess();
      }
    },
    // 获取日期时间函数
    GetDateStr(AddDayCount) {
      var dd = new Date();
      dd.setDate(dd.getDate() + AddDayCount); //获取AddDayCount天后的日期
      var y = dd.getFullYear();
      var m = dd.getMonth() + 1; //获取当前月份的日期
      var d = dd.getDate();
      //判断 月
      if (m < 10) {
        m = "0" + m;
      } else {
        m = m;
      }
      //判断 日n
      if (d < 10) {
        //如果天数<10
        d = "0" + d;
      } else {
        d = d;
      }
      return y + "-" + m + "-" + d;
    },
    // 获取当前时间
    querytime(date) {
      if (date == "today") {
        //  console.log( this.GetDateStr(1) );
        this.timeind = 1;
        this.timeflag = false;
        this.startTime = this.GetDateStr(0);
        this.endTime = this.GetDateStr(0);
        // 调用接口获取商品详情数据
        this.listPost();

        this.startTime = "";
        this.endTime = "";
      } else if (date == "tomorrow") {
        this.timeind = 2;
        this.timeflag = false;
        this.startTime = this.GetDateStr(1);
        this.endTime = this.GetDateStr(1);

        // 调用接口获取商品详情数据
        this.listPost();

        this.startTime = "";
        this.endTime = "";
      }
    },
    // 日历选择startTime
    handlestart(date) {
      this.startTime = date;
    },
    handleChange(date) {
      this.endTime = date;
      if (this.startTime != "") {
        // 调用接口获取商品详情数据
        this.listPost();

        this.startTime = "";
        this.endTime = "";
      } else {
        this.$Message.info("需要先选择开始时间哦");
      }
    },
    // 封装获取分类数据方法
    listcategray() {
      this.$http
        .postRequest({ type: "listSortGoods", data: { parent: this.parent } })
        .then(res => {
          // console.log("查询子类接口 = " + JSON.stringify(res.data));
          if (res.data.length > 0) {
            this.soncategray = res.data;
          } else {
            this.categray = true;
          }
        });
    },
    // 封装获取商品详情数据方法
    listPost() {
      //3. 根据城市、一级分类、二级分类查询商品信息
      this.$http
        .postRequest({
          type: "listQueryGoodsInfos",
          data: {
            areaId: this.areaId,
            itemTypeId1: this.itemTypeId1,
            itemTypeId2: this.itemTypeId2,
            startTime: this.startTime,
            endTime: this.endTime,
            // 推荐、最近等排序参数
            sort: this.sort,
            // 分页数据
            currentPage: this.currentpage,
            pageSize: this.pagesize,
            keyword: this.keyword
          }
        })
        .then(res => {
          // 这里只是接收了商品信息，没有处理分页的数据
          this.itemdescp = res.data;
          this.itemdata = res.data.rows;
          // console.log("查询商品详情 = " + JSON.stringify(this.itemdata));
        });
    },
    recommend(e) {
      // console.log(e);
      let type = e;
      if (type == "name1") {
        this.sort = "recommend";
        // this.itemTypeId1 = 0;
        // 调用接口获取数据
        this.listPost();
      } else if (type == "name2") {
        this.sort = "recentShow";
        // this.itemTypeId1 = 1;
        // 调用接口获取数据
        this.listPost();
      } else {
        this.sort = "recentSell";
        // 调用接口获取数据
        this.listPost();
      }
    },
    guess() {
      //4. 猜你喜欢接口
      this.$http
        .postRequest({
          type: "listGuessLike",
          data: {
            itemTypeId: this.itemTypeId
          }
        })
        .then(res => {
          // 这里只是接收了商品信息，没有处理分页的数据
          this.guessinfo = res.data;
          // console.log("猜你喜欢 = " + JSON.stringify(this.guessinfo));
        });
    },
    // 分页事件
    pageclick(e) {
      // console.log(e);
      // 分页中的回传数据方式定义还未完成？
      this.currentpage = e;
      // 调用接口获取数据
      this.listPost();
    }
    // 获得猜你喜欢列表项的id
    /* gainguessid(id) {
      // console.log("获得猜你喜欢列表项的id="+id)
      // console.log("获得猜你喜欢列表项的query="+query)
      // 动态跳转路由如何把参数加到url上面？
      this.$router.push({
        path: "/ticketDesc",
        name: "TicketDesc",
        params: {
          name: "TicketDesc",
          id: id
        }
      });
    } */
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../static/less/custom.less";

.list-top {
  line-height: 50px;
  color: #666;
  font-size: 14px;
  background-color: @body-background;
  p {
    padding-left: 20px;
  }
  .list-cf {
    color: @primary-color;
  }
}

.list-left {
  width: 928px;
  .list-condition {
    padding: 10px 24px 0;
    border: 1px solid #e9e9e9;
    margin-bottom: 15px;
    font-size: 14px;
    background-color: @body-background;
    dl {
      border-bottom: 1px dotted #dfdfdf;
      margin-bottom: 10px;
      padding-bottom: 5px;
      dt {
        width: 80px;
        float: left;
        line-height: 26px;
        color: #3b3a3a;
        text-align: right;
        margin-right: 18px;
      }
      dd {
        width: 50px;
        float: left;
        a {
          display: inline-block;
          height: 26px;
          line-height: 26px;
          padding: 0 8px;
          color: #333;
          white-space: nowrap;
        }
        .active {
          background-color: @primary-color;
          color: #fff;
        }
      }
      .list-city-item {
        width: 730px;
        ul {
          height: 62px;

          li {
            padding-bottom: 5px;
            float: left;
            margin-right: 24px;
            a {
              &:hover {
                background-color: @primary-color;
                color: #fff;
              }
            }
          }
        }
      }
      &:nth-child(3) {
        height: 37px;
      }
      &:last-child {
        height: 37px;
        border-bottom: none;
      }
    }
  }

  .list-main {
    margin-bottom: 40px;
    position: relative;
    background-color: @body-background;
    .list-radio {
      position: absolute;
      right: 30px;
      top: 0px;
    }
    .pagena {
      text-align: center;
    }
  }
}
.list-right {
  width: 258px;
  float: right;
  margin-left: 10px;
  background-color: @body-background;
  .list-box {
    margin-bottom: 15px;
    border: 1px solid #eaeaea;
    .list-box-title {
      height: 37px;
      line-height: 37px;
      background-color: #e6e6e6;
      border-bottom: 1px solid #eaeaea;
      font-size: 14px;
      padding: 0 15px;
    }
    .list-box-con {
      padding: 0px 15px 15px;
    }
  }
}
</style>

<style lang="less">
/* 兼容Tab 组建 */
.list-main {
  .ivu-tabs-nav-scroll {
    background: #f8f8f9;
  }
  .ivu-tabs-nav-scroll {
    .ivu-tabs-tab {
      background: #f2f2f2;
    }
  }
  .ivu-tabs.ivu-tabs-card {
    & > .ivu-tabs-bar {
      .ivu-tabs-tab {
        height: 32px;
        border-radius: 0;
        border: none;
        &:nth-child(5) {
          margin-left: 510px;
        }
      }
    }
  }
  .ivu-tabs.ivu-tabs-card {
    & > .ivu-tabs-bar {
      .ivu-tabs-tab-active {
        color: #ff3c1b;
      }
    }
  }
  .ivu-tabs {
    border: 1px solid #ececec;
    padding-bottom: 10px;
  }

  .ivu-tabs-nav {
    .ivu-tabs-tab {
      .ivu-icon {
        font-size: 18px;
        margin-right: 0;
      }
    }
  }
  /* .ivu-tabs-tabpane {
    li {
      &:last-child {
        border-bottom: 0;
      }
    }
  } */
}
</style>