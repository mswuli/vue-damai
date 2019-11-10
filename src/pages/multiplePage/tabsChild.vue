<template>
  <div class="dm-tabs-child">
    <Tabs value="0" @on-click='getData' type="card" :animated="false">
      <TabPane name="0">
        <dmCard v-for="item in allSearch0 " :data='item' :param="card" :key='item.id' />
      </TabPane>
      <TabPane name="1">
        <dmCard v-for="item in allSearch1 " :data='item' :param="card" :key='item.id' />
      </TabPane>
      <TabPane name="2">
        <dmCard v-for="item in allSearch2 " :data='item' :param="card" :key='item.id' />
      </TabPane>
      <TabPane name="3">
        <dmCard v-for="item in allSearch3 " :data='item' :param="card" :key='item.id' />
      </TabPane>
    </Tabs>
  </div>
</template>
<script>
import dmCard from "@/components/dmCard";
export default {
  data() {
    return {
      card: {
        type: "floor",
        extendType: ["horizontal"]
      },
      allSearch0: [],
      allSearch1: [],
      allSearch2:[],
      allSearch3: []
    };
  },
  components: {
    dmCard
  },
  props: ['data'],
  methods: {
    getData(param) {
      this.$http
        .postRequest({
          type: "getParentChild",
          data: { ageGroup: param,limit:6 }
        })
        .then(res => {
          if (res.data.length > 0) {
            this['allSearch'+param] = res.data;
          } else {
            this['allSearch'+param] = [];
          }
        });
    }
  },
  mounted () {
    this.getData(0);
  }
};
</script>

<style lang="less">
.dm-tabs-child {
  .ivu-icon-record {
    color: #fff;
    font-size: 0.5px;
    position: absolute;
    left: 5px;
    top: 3px;
  }
  .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab {
    border-radius: 14px 14px 0px 0px;
    margin-right: 9px;
    font-family: "Microsoft YaHei";
    width: 100px;
    height: 50px;
    background-size: 100% auto;
  }
  /*  
tabsChild_12.png
tabsChild_3.png
tabsChild_6.png */
  .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab:nth-child(2) {
    background-image: url("./img/tabsChild_1.png");
    background-size: 100%;
    background-color: #ff3c1b;
  }
  .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab:nth-child(3) {
    background-image: url("./img/tabsChild_3.png");
    background-color: #ff467a;
  }
  .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab:nth-child(4) {
    background-image: url("./img/tabsChild_6.png");
    background-color: #84b91e;
  }
  .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab:nth-child(5) {
    background-image: url("./img/tabsChild_12.png");
    background-color: #36aee6;
  }

  .ivu-tabs-card
    > .ivu-tabs-bar
    .ivu-tabs-tab.ivu-tabs-tab-active:nth-child(2) {
    background-image: url("./img/tabsChild_1_hover.png");
  }
  .ivu-tabs-card
    > .ivu-tabs-bar
    .ivu-tabs-tab.ivu-tabs-tab-active:nth-child(3) {
    background-image: url("./img/tabsChild_3_hover.png");
  }
  .ivu-tabs-card
    > .ivu-tabs-bar
    .ivu-tabs-tab.ivu-tabs-tab-active:nth-child(4) {
    background-image: url("./img/tabsChild_6_hover.png");
  }
  .ivu-tabs-card
    > .ivu-tabs-bar
    .ivu-tabs-tab.ivu-tabs-tab-active:nth-child(5) {
    background-image: url("./img/tabsChild_12_hover.png");
  }

  .ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab.ivu-tabs-tab-active {
    background-color: #ffffff;
  }
  .ivu-tabs-content {
    padding-left: 5px;
    background: rgb(255, 255, 255);
    margin-top: -16px;
    padding-top: 20px;
  }
  .dm-card {
    width: 398px;
    height: 100px;
    margin-bottom: 5px;
  }
}
</style>

