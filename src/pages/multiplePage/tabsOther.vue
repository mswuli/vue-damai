<template>
  <div class="dm-tabs-other">
    <Tabs value="0" type="card" @on-click="getData" :animated="false">
      <TabPane name="0" label="音乐会专区">
        <dmCard v-for="item in allSearch0 " :data="item" :key="item.id" :param="card" />
      </TabPane>
      <TabPane name="1" label="舞蹈专区">
        <dmCard v-for="item in allSearch1 " :data="item" :key="item.id" :param="card" />
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
      allSearch2: []
    };
  },
  components: {
    dmCard
  },
  methods: {
    getData(param) {
      this.$http
        .postRequest({
          type: "getParentChild",
          data: { ageGroup: param, limit: 6 }
        })
        .then(res => {
          if (res.data.length > 0) {
            this["allSearch" + param] = res.data;
          } else {
            this["allSearch" + param] = [];
          }
        });
    }
  },
  mounted() {
    this.getData(0);
  }
};
</script>

<style lang="less" >
.dm-tabs-other {
  .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab {
    border-radius: 0;
    background: #fff;
    margin-right: 0;
  }
  .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab-active {
    border-top: 1px solid #ff3c1b;
  }
  .ivu-tabs.ivu-tabs-card > .ivu-tabs-bar .ivu-tabs-tab-active:before {
    content: "";
    display: block;
    width: 100%;
    height: 1px;
    background: #ff3c1b;
    position: absolute;
    top: 0;
    left: 0;
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

