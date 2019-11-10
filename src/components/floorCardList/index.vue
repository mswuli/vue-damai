<template>
  <div class="floor-card-list">
    <ul>
      <li v-for="item in listCard" :key="item.id">
        <floorCard :card="item" />
      </li>
    </ul>

  </div>
</template>
<script>
// import pic1 from "./img/cardimg1.jpg";
import floorCard from "@/components/floorCard";

export default {
  components: { floorCard },
  data() {
    return {
      // cardPic: pic1
    };
  },
  methods: {},
  props: ['listCard']
};
</script>

<style  lang='less' scoped>
.floor-card-list {
  width: 578px;
  /* border: 1px solid blue; */

  ul {
    overflow: hidden;
  }
  ul li {
    width: 50%;
    float: left;
    margin-bottom: 54px;
  }
  /* 设置最后一个和倒数第二个元素没有下边距 */
  ul li:last-of-type,
  ul li:nth-last-of-type(2) {
    margin-bottom: 0px;
  }
}
</style>
