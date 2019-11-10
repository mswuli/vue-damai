<template>
  <div class="carousel">
    <Carousel autoplay v-model="value" loop>
      <CarouselItem v-for="item in carouselData" :key="item.id">
        <div class="demo-carousel">
          <router-link class="card-pic" :to="{ path: '/ticketDesc', query: { id: item.id }}">
            <img :src="item.imgUrl" alt="">
          </router-link>
        </div>
      </CarouselItem>
    </Carousel>
  </div>
</template>
<script>
// import pic1 from "./img/pic1.jpg";

export default {
  data() {
    return {
      value: 0
      // carouselPic: pic1
    };
  },
  props: ['carouselData']
};
</script>

<style  lang='less' scoped>
.carousel {
  width: 100%;
  height: 420px;
  background: #f5f5f5;
  text-align: center;

  img {
    // width: 1366px;
    width: 1200px;
    height: 420px;
  }
}
</style>
