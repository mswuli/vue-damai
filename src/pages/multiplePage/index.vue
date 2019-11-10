<template>
  <div>
    <headerSimple/>
    <div class="container multiple-page-container">
      <div class="dm-multiple-tabs">
        <a href="/#/" target="_blank" class="dm-tabs-title ">首页</a>
        <a ref='title1' :href="'/#/multiplePage?page='+key" target="_blank" :class="'dm-tabs-title '+(key==currentKey?'active':'') " v-for="(item,key) in titleData">{{item.aliasName}}</a>
      </div>
      <div class="dm-multiple-carousel">
        <Carousel autoplay loop>
          <CarouselItem v-for="item in carouselData" :key="item.id">
            <div class="demo-carousel">
              <a :href="'/#/ticketDesc?id='+item.id" target="_blank"><img :src="item.imgUrl" alt=""></a>
            </div>
          </CarouselItem>
        </Carousel>
      </div>
      <dmRibbon :param='floor.floor1'>
        <div class="dm-hot-card">
          <dmCard v-for="item in guessYouLike" :data="item" :param="card.card1" />
        </div>
      </dmRibbon>
      <dmRibbon :param='floor.floor2' v-if="wonderfulData.length>0">
        <div class="dm-splendid-card">
          <dmCard :param='card.card2' style=" width: 283px;height: 537px;" :data="wonderfulData[0]" />
          <div class="small-box" v-for="x in 3">
            <dmCard :param='card.card2' style=" width: 185px;height: 263.5px;" :data="wonderfulData[1+(x-1)*2+(y-1)]" v-for="y in 2" />
          </div>
          <dmCard :param='card.card2' style=" width: 283px;height: 537px;" :data="wonderfulData[7]" />
        </div>
      </dmRibbon>
      <div class="dm-ad-card">
        <a :href="'/#/ticketDesc?id='+item.id" v-for="item in adimgUrl " target="_blank"><img :src="item.imgUrl" alt=""></a>
      </div>
      <tabsChild v-if="tabsType!='default'" :data="currentKey" />
      <tabsOther v-else :data="currentKey" />
      <dmRibbon :param='floor.floor3' v-if="popularSearch.length>0">
        <div class="dm-splendid-card">
          <dmCard :param='card.card3' :data="popularSearch[0]" style=" width: 200px;height: 316px; float: left;" />
          <div class="vertical-box " v-for="x in 3">
            <dmCard :param='card.card4' :data="popularSearch[1+(x-1)*2+(y-1)]" :hot='2+(x-1)*2+(y-1)' style=" width: 300px ;height: 150px;" v-for="y in 2" />
          </div>
        </div>
      </dmRibbon>
      <dmCalendar :pageType="currentKey" :data='calendarData' />
      <dmRibbon :param='floor.floor4' v-if="popularSearch.length>0">
        <div class="hz-img">
          <p>
            <img src="static/img/hz3.png" alt="">
          </p>
          <p>
            <img src="static/img/hz2.png" alt="">
          </p>
          <p>
            <img src="static/img/hz4.png" alt="">
          </p>
          <p>
            <img src="static/img/hz5.png" alt="">
          </p>
          <p>
            <img src="static/img/hz6.png" alt="">
          </p>
          <p>
            <img src="static/img/hz7.png" alt="">
          </p>
        </div>
        <div class="hz-img">
          <p>
            <img src="static/img/hz1.png" alt="">
          </p>
          <p>
            <img src="static/img/hz8.png" alt="">
          </p>
          <p>
            <img src="static/img/hz9.png" alt="">
          </p>
          <p>
            <img src="static/img/hz10.png" alt="">
          </p>
          <p>
            <img src="static/img/hz11.png" alt="">
          </p>
          <p>
            <img src="static/img/hz12.png" alt="">
          </p>
        </div>
      </dmRibbon>
    </div>
    <footerSimple/>
  </div>
</template>
<script>
import headerSimple from "@/components/header";
import footerSimple from "@/components/footer";
import carousel from "@/components/carousel";
import dmRibbon from "@/components/dmRibbon";
import dmCard from "@/components/dmCard";
import dmCalendar from "@/components/dmCalendar";
import tabsChild from "./tabsChild";
import tabsOther from "./tabsOther";
import img_03 from "./img/img_03.png";
import img_16 from "./img/img_16.png";
import img_17 from "./img/img_17.png";
import img_18 from "./img/img_18.png";

