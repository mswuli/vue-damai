<template>
  <div class="floor-right">
    <a class="seeAll" href="javascript:;">查看全部 >></a>
    <h2>热门演出排行</h2>
    <ul>
      <li v-for="(item, index) in data" :key="item.id">
        <router-link  :to="{ path: '/ticketDesc', query: { id: item.id }}">
        <!-- 方法一： -->
          <!-- <span :class="getClass(index)">{{index + 1}}</span> -->
          <!-- 方法二： -->
          <span :class="index > 2? '': 'prominent'">{{index + 1}}</span>
          <a href="javascript:;">{{item.itemName}}</a>
        </router-link>
      </li>
    </ul>
  </div>
</template>
<script>
// import pic1 from "./img/cardimg1.jpg";

export default {
  data() {
    return {
      data: []
    };
  },
  methods: {
    // 分类信息中前三条添加class使之背景颜色变红
    getClass(index){
      return index<=2?'prominent':'';
    }
  },
  props: ["itemTypeId"],
  mounted() {
    // 获取分类排行接口
    this.$http.postIndexSeniority(this.itemTypeId).then(res => {
      this.data = res.data;
    });
  }
};
</script>

<style  lang='less' scoped>
.floor-right {
  width: 280px;
  box-sizing: border-box;
  padding: 6px 24px 24px 26px;

  .seeAll {
    float: right;
    margin-top: 10px;
  }
  h2 {
    margin-top: 10px;
    font-size: 18x;
    line-height: 44px;
  }
  ul {
    margin-top: 6px;
    margin-bottom: 10px;
  }
  ul li {
    line-height: 30px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  ul li a {
    padding-left: 6px;
  }
  ul li .prominent {
    background-color: #ff3c1b;
  }
  ul li span {
    width: 16px;
    height: 12px;
    line-height: 12px;
    display: inline-block;
    background-color: gray;
    color: #fff;
    text-align: center;
  }
}
</style>
