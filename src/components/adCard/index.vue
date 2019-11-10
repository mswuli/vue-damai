<template>
  <div class="ad-card">
    <router-link :to="{ path: '/ticketDesc', query: { id: headCard.id }}">
      <img :src="headCard.imgUrl" alt="">
      <div class="ad-hide">
        <h3>{{headCard.itemName}}</h3>
        <p>{{headCard.minPrice}}元</p>
      </div>
    </router-link>
  </div>
</template>
<script>
import adimg from "./img/adimg.jpg";

export default {
  data() {
    return {
      cardPic: adimg
    };
  },
  methods: {},
  props: ['headCard']
};
</script>

<style lang='less'  scoped>
.ad-card {
  width: 238px;
  height: 364px;

  a {
    width: 238px;
    height: 364px;
    display: inline-block;
    position: relative;
  }
  img {
    width: 238px;
    height: 364px;
  }
  .ad-hide {
    width: 238px;
    height: 112px;
    padding: 20px;
    box-sizing: border-box;
    color: #fff;
    position: absolute;
    left: 0;
    bottom: 0;
    background-color: rgba(184, 43, 19, 0.9);

    p {
      margin-top: 10px;
    }
  }
}


</style>
