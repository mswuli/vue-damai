<template>
  <div class="desc-footer">
    <div class="footer-left">
      <Tabs value="name1" type="card" @on-click="tabsClick" :animated="false" style="width: 918px;">
        <TabPane label="演出信息" name="name1">
          <showMessage :item-data="itemData" />
        </TabPane>
        <TabPane label="精彩剧评" name="name2">
          <writeComments :item-data="itemData" />
        </TabPane>
        <TabPane label="购买说明" name="name3">
          <byInfo/>
        </TabPane>
        <TabPane label="付款方式" name="name4">
          <payInfo/>
        </TabPane>
      </Tabs>
    </div>
    <div class="footer-right">
      <rightList :item-data="rightListData"  />
      <div class="right-list" style=" margin-top: 10px;" >
        <!-- width: 262px; -->
        <div class="right-ad-title">
          <span class="h4">浏览历史</span>
        </div>
        <div class="right-ad-body">
          <p v-for="item in itemData.browsHistory.data">
            <a :href="item.url">{{item.title}}</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import showMessage from "./showMessage";
import writeComments from "./writeComments";
import byInfo from "./byInfo";
import payInfo from "./payInfo";
import rightList from "@/components/rightList";
export default {
  data() {
    return {
      comments: [],
      rightListData: {
        title: "热门推荐",
        data: []
      }
    };
  },
  methods: {
    tabsClick(e) {
      console.log(e);
    }
  },
  props: ["itemData"],
  components: {
    showMessage,
    writeComments,
    byInfo,
    payInfo,
    rightList
  },
  mounted() {
    this.$http
      .postRequest({ type: "getRecommend", data: { itemTypeId: 20 } })
      .then(res => {
        if (res.data && res.data.length > 0) {
          this.rightListData.data = res.data;
        }
        //  console.log(this.rightListData);
      });
    // getRecommend
  }
};
</script>

<style lang="less">
.desc-container {
  .desc-footer {
    overflow: hidden;
    .footer-left {
      width: 925px;
      float: left;
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
      .ivu-tabs-tab{
        border: 0;
      }
      .ivu-tabs-nav-scroll {
        background: #fff;
      }
      .ivu-tabs-content {
        padding-left: 5px;
        background: rgb(255, 255, 255);
        margin-top: -16px;
        padding-top: 20px;
        padding-bottom: 20px;
      }
    }
    .footer-right {
      width: 275px;
      float: left;
      .right-list {
        padding: 5px;
        background: #fff;
        padding-top: 5px;
        line-height: 24px;
        .right-ad-title:after {
          content: " ";
          width: 100%;
          display: block;
          margin-top: 3px;
          border-bottom: 1px solid #ccc;
        }
        .right-ad-body {
          padding-top: 13px;
          .ad-body-img {
            text-align: center;
            color: #727272;
          }
          p:after {
            content: " ";
            width: 100%;
            display: block;
            margin-top: 3px;
            border-bottom: 1px dotted #ccc;
          }
          p:last-child:after {
            content: " ";
            width: 100%;
            display: block;
            margin-top: 3px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 30px;
          }
          p > span {
            color: #727272;
          }
        }
      }
    }
  }
}
</style>
 
