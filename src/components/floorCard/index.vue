<template>
  <div class="floor-card">
    <div class="floor-card-img">
      <router-link :to="{ path: '/ticketDesc', query: { id: card.id }}">
        <img :src="card.imgUrl" alt="">
      </router-link>
    </div>
    <div class="floor-card-text">
      <h3>{{card.itemName}}</h3>
      <p>{{card.startDate}}-{{card.endDate}}</p>
      <p>{{card.address}}</p>
      <p>¥ {{card.minPrice}}起</p>
    </div>
  </div>
</template>
<script>
import pic1 from "./img/floorcard1.jpg";

export default {
  data() {
    return {
      cardPic: pic1
    };
  },
  methods: {},
  props: ['card']
};
</script>

<style  lang='less' scoped>
.floor-card {
  /* width: 578px; */
  /* border: 1px solid red; */
  overflow: hidden;

  .floor-card-img {
    float: left;

    img {
      width: 112px;
      height: 150px;
    }
  }

  .floor-card-text {
    float: left;
    width: 156px;
    margin-left: 8px;

    h3 {
      font-weight: bold;
      margin-bottom: 40px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
    p {
      line-height: 28px;
       width: 156px;
       overflow: hidden;
       text-overflow: ellipsis;
       white-space: nowrap;
    }
  }
}
</style>
