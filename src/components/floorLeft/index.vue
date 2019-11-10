<template>
  <div class="floor-left">
    <h2>
      <i>{{floor.index}}F</i>
      <span>{{floor.itemTypeName}}</span>
    </h2>
    <div class="card-list" v-if="floor.items.length">
      <div class="ad-card">
        <adCard :headCard="floor.items[0]" />
      </div>
      <div class="floor-card-list">
        <floorCardList :listCard="floor.items.slice(1)" />
      </div>
    </div>
  </div>
</template>
<script>
// import pic1 from "./img/cardimg1.jpg";
import adCard from "@/components/adCard";
import floorCardList from "@/components/floorCardList";

export default {
  components: { adCard, floorCardList },
  data() {
    return {
      // cardPic: pic1
    };
  },
  props: ['floor']
};
</script>

<style  lang='less' scoped>
.floor-left {
  width: 896px;

  h2 {
    padding: 20px 0 20px 26px;
  }
  .floor-left i {
    font-size: 18px;
    font-weight: bold;
    color: #ff3c1b;
  }
  span {
    font-size: 16px;
  }
  .card-list {
    overflow: hidden;
    padding: 0 20px 40px 26px;
  }
  .ad-card {
    float: left;
  }
  .floor-card-list {
    float: right;
  }
}
</style>
