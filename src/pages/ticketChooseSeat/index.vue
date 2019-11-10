<template>
  <div>
    <headerSimple/>
    <div class=" container ticket-choose-container">
      <div class="bread-crumb">
        <Breadcrumb separator=">">
          <BreadcrumbItem to="/">{{root}}</BreadcrumbItem>
          <BreadcrumbItem>{{itemPojo.areaName}}</BreadcrumbItem>
          <BreadcrumbItem class="red" to="/">{{itemPojo.itemType1Name}}</BreadcrumbItem>
          <BreadcrumbItem class="red" to="/">{{itemPojo.itemName}}</BreadcrumbItem>
          <BreadcrumbItem>{{timeData.get(showTime)}}</BreadcrumbItem>
        </Breadcrumb>
      </div>
      <div class="ticket-choose-body" v-if="seatArray.length>0">
        <chooseSeat :seat-order="seatArray" :data="saetObject" :adress="itemPojo.adress" :seatPojo="this.$route.query" />
      </div>
    </div>
    <footerSimple/>
  </div>
</template>
<script>
import headerSimple from "@/components/header";
import footerSimple from "@/components/footer";
import chooseSeat from "@/components/chooseSeat";
export default {
  data() {
    return {
      root: "大麦",
      seatArray: [],
      saetObject: {
        scheduleId: 12,
        cinemaId: 13,
        seatPriceList: [],
        seatInfoList: []
      },
      showTime: "",
      selectedPrice: "",
      itemPojo: "",
      timeData: new Map()
    };
  },
  components: {
    headerSimple,
    footerSimple,
    chooseSeat
  },
  methods: {
    getSchedule() {
      this.$http
        .postRequest({
          type: "getSchedule",
          data: { scheduleId: this.showTime, cinemaId: this.itemPojo.cinemaId }
        })
        .then(res => {
          if (res.data) {
            this.saetObject = res.data;
          } else {
            this.saetObject = [];
          }
          this.getSeatList();
        });
    },
    getSeatList() {
      this.$http
        .postRequest({
          type: "getSeatList",
          data: { scheduleId: this.showTime, cinemaId: this.itemPojo.cinemaId }
        })
        .then(res => {
          if (res.data) {
            this.seatArray = res.data.seatArray;
          } else {
            this.seatArray = [];
          }
        });
    }
  },
  mounted() {
    this.showTime = this.$route.query.showTime;
    this.selectedPrice = this.$route.query.selectedPrice;
    this.itemPojo = this.$route.query.itemPojo;
    let timeArray = this.$route.query.timeData;
    let timeMap = new Map();
    for (let i = 0; i < timeArray.length; i++) {
      timeMap.set(timeArray[i].id, timeArray[i].startTime);
    }
    this.timeData = timeMap;
    this.getSchedule();
  }
};
</script>
<style lang="less" scoped>
.ticket-choose-container {
  .bread-crumb {
    height: 51px;
    width: 100%;
    background-color: #f6f6f6;
    line-height: 51px;
    padding-left: 22px;
  }
  .ticket-choose-body {
    margin: 20px 0;
    width: 1200px;
    background: #fff;
  }
}
</style>