export default {
  data() {
    return {
      titleData: {},
      currentKey: 4,
      adimgUrl: [],
      tabsType: "default",
      carouselData: [],
      floor: {
        floor1: {
          type: "totem",
          extendType: {
            name: "猜你喜欢"
          }
        },
        floor2: {
          type: "totem",
          extendType: {
            color: "purple",
            name: "精彩聚集"
          }
        },
        floor3: {
          type: "totem",
          extendType: {
            color: "pink",
            name: "热门排行"
          }
        },
        floor4: {
          type: "totem",
          extendType: {
            color: "orange",
            name: "合作方"
          }
        }
      },
      card: {
        card1: {
          type: "hover"
        },
        card2: {
          type: "over"
        },
        card3: {
          type: "over",
          extendType: ["hot"]
        },
        card4: {
          type: "floor",
          extendType: ["hot"]
        }
      },
      guessYouLike: [],
      wonderfulData: [],
      popularSearch: [],
      calendarData: []
    };
  },
  components: {
    headerSimple,
    footerSimple,
    dmRibbon,
    dmCard,
    tabsChild,
    tabsOther,
    dmCalendar
  },
  methods: {
    init() {
      this.getlineNav();
      this.currentKey = this.$http.getUrlParam("page");
      this.getAdimgUrl();
      this.getCarouselData();
      this.getGuessYouLike();
      this.getWonderfulData();
      this.getPopularSearch();
      this.getCalendarData();
    },
    getlineNav() {
      this.$http
        .postRequest({
          type: "getlineNav",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            let resMap = {};
            for (let i = 0; i < res.data.length; i++) {
              resMap[res.data[i].id] = res.data[i];
            }
            this.titleData = resMap;
          } else {
            this.titleData = {};
          }
          if (
            this.titleData[this.currentKey] &&
            this.titleData[this.currentKey].key == "template_child"
          ) {
            Object.keys(this.floor).map(key => {
              this.floor[key].type = "riband";
              this.tabsType = this.titleData[this.currentKey].key;
            });
          }
        });
    },
    getAdimgUrl() {
      this.$http
        .postRequest({
          type: "getAdimgUrl",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            this.adimgUrl = res.data;
          } else {
            this.adimgUrl = [];
          }
        });
    },
    getCarouselData() {
      this.$http
        .postRequest({
          type: "getCarouselData",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            this.carouselData = res.data;
          } else {
            this.carouselData = [];
          }
        });
    },
    getGuessYouLike() {
      this.$http
        .postRequest({
          type: "getGuessYouLike",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            this.guessYouLike = res.data;
          } else {
            this.guessYouLike = [];
          }
        });
    },
    getWonderfulData() {
      this.$http
        .postRequest({
          type: "getWonderfulData",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            this.wonderfulData = res.data;
          } else {
            this.wonderfulData = [];
          }
        });
    },
    getPopularSearch() {
      this.$http
        .postRequest({
          type: "getPopularSearch",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            this.popularSearch = res.data;
          } else {
            this.popularSearch = [];
          }
        });
    },
    getCalendarData() {
      this.$http
        .postRequest({
          type: "getCalendarData",
          data: { itemTypeId: this.currentKey }
        })
        .then(res => {
          if (res.data.length > 0) {
            let resMap = {};
            for (let i = 0; i < res.data.length; i++) {
              resMap[res.data[i].day] = res.data[i].itemList;
            }
            this.calendarData = resMap;
          } else {
            this.calendarData = {};
          }
        });
    }
  },
  mounted() {
    this.init();
  }
};
</script>
<style lang="less" >
@import "../../../static/less/custom.less";
.multiple-page-container {
  .dm-multiple-tabs,
  .dm-ribbon {
    background-color: @body-background;
    .hz-img {
      width: 1000px;
      margin: auto;
      p {
        display: inline-block;
        width: 150px;
        height: 82px;
        padding: 5px;
        margin-left: 10px;
        text-align: center;
      }
      img{
        vertical-align: middle;
      }
    }
  }
  .dm-tabs-title {
    width: 90px;
    height: 55px;
    display: inline-block;
    text-align: center;
    line-height: 55px;
    font-size: 14px;
  }
  .active {
    background-color: #ff3c1b;
    color: #ffffff;
  }
  .dm-multiple-carousel {
    .demo-carousel {
      height: 420px;
    }
  }

  .dm-hot-card {
    .dm-card {
      width: 143px;
      height: 192px;
      display: inline-block;
      margin: 5px 33px 0 33px;
    }
    .dm-card:first-child {
      margin-left: 5px !important;
    }
    .dm-card:last-child {
      margin-right: 5px !important;
    }
  }
  .dm-splendid-card {
    .dm-card {
      display: inline-block;
      margin: 5px 20px 0 5px;
    }
    .dm-card:last-child {
      margin: 5px 5px 0 10px;
    }
    .small-box {
      width: 185px;
      height: 537px;
      display: inline-block;
      margin-right: 10px;
      .dm-card {
        margin: 5px 10px 0 0px;
      }
    }
    .vertical-box {
      width: 300px;
      height: 300px;
      display: inline-block;
      margin-right: 10px;
      .dm-card {
        margin: 5px 10px 0 0px;
      }
    }
  }
  .dm-ad-card {
    margin: 20px 0;
    a {
      margin-right: 25px;
    }
    img {
      width: 380px;
    }
    a:last-child {
      margin-right: 0;
    }
  }
}
</style>
