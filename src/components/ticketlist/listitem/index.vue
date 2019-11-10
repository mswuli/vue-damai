<template>
  <li :class='[styleflag]'>
    <div class="list-img">
      <a href="javascript:;" @click="skipdesc"><img :src="itemInfo.imgUrl" alt=""></a>
      <p class="big-loction" @click="modal = true">{{itemInfo.adress}}</p>
    </div>
    <div class="list-txt">
      <h3>
        <span>[{{itemInfo.areaName}}]</span>
        <a href="javascript:;" @click="skipdesc">{{itemInfo.itemName}}</a>
      </h3>
      <p class="list-txt-des">{{itemInfo.abstractMessage}}</p>
      <p class="list-txt-time">
        <Icon type="android-apps"></Icon>
        {{itemInfo.startTime}}
      </p>
      <p class="list-txt-loca">
        <Icon type="location"></Icon>
        <a href="javascript:;" @click="modal = true">{{itemInfo.adress}}</a>
      </p>
      <p class="list-txt-price">
        <em>{{itemInfo.minPrice}}-{{itemInfo.maxPrice}}元</em>售票中</p>
      <p class="list-txt-elec">
        <Icon type="qr-scanner"></Icon>
        <a href="javascript:;">电子票</a>
      </p>
    </div>
    <!-- 地图 -->
    <div class="map">
      <Modal :styles="{top: '20px'}" v-model="modal" width="730">

        <p slot="header">剧场位置如图中标注所在，点击标注查看详情</p>
        <div style="height:450px;">
          <vmap :mapitem="this.mapdata"></vmap>

        </div>
        <div slot="footer" style="display:none;">
        </div>

      </Modal>
    </div>
  </li>

</template>

<script>
// import imgitem from "./img/item153206.jpg";
import vmap from "@/components/map";

export default {
  data() {
    return {
      // imgurl: imgitem,
      modal: false,
      mapdata: [],
      // 切换样式的
      styleflag: "list-item"
    };
  },
  components: { vmap },
  props: ["itemInfo", "switchlist"],
  methods: {
    // 点击list跳转详情页面
    skipdesc() {
      this.$router.push({
        path: "TicketDesc",
        query: { id: this.itemInfo.id }
      });
    }
  },
  mounted() {
    // 经度
    this.mapdata.push("" + this.itemInfo.longitude);
    // 纬度
    this.mapdata.push("" + this.itemInfo.latitude);
    // console.log("地图数据=" + this.mapdata);
  },
  watch: {
    switchlist: function() {
      if (this.switchlist == "list") {
        this.styleflag = "list-item";
      } else {
        this.styleflag = "list-itembig";
      }
    }
  }
};
</script>

<style lang="less" scoped>
// 列表
.list-item {
  // padding: 5px 18px;
  &:after {
    content: "";
    display: block;
    height: 0;
    clear: both;
  }
  padding: 25px 10px 18px;
  border-bottom: 1px dotted #cecece;
  margin: 0 10px;

  .list-img {
    width: 153px;
    height: 206px;
    overflow: hidden;
    margin-right: 20px;
    float: left;
    p {
      display: none;
    }
  }

  .list-txt {
    width: 680px;
    line-height: 24px;
    float: left;
    h3 {
      margin-bottom: 6px;
      font-size: 16px;
    }
    p {
      margin-bottom: 6px;
      color: #999;
    }
    .list-txt-desc {
      overflow: hidden;
      white-space: nowrap;
      text-overflow: ellipsis;
      width: 100%;
    }
    .list-txt-loca {
      a {
        font-size: 14px;
      }
    }
    .list-txt-price {
      em {
        color: #ff3c1c;
        font-weight: bold;
        font-size: 14px;
        margin-right: 20px;
        font-style: normal;
      }
    }
  }
}
// 大图模式
.list-itembig {
  &:hover {
    .big-loction {
      display: block;
    }
  }
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
      cursor: pointer;
      display: none;
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
    .list-txt-des,
    .list-txt-elec,
    .list-txt-loca {
      display: none;
    }
    .list-txt-time {
      i {
        display: none;
      }
    }
  }
}
</style>

<style lang="less">
.list-txt-time,
.list-txt-loca,
.list-txt-elec {
  i {
    font-size: 18px;
    color: #ff3c1c;
    margin-right: 5px;
  }
}
</style>
