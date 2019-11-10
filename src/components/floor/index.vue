<template>
  <div>
    <div class="floor" v-for="(floor, index) in floors" :key="floor.id">
      <div class="floor-left">
        <floorLeft :floor="floor"/>
      </div>
      <div class="floor-right">
        <floorRight :itemTypeId="floor.itemTypeId" />
      </div>
    </div>
  </div>
</template>
<script>
import floorLeft from "@/components/floorLeft";
import floorRight from "@/components/floorRight";
// import pic1 from "./img/cardimg1.jpg";

export default {
  components: { floorLeft, floorRight },
  data() {
    return {
      // cardPic: pic1
    };
  },
  props: ['floors'],
  methods: {}
};
</script>

<style lang='less'  scoped>
.floor {
  overflow: hidden;
  margin-bottom: 30px;
}
.floor-left {
  float: left;
  background-color: #fff;
  /* 目的：实现等高布局 */
  padding-bottom: 1000px;
  margin-bottom: -1000px;
}

.floor-right {
  float: right;
  background-color: #fff;
  /* 目的：实现等高布局 */
  padding-bottom: 1000px;
  margin-bottom: -1000px;
}
</style>
