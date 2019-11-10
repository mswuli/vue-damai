<template>
  <div class="card" v-if="hotItem">
    <router-link class="card-pic" :to="{ path: '/ticketDesc', query: { id: hotItem.id }}">
      <img :src="hotItem.imgUrl" alt="img1">
      <div class="card-hide">
        <p>{{hotItem.itemName}}</p>
        <p>2017.12.03 19:30</p>
      </div>
    </router-link>
    <h2 class="card-title">{{hotItem.itemName}}</h2>
    <p class="card-price">票价：
      <span>¥{{hotItem.minPrice}}</span>
    </p>
  </div>
</template>
<script>
import pic1 from "./img/cardimg1.jpg";

export default {
  data() {
    return {
      cardPic: pic1
    };
  },
  props: ['hotItem']
};
</script>

<style  lang='less' scoped>
.card {
  width: 146px;

  .card-pic {
    width: 146px;
    height: 192px;
    display: inline-block;
    position: relative;

    img {
      width: 146px;
      height: 192px;
    }
    .card-hide {
      width: 146px;
      padding: 10px;
      box-sizing: border-box;
      color: #fff;
      background-color: rgba(202, 61, 34, 0.9);
      position: absolute;
      left: 0;
      bottom: 0;
      display: none;

      p {
        width: 126px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: clip;
        line-height: 24px;
        padding-left: 18px;
        padding-right: 2px;
      }

      p:first-of-type {
        background: transparent url(./img/icon1.png) 0 center no-repeat;
      }
      p:last-of-type {
        background: transparent url(./img/icon2.png) 0 center no-repeat;
      }
    }
  }
  .card-pic:hover .card-hide {
    display: block;
  }

  .card-title {
    width: 146px;
    box-sizing: border-box;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    padding: 12px 2px 6px;
    /* border: 1px solid red; */
  }
  .card-price {
    margin: 6px 2px;

    span {
      color: #000;
    }
  }
}
</style>
