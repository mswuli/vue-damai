<template>
  <div :class="'floor-card ' + extendType">
    <div class="floor-card-img">
      <div :class="'wrap wrap-'+hotType ">
        <span class="ribbon6">TOP{{hotType}}</span>
      </div>
      <a :href="'/#/ticketDesc?id='+id" target="_blank">
        <img :src="imgUrl" alt="">
      </a>
    </div>
    <div class="floor-card-text">
      <h3>{{name}}</h3>
      <p>{{startDate}}-{{endDate}}</p>
      <p>{{address}}</p>
      <p>¥ {{minPrice}}起</p>
    </div>
  </div>
</template>
<script>
import pic1 from "./img/floorcard1.jpg";
import pic3 from "./img/img_03.png";

export default {
  data() {
    return {
      extendType: (() => {
        return this.param.extendType ? this.param.extendType.join(" ") : " ";
      })(),
      hotType: (() => {
        return this.hot != undefined && this.hot ? this.hot : "default";
      })(),
      imgUrl: this.getByKey("imgUrl"),
      name: this.getByKey("itemName"),
      startDate: this.getByKey("startDate"),
      endDate: this.getByKey("endDate"),
      id: this.getByKey("id"),
      minPrice: this.getByKey("minPrice"),
      address: this.getByKey("address")
    };
  },
  methods: {
    getByKey(key) {
      return this.data != undefined && this.data[key] ? this.data[key] : "";
    }
  },
  props: ["param", "hot", "data"]
};
</script>

<style  lang='less' scoped>
.floor-card {
  overflow: hidden;
  .floor-card-img {
    float: left;
    img {
      width: 112px;
      height: 150px;
    }
    .wrap {
      display: none;
    }
  }
  .floor-card-text {
    float: left;
    width: 156px;
    margin-left: 8px;
    h3 {
      font-weight: bold;
      margin-bottom: 40px;
    }
    p {
      line-height: 24px;
    }
  }
}
.horizontal {
  min-width: 276px;
  display: inline;
  .floor-card-img {
    img {
      width: 212px;
      height: 100px;
    }
  }
  .floor-card-text {
    h3 {
      margin-bottom: 5px;
    }
    p {
      line-height: 20px;
    }
  }
}
// vertical  horizontal
.hot {
  .floor-card-img {
    position: relative;
    .wrap {
      width: 52px;
      height: 52px;
      position: absolute;
      overflow: hidden;
      display: inline-block;
    }
    .ribbon6 {
      display: inline-block;
      text-align: center;
      width: 75px;
      height: 20px;
      // line-height: 40px;
      color: #ffffff;
      position: absolute;
      top: 10px;
      left: -20px;
      z-index: 2;
      overflow: hidden;
      transform: rotate(-45deg);
      -ms-transform: rotate(-45deg);
      -moz-transform: rotate(-45deg);
      -webkit-transform: rotate(-45deg);
      -o-transform: rotate(-45deg);
      border: 1px dashed;
      // box-shadow: 0 0 0 3px #57dd43, 0px 21px 5px -18px rgba(0, 0, 0, 0.6);
      background: #e20c29;
    }
  }
}
</style>
