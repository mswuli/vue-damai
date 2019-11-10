<template>
  <!-- <div class="list-item"> -->
    <li class="list-item"> 
      <div class="list-img">
        <a href="#"><img :src="itemInfo.imgUrl" alt=""></a>
        <p>{{itemInfo.adress}}</p>
      </div>
      <div class="list-txt">
        <h3>
          <span>[{{itemInfo.areaName}}]</span>
          <a href="#">{{itemInfo.itemName}}</a>
        </h3>
        <p class="list-txt-time">
          {{itemInfo.startTime}}
        </p>
        <p class="list-txt-price">
          <em>{{itemInfo.minPrice}}-{{itemInfo.maxPrice}}元</em>
          售票中
        </p>
      </div>
    </li>
  <!-- </div> -->
</template>

<script>
// import imgitem from "./img/big180246.jpg";

export default {
  data() {
    return {
      // imgurl: imgitem
    };
  },
  components: {},
  props: ["itemInfo"]
};
</script>

<style lang="less" scoped>

  .list-item {
    padding: 5px 3px;
    width: 180px;
    height: 385px;
    float: left;
    padding: 25px 0 18px;
    margin: 0 18px;
    .list-img {
      width: 180px;
      height: 246px;
      position: relative;

      img {
        width: 180px;
        height: 246px;
      }
      p {
        position: absolute;
        left: 0;
        bottom: 0;
        width: 100%;
        height: 30px;
        line-height: 30px;
        text-align: center;
        background-color: #ca3015;
        color: #fff;
        overflow: hidden; /*超出部分隐藏*/
        white-space: nowrap; /*不换行*/
        text-overflow: ellipsis; /*超出部分文字以...显示*/
      }
    }

    .list-txt {
      h3 {
        margin-top: 6px;
        margin-bottom: 6px;
        height: 36px;
        overflow: hidden;
      }
      p {
        margin-bottom: 6px;
        color: #999;
      }
      .list-txt-price {
        em {
          color: #ff3c1b;
          font-weight: bold;
          font-size: 14px;
          margin-right: 20px;
          font-style: normal;
        }
      }
    }
  }

</style>
