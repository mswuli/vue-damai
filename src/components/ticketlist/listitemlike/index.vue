<template>
    <div class="page">
        <ul class="list-recomm">
            <li class="clearfix" @click="guesslike">
                <a href="javascript:;"><img :src="guess.imgUrl" alt=""></a>
                <div class="infos">
                    <div class="title">
                        <a href="javascript:;">{{guess.itemName}}</a>
                    </div>
                    <p>{{guess.address}}</p>
                    <p>{{guess.startDate}}-{{guess.endDate}}</p>
                    <p class="price">
                        <strong>{{guess.minPrice}}元</strong>
                        起
                    </p>
                </div>
            </li>
        </ul>
    </div>
</template>

<script>
// import imgitem from "./img/recomm98132.jpg";

export default {
  data() {
    return {
      // imgurl: imgitem
    };
  },
  components: {},
  props:['guess'],
  methods: {
    guesslike(){
      this.$router.push({
        path: "TicketDesc",
        query: { id: this.guess.id }
      });
    }
  }
};
</script>

<style lang="less" scoped>
.list-recomm {
  li {
    margin-top: 20px;
    height: 132px;
    overflow: hidden;
    a {
      width: 98px;
      height: 132px;
      float: left;
      img {
        width: 100%;
        height: 100%;
        display: block;
      }
    }
    .infos {
      float: left;
      width: 123px;
      padding-left: 10px;
      .title {
        height: 48px;
        line-height: 16px;
        margin-bottom: 15px;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
      }
      p {
        color: #999;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }
      .price {
        color: #999;
        padding-top: 14px;
        strong {
          color: #ff3c1b;
          font-size: 14px;
          padding-right: 5px;
        }
      }
    }
  }
}
</style>
