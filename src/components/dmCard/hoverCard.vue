<template>
    <div ref='hoverDom' class="hover-card">
        <a class="card-pic"  :href="'/#/ticketDesc?id='+id" target="_blank">
            <img :src="imgUrl" alt="img1">
            <div class="card-hide">
                <p>{{name}}</p>
                <p>{{startDate}}</p>
            </div>
        </a>
        <h2 class="card-title">{{name}}</h2>
        <p class="card-price">票价：
            <span>¥{{minPrice}}</span> 起
        </p>
    </div>
</template>
<script>
export default {
  data() {
    return {
      imgUrl: this.getByKey('imgUrl'),
      name: this.getByKey('itemName'),
      startDate:this.getByKey('startDate'),
      endDate: this.getByKey('endDate'),
      id: this.getByKey('id'),
      minPrice: this.getByKey('minPrice'),
      address:this.getByKey('address')
    };
  },
  methods: {
    init() {},
    getByKey(key){
      return  this.data != undefined && this.data[key]
          ? this.data[key]
          : "";
    }
  },
  mounted() {
    this.init();
  },props:['data']
};
</script>
<style lang="less" scoped>
.hover-card {
  .card-pic {
    width: 100%;
    height: 100%;
    display: inline-block;
    position: relative;
    img {
      width: 100%;
      height: 100%;
    }

    .card-hide {
      width: 100%;
      padding: 10px;
      box-sizing: border-box;
      color: #fff;
      background-color: rgba(202, 61, 34, 0.9);
      position: absolute;
      left: 0;
      bottom: 0;
      display: none;
    }

    .card-hide p {
      width: 126px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: clip;
      line-height: 24px;
      padding-left: 18px;
      padding-right: 2px;
    }
    .card-hide p:first-of-type {
      background: transparent url(./img/icon1.png) 0 center no-repeat;
    }
    .card-hide p:last-of-type {
      background: transparent url(./img/icon2.png) 0 center no-repeat;
    }
  }
  .card-pic:hover .card-hide {
    display: block;
  }
  .card-title {
    width: 100%;
    box-sizing: border-box;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    padding: 12px 2px 6px;
    /* border: 1px solid red; */
  }
  .card-price {
    margin: 6px 2px;
    color: #ccc;
  }
  .card-price span {
    color: #000;
  }
}
</style>
