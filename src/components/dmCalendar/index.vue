<template>
  <div>
    <div class='calendar'>
      <div class="calendar-title-box">
        <span class="prev-month  " @click="clickPrev" id="prevMonth"></span>
        <span class="calendar-title" id="calendarTitle">{{currentTitle}}</span>
        <span id="nextMonth" class="next-month  " @click="clickNext"></span>
      </div>
      <div class="calendar-body-box">
        <table id="calendarTable" class="calendar-table">
          <tbody>
            <tr>
              <th v-for=" item in weeekName ">{{item}}</th>
            </tr>
            <tr v-for="x in  dayKey.length/7">
              <td v-for="y in  dayKey.length/6" class=" " v-if="currentMonth.substr(0,6) == dayKey[(x-1)*7+y-1].substr(0,6) || ((x-1)*7+y-1) < 7 ">
                <div class="calendar-desc" style="width:170px;height:170px;" v-if="currentMonth.substr(0,6) == dayKey[(x-1)*7+y-1].substr(0,6)">
                  <div class="calendar-day" v-if="data[dayKey[(x-1)*7+y-1]]==undefined || data[dayKey[(x-1)*7+y-1]].length>1 ">
                    {{ dayKey[(x-1)*7+y-1].substr(6, 8)}}
                  </div>
                  <dmCard v-else-if="data[dayKey[(x-1)*7+y-1]].length==1" :param="card" :data="data[dayKey[(x-1)*7+y-1]][0]" style="width:170px;height:170px;" />
                  <div class="calendar-list" v-if="data[dayKey[(x-1)*7+y-1]]!=undefined && data[dayKey[(x-1)*7+y-1]].length > 1">
                    <p v-for="item in data[dayKey[(x-1)*7+y-1]]">
                      <a target="_blank" :href="'/#/ticketDesc?id='+item.id" :title="item.itemName">{{item.itemName.substr(0,10)}}...</a>
                    </p>
                  </div>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script>
import dmCard from "@/components/dmCard";
import overImg from "./img/over-img.png";
export default {
  data() {
    return {
      weeekName: [
        "SUNDAY 日",
        "MONDAY 一",
        "TUESDAY 二",
        "WEDNESDAY 三",
        "THURSDAY 四",
        "FRIDAY 五",
        "SATURDAY 六"
      ],
      currentDay: "",
      currentMonth: "",
      currentTitle: "",
      year: new Date(this.currentDay).getFullYear(),
      month: new Date(this.currentDay).getMonth() + 1,
      firstDay: new Date(this.year, this.month - 1, 1),
      size: 0,
      dayKey: [],
      card: {
        type: "over",
        extendType: ["calendar"]
      }
    };
  },
  methods: {
    clickPrev() {
      this.currentDay = new Date(
        this.currentDay.getFullYear(),
        this.currentDay.getMonth() - 1,
        1
      );
      this.initParam();
    },
    clickNext() {
      this.currentDay = new Date(
        this.currentDay.getFullYear(),
        this.currentDay.getMonth() + 1,
        1
      );
      this.initParam();
    },
    initParam() {
      this.year = new Date(this.currentDay).getFullYear();
      this.month = new Date(this.currentDay).getMonth() + 1;
      this.firstDay = new Date(this.year, this.month - 1, 1);
      this.currentMonth = this.getDateStr(this.firstDay);
      this.currentTitle = this.currentDay.Format("yyyy 年 MM 月 ");
      this.getDateMap();
    },
    getDateStr(date) {
      var _year = date.getFullYear();
      var _month = date.getMonth() + 1; // 月从0开始计数
      var _d = date.getDate();
      _month = _month > 9 ? "" + _month : "0" + _month;
      _d = _d > 9 ? "" + _d : "0" + _d;
      return _year + _month + _d;
    },
    getDateMap() {
      let dayArray = [];
      for (let i = 0; i < 42; i++) {
        let thime = this.getDateStr(
          new Date(this.year, this.month - 1, i + 1 - this.firstDay.getDay())
        );
        dayArray.push(thime);
      }
      this.dayKey = dayArray;
    }
  },
  mounted() {
    this.currentDay = new Date();
    this.initParam();
  },
  components: {
    dmCard
  },
  props: ["param",'data']
};
</script>

<style lang="less" >
/**
 * 设置日历的大小
 */
.calendar {
  display: block;
  margin: 0;
  padding: 0;
  margin-bottom: 20px;
  /*background: #cccccc;*/
  /**
   设置日历顶部盒子
  */
  .calendar-title-box {
    position: relative;
    width: 100%;
    height: 125px;
    line-height: 36px;
    text-align: center;
    border-radius: 20px 20px 0 0;
    background: url("img/calendarTitle.png");
    background-size: 100%;
    color: #ffffff;
    font-weight: 900;
    font-size: 24px;
    .calendar-title,
    .next-month,
    .prev-month {
      line-height: 100px;
      margin: 5px;
      cursor: pointer;
    }
    .prev-month::before {
      content: "<";
    }
    .next-month::after {
      content: ">";
    }
  }
  /* 
  设置日历body 结构样式信息显示
  */
  .calendar-body-box {
    background: #ffffff;

    /* 设置日历表格样式 */
    .calendar-table {
      width: 100%;
      border-collapse: collapse;
      text-align: center;
      tr:first-child {
        line-height: 30px;
        height: 40px;
        background: #eaeaea;
        th:first-child,
        th:last-child {
          color: red;
        }
      }
      /* 表格行高 */
      tr {
        line-height: 28px;
        font-size: 14px;
        td {
          width: 170px;
          height: 170px;
          border: 1px solid #eeeeee;
          .calendar-desc {
            float: left;
            .calendar-day {
              width: 42px;
            }
            .calendar-list {
              font-size: 12px;
            }
          }
        }
      }
    }
  }
}
</style>
