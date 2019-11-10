<template>
  <div class="good-classify-list">
    <!-- 左边商品分类 -->
    <div class="classify-list">
      <h2>全部商品分类</h2>
      <ul>
        <li v-for="(item, index) in siderMenu" :key="item.id" @mouseenter="enter(index)">
          <!-- router-link 跳转路由，其中path是要跳转的路径，query是要带的参数 -->
          <router-link :to="{ path: '/ticketList', query: { id: item.id }}">
            <img :src="iconPics[index].imgurl" alt="">
            <span>{{item.itemType}}</span>
          </router-link>
        </li>
      </ul>
    </div>
    <!-- 隐藏的导航弹出 -->
    <div class="classify-hide" v-if="onoff">
      <!-- 隐藏的导航弹出部分的二级分类导航 -->
      <div class="classify-hide-tab">
        <h2>
          <span>{{curItemType}}</span>
        </h2>
        <span class="jiantou2"></span>
        <ul>
          <li v-for="item2 in twoLeaveData" :key="item2.id">
            <router-link :to="{ path: '/ticketList', query: { id: item2.id, pid }}">{{item2.itemType}}</router-link>
          </li>
        </ul>
        <i @click="close"></i>
      </div>
      <!-- 隐藏的导航弹出部分的主体内容 -->
      <div class="classify-hide-main">
        <h2>相关热门</h2>
        <!-- 引入热门列表组件 -->
        <ul class="clearfix">
          <li v-for="item3 in hotItems" :key="item3.id">
            <card :hotItem="item3" />
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import card from "@/components/card1";
import pic1 from "./img/yanchanghui.png";
import pic2 from "./img/yinyuehui.png";
import pic3 from "./img/hjgj.png";
import pic4 from "./img/qyzt.png";
import pic5 from "./img/tybs.png";
import pic6 from "./img/etqz.png";
import pic7 from "./img/wdbl.png";

export default {
  components: { card },
  data() {
    return {
      onoff: false,
      // listImg: pic1,
      activeIndex: -1,
      iconPics: [
        { imgurl: pic1 },
        { imgurl: pic2 },
        { imgurl: pic3 },
        { imgurl: pic4 },
        { imgurl: pic5 },
        { imgurl: pic6 },
        { imgurl: pic7 }
      ]
    };
  },
  props: ["siderMenu"],
  methods: {
    // 方法  鼠标移入时触发的enter事件
    enter(index) {
      // 把鼠标移入的当前索引值赋值给activeIndex
      this.activeIndex = index;
      this.onoff = true;
    },
    // 鼠标点击小叉关闭二级分类
    close() {
      this.onoff = false;
      this.activeIndex = -1;
    }
  },
  computed: {
    // 计算后的属性，能选择到当前的分类名称
    curItemType() {
      if (this.activeIndex > -1) {
        return this.siderMenu[this.activeIndex].itemType;
      } else {
        return "";
      }
    },
    // 能选择到当前选中分类下面的子元素
    twoLeaveData() {
      if (this.activeIndex > -1) {
        return this.siderMenu[this.activeIndex].children;
      } else {
        return [];
      }
    },
    // 能选择到当前选中分类下面的相关热门
    hotItems() {
      if (this.activeIndex > -1) {
        return this.siderMenu[this.activeIndex].hotItems;
      } else {
        return [];
      }
    },
    pid () {
      if (this.activeIndex > -1) {
        return this.siderMenu[this.activeIndex].id
      } else {
        return 0;
      }
    }
  }
};
</script>

<style lang='less'  scoped>
.good-classify-list {
  width: 202px;

  .classify-list {
    h2 {
      height: 50px;
      line-height: 50px;
      background-color: #000;
      color: #fff;
      text-align: center;
      font-weight: bold;
    }
    ul {
      height: 420px;
      background-color: #ff3c1b;
      li {
        width: 202px;
        height: 50px;
        line-height: 50px;

        a {
          width: 202px;
          height: 50px;
          line-height: 50px;
          display: inline-block;
          color: #fff;
          background: url(./img/jiantou.png) 180px center no-repeat;

          img {
            width: 20px;
            height: 20px;
            margin-left: 32px;
            vertical-align: middle;
            // border: 1px solid yellow;
          }

          span {
            vertical-align: middle;
            margin-left: 14px;
          }
        }
        a:hover {
          background-color: #de290a;
        }
      }
    }
  }

  .classify-hide {
    width: 900px;
    height: 420px;
    background-color: rgba(218, 230, 244, 0.9);
    position: absolute;
    top: 50px;
    left: 200px;
    z-index: 2;

    .classify-hide-tab {
      height: 64px;
      line-height: 64px;
      margin: 0 22px;
      border-bottom: 1px dashed #000;

      h2 {
        float: left;
        span {
          padding: 6px 18px;
          background-color: #fff;
          border-radius: 10px;
        }
      }
      .jiantou2 {
        width: 7px;
        height: 7px;
        float: left;
        margin: 29px 0 0 12px;
        background: transparent url(./img/jiantou2.png) 0 0 no-repeat;
      }
      ul {
        float: left;
        li {
          float: left;
          margin-left: 16px;
        }
        li::after {
          content: "|";
          margin-left: 16px;
        }
        li:last-child::after {
          content: "";
        }
      }
      i {
        width: 14px;
        height: 14px;
        float: right;
        margin-top: 25px;
        cursor: pointer;
        background: transparent url(./img/close.png) 0 0 no-repeat;
      }
    }
    .classify-hide-main {
      h2 {
        font-size: 18px;
        margin: 18px 0 18px 22px;
      }
      ul {
        padding-left: 7px;
        overflow: hidden;
        width: 900px;
        li {
          float: left;
          margin: 0 15px;
        }
      }
    }
  }
}
</style>
