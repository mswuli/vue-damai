<template>
  <div class="right-list">
    <!-- width: 262px; -->
    <div class="right-ad-title">
      <span class="h4">{{itemData.title}}</span>
    </div>
    <div class="right-ad-body">
      <div ref="rightList" class="ad-body-img" v-for="(item,index) in itemData.data">
        <a :href="'#/ticketDesc?id='+item.id" class="ad-img">
          <img :src="item.imgUrl" alt=""> {{item.itemName}}
        </a>
        <h3 @mouseover="mouseover" class="ad-desc">
          <a :href="'#/ticketDesc?id='+item.id">
            {{item.itemName}}<br>
            <span>{{item.startDate+'-'+item.endDate}}</span>
          </a>
        </h3>
      </div>

    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  methods: {
    mouseover(e) {
      this.ele.className = "ad-body-img";
      this.ele = e.currentTarget.parentElement;
      this.ele.className = "ad-body-img active";
    }
  },
  mounted() {
    if (this.$refs.rightList !=undefined)  {
      this.ele = this.$refs.rightList[0];
      this.ele.className = "ad-body-img active";
    }
  },
  updated() {
    this.ele = this.$refs.rightList[0];
    this.ele.className = "ad-body-img active";
  },
  props: ["itemData"]
};
</script> 
 <style lang="less" scoped>
.right-list {
  padding-top: 5px;
  padding: 5px;
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
      margin-top: 10px;
      color: #727272;
      .ad-img {
        display: none;
        img{
          width: 265px;
        }
      }
      .ad-desc {
        display: block;
      }
    }
    .active {
      .ad-img {
        display: block;
      }
      .ad-desc {
        display: none;
      }
    }
    .ad-body-img h3 {
      text-align: left;
    }
    div:after {
      content: " ";
      width: 100%;
      display: block;
      margin-top: 3px;
      border-bottom: 1px dotted #ccc;
    }
    div:last-child:after {
      content: " ";
      width: 100%;
      display: block;
      margin-top: 3px;
      border-bottom: 1px solid #ccc;
      margin-bottom: 30px;
    }
    div > span {
      color: #727272;
    }
  }
}
</style>

