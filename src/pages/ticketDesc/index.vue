<template>
  <div>
    <headerSimple/>
    <div class="container desc-container">
      <div class="bread-crumb">
        <Breadcrumb separator=">">
          <BreadcrumbItem to="/">{{root}}</BreadcrumbItem>
          <BreadcrumbItem :to="'name='+areaId">{{areaName}}</BreadcrumbItem>
          <BreadcrumbItem class="red" to="/components/url">{{itemType1Name}}</BreadcrumbItem>
          <BreadcrumbItem>{{itemName}}</BreadcrumbItem>
        </Breadcrumb>
      </div>
      <div class="desc-body">
        <div class="message-left">
          <img :src="imgUrl" alt="">
        </div>
        <div class="message-body">
          <div class="title">{{itemName}}</div>
          <div class="sub-title">“{{abstractMessage}}”</div>
          <div class="des-steps">
            <Steps :current="state">
              <Step title="项目待定" icon=""></Step>
              <Step title="预售/预定"></Step>
              <Step title="售票中"></Step>
              <Step title="演出开始"></Step>
            </Steps>
          </div>
          <div class="show-time dm-Radio-Group">
            <label class="label-title" for="">演出时间：</label>
            <RadioGroup v-model="showTime" @on-change="timeRadioChange" type="button">
              <Radio v-for="item in timeData" :label="item.id"> {{item.startTime}} </Radio>
            </RadioGroup>
          </div>

          <div class="selected-price dm-Radio-Group">
            <label class="label-title" for="">选择票价：</label>
            <RadioGroup v-model="selectedPrice" type="button">
              <Radio v-for="item in priceData" :value="item.price" :label="item.price" :disabled="!item.isHaveSeat?true:false"> {{item.price}}元</Radio>
            </RadioGroup>
          </div>
          <Button :disabled="disabled" type="primary" @click="btnClick" style="width:150px;height:40px;margin:20px 0 0 65px;font-size:16px;">选座购买</Button>
        </div>
        <div class="message-right">
          <div class="desc-grade dashed">
            <div class="grade-title title">大麦网评分：</div>
            <div class="grade-rate">
              <span class="rate-size">{{avgScore}}</span>
              <Rate disabled allow-half v-model="avgScore"></Rate>
              <span class="grade-size">{{commentCount}}</span>人参与评论
            </div>
          </div>
          <div class="desc-grade dashed">
            <div class="grade-title title">演出时间</div>
            <div>
              {{startTime +'-'+ endTime}}
            </div>
          </div>
          <div class="desc-grade dashed">
            <div class="grade-title title">演出场馆</div>
            <div>
              {{adress}}
            </div>
            <div class="map">
              <a href="">
                <Icon type="location" style="color:red;"></Icon> 交通路线</a>
            </div>
          </div>
          <div class="desc-grade dashed">
            <div class="grade-title title">票品支持</div>
            <div>
              <Icon type="social-usd" style="color:red;"></Icon> 返积分
            </div>
          </div>
          <div class="desc-grade dashed">
            <div class="grade-title title">实票配送</div>
            <div>
              同城满100.00元免运费,不满收10.00元， 发货后1-3天到达
            </div>
          </div>
        </div>
      </div>
      <descfooter :item-data="this.$data" />
    </div>
    <footerSimple/>
  </div>
</template>

<script>
import headerSimple from "@/components/header";
import footerSimple from "@/components/footer";
import descfooter from "./ticketdesc";
import "./less/index.less";
export default {
  data() {
    return {
      root: "大麦",
      id: 161,
      itemName: "大型多媒体励志互动儿童剧《爱丽丝梦游仙境》（11月）",
      abstractMessage: "爱丽丝梦游仙境",
      itemType1Id: "1",
      itemType1Name: "话剧歌剧",
      itemType2Id: "101",
      itemType2Name: "主题公园",
      areaId: "1",
      areaName: "北京",
      state: 2,
      basicDescription: "",
      projectDescription: "",
      reminderDescription: "",
      imgUrl: "/static/img/img_01.21e9c6f.png",
      cinemaId: 123,
      adress: "中国儿童中心剧院 - 北京市",
      latitude: 125.55,
      longitude: 156.77,
      avgScore: 4.6,
      commentCount: 3000,
      startTime: "2017-12-23",
      endTime: "2017-12-26",
      showTime: "1",
      timeData: [],
      disabled: true,
      selectedPrice: 0,
      priceData: [],
      browsHistory: {},
      itemPojo: {}
    };
  },
  components: { headerSimple, footerSimple, descfooter },
  methods: {
    getItemData() {
      this.$http
        .postRequest({ type: "getItemData", data: { id: 20 } })
        .then(res => {
          for (const key of Object.keys(res.data)) {
            this[key] = res.data[key];
            this.itemPojo[key] = res.data[key];
          }
          this.getTimePlan();
        });
    },
    getTimePlan() {
      this.disabled = true;
      this.$http
        .postRequest({ type: "getTimePlan", data: { itemId: 20 } })
        .then(res => {
          if (res.data.length > 0) {
            this.timeData = res.data;
            this.showTime = this.timeData[0].id;
            this.getPrice(this.showTime);
          } else {
            this.timeData = [];
            this.priceData = [];
          }
        });
    },
    getPrice(scheduleId) {
      this.$http
        .postRequest({ type: "getPrice", data: { scheduleId } })
        .then(res => {
          console.log(res.data);
          if (res.data.length > 0) {
            this.priceData = res.data;
            this.selectedPrice = this.timeData[0].id;
            res.data.map(item => {
              if (item.isHaveSeat == 1) {
                this.disabled = false;
              }
            });
          } else {
            this.priceData = [];
            this.disabled = true;
          }
        });
    },
    timeRadioChange(scheduleId) {
      this.getPrice(scheduleId);
    },
    btnClick() {
      console.log({
        showTime: this.showTime,
        selectedPrice: this.selectedPrice,
        itemPojo: this.itemPojo,
        timeData: this.timeData
      });
      this.$router.push({
        path: "ticketChooseSeat",
        query: {
          showTime: this.showTime,
          selectedPrice: this.selectedPrice,
          itemPojo: this.itemPojo,
          timeData: this.timeData
        }
      });
    },
    getLocation(key) {
      return JSON.parse(window.localStorage.getItem(key));
    },
    setLocaltion(key) {
      let item = {
        title: this.itemName,
        url: window.location.href
      };
      let oldHistory = this.getLocation(key);
      this.browsHistory = oldHistory;
      let data = [item];
      if (oldHistory && oldHistory.size > 0) {
        oldHistory.data.map((history, index, array) => {
          if (index < 9 && item.url != history.url) {
            data.push(history);
          }
        });
      }
      let browsHistory = {
        size: data.length,
        data: data
      };
      window.localStorage.setItem(key, JSON.stringify(browsHistory));
    }
  },
  mounted() {
    this.getItemData();
    this.setLocaltion("browsHistory");
  }
};
</script>
 



















