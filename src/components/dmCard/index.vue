<template>
  <div class="dm-card">
    <hoverCard  :param="param" :data="data" v-if="param.type =='hover' " />
    <overCard   :param="param" :data="data"  v-if="param.type =='over' " />
    <floorCard  :param="param" :data="data" :hot='hot' v-if="param.type =='floor' " />
  </div>
</template>
<script>
import floorCard from "./floorCard";
import hoverCard from "./hoverCard";
import overCard from "./overCard";
import pic1 from "./img/cardimg1.jpg";
import pic7 from "./img/img_07.png";

export default {
  data() {
    return {
      cardPic: pic1,
      card7: pic7
    };
  },
  props: ["param","data",'hot'],
  mounted() {},
  components: {
    floorCard,
    hoverCard,
    overCard
  }
};
</script>
<style lang="less">
.dm-card {
  width: 100%;
  height: 100%;
  display: inline-block;
}
</style> 