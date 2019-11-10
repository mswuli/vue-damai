<template>
  <div ref='overDom' :class="'over-card '+extendType">
    <div class="card-box">
      <a :href="'/#/ticketDesc?id='+id" target="_blank">
        <div class="box-img over-img">
          <div class="wrap">
            <span class="ribbon6">TOP1</span>
          </div>
          <img :src="imgUrl" alt="" />
        </div>
        <div class="box-content over-content">
          <div ref='overDomDesc' name='boxDesc' class="box-desc">
            <p>{{name}}</p>
            <p>{{startDate}}</p>
          </div>
          <a class="button" target="_blank" :href="'/#/ticketDesc?id='+id" v-if="extendType!='hot'" href="/#/multiplePage?page=4">立即查看</a>
        </div>
      </a>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      extendType: (() => {
        return this.param.extendType != undefined && this.param.extendType
          ? this.param.extendType.join(" ")
          : " ";
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
  mounted() {
    this.init();
  },
  methods: {
    init() {
      let node = this.$refs.overDom;
      let cardHeight = node.offsetHeight;
      if (this.$refs.overDom.offsetHeight > 500) {
        this.$refs.overDomDesc.style.marginTop = "200px";
      } else if (this.extendType && this.extendType == "calendar") {
        this.$refs.overDomDesc.style.marginTop = "50px";
      } else if (this.extendType && this.extendType != "hot") {
        this.$refs.overDomDesc.style.marginTop = "100px";
      }
    },
    getByKey(key) {
      return this.data != undefined && this.data[key] ? this.data[key] : "";
    }
  },
  props: ["param", "data"]
};
</script>
<style lang="less" scoped>
.over-card {
  overflow: hidden;
  width: 100%;
  height: 100%;
  .card-box {
    width: 100%;
    height: 100%;
    background: #eee;
    position: relative;
    perspective: 1000px;
    .box-img,
    .box-img img,
    .box-content {
      width: 100%;
      height: 100%;
      position: absolute;
      left: 0;
      bottom: 0;
      // background-color: aqua;
      transition: all 0.3s ease-in-out;
    }
    .box-img {
      img {
        position: absolute;
        top: 0;
      }
    }
    .box-content {
      width: 100%;
      height: 100%;
      text-align: center;
      background-color: rgba(255, 60, 27, 0.64);
      color: #fff;
      font-size: 14px;
      .box-desc {
        width: 130px;
        height: 90px;
        border: 1px solid #eee;
        margin: 0 auto;
        vertical-align: middle;
        padding: 5px;
      }
      a {
        color: #fff;
        width: 130px;
        height: 25px;
        display: block;
        line-height: 25px;
        margin: 3px auto;
        border: 1px solid #eee;
      }
    }
    .over-img {
      opacity: 1;
      height: 100%;
    }
    .over-content {
      opacity: 0;
      height: 0;
      overflow: hidden;
    }
  }
  .card-box:hover .over-content {
    opacity: 1;
    height: 100%;
  }
}

.hot {
  .box-img {
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
  .card-box {
    .box-content {
      opacity: 1;
      height: 50px;
      .box-desc {
        font-size: 12px;
        width: 100%;
        height: 90px;
        border: 0;
        margin: 0 auto;
        vertical-align: middle;
        padding: 5px;
      }
    }
  }
  .card-box:hover .over-content {
    height: 50px;
  }
}

.calendar {
  padding: 5px;
  .card-box {
    .box-content {
      .box-desc {
        font-size: 12px;
        width: 100%;
        height: 90px;
        border: 0;
        margin: 0 auto;
        vertical-align: middle;
        padding: 5px;
      }
      .button {
        display: none;
      }
    }
  }
}
</style>
