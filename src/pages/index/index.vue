<template>
  <div class="bg">
    <!-- 头部组件 -->
    <Vheader/>

    <div class="part1">
      <div class="part1-outC" v-if="siderMenu">
        <!-- 商品分类列表 -->
        <div class=" goods-classify">
          <goodsClassify :siderMenu="siderMenu" />
        </div>
        <!-- 横向分类导航 -->
        <ul class="classify-inline">
          <li v-for="item in lineMenu" :key="item.id">
            <router-link :to="{ path: '/multiplePage?page='+item.id, query: { id: item.id }}">
              {{item.aliasName}}
            </router-link>
          </li>

        </ul>
      </div>
      <!-- 轮播图组件 -->
      <div class="carousel1">
        <Carousel :carouselData="carouselData" />
      </div>
    </div>

    <div class="part2">
      <Tabs value="name1" class="card-list">
        <TabPane label="今日推荐" name="name1">
          <Row type="flex" justify="space-around" class="code-row-bg">
            <Col span="4" v-for="recommend in recommends" :key="recommend.id">
            <Card :hotItem="recommend" />
            </Col>
          </Row>
        </TabPane>
        <TabPane label="即将开售" name="name2">
          <Row type="flex" justify="space-around" class="code-row-bg">
            <Col span="4" v-for="sell in sells" :key="sell.id">
            <Card :hotItem="sell" />
            </Col>
          </Row>
        </TabPane>
      </Tabs>
    </div>

    <div class="part3">
      <div class="floor">
        <Floor :floors="floors" />
      </div>

    </div>

    <!-- 底部组件 -->
    <Vfooter/>

  </div>
</template>

<script>
import header from "@/components/header";
import footer from "@/components/footer";
import carousel from "@/components/carousel";
import goodsClassify from "@/components/goodsClassify";
import card from "@/components/card1";
import floor from "@/components/floor";

export default {
  data() {
    return {
      siderMenu: null,
      lineMenu: [],
      carouselData: [],
      recommends: [],
      sells: [],
      floors: []
    };
  },
  components: {
    Vheader: header,
    Vfooter: footer,
    Carousel: carousel,
    GoodsClassify: goodsClassify,
    Card: card,
    Floor: floor
  },
  mounted() {
    // 首页商品分类接口
    this.$http
      .postIndexNav()
      .then(res => {
        this.siderMenu = res.data;
      })
      .catch(err => console.log(err));

    // 首页横向导航接口
    this.$http
      .postIndexLineNav()
      .then(res => {
        // console.log(res);
        this.lineMenu = res.data;
      })
      .catch(err => console.log(err));

    // 首页轮播图接口
    this.$http.postIndexCarousel().then(res => {
      this.carouselData = res.data;
    });
    // 首页今日推荐接口
    this.$http.postIndexRecommend().then(res => {
      this.recommends = res.data;
    });
    // 首页即将开售接口
    this.$http.postIndexSell().then(res => {
      this.sells = res.data;
    });
    // 首页楼层接口
    this.$http.postFloorData().then(res => {
      this.floors = res.data;
    });
  }
};
</script>


<style lang='less' scoped>
@WinWidth: 1200px;
.bg {
  background-color: #f5f5f5;
}
.part1 {
  .part1-outC {
    min-width: 1200px;
    position: relative;
    top: 50px;
    margin: 50px auto 80px;
  }
  .goods-classify {
    position: absolute;
    top: -50px;
    left: 0px;
    z-index: 2;
    // border: 1px solid green;
  }
  .carousel1 {
    width: 100%;
    height: 100%;
    background: #ff3c1b;
    position: relative;
    top: -30px;
    left: 0;
  }
  .classify-inline {
    width: 1000px;
    height: 50px;
    line-height: 50px;
    background-color: #fff;
    position: absolute;
    top: -50px;
    left: 202px;
    border: 1px solid #dcdcdc;
  }
  .classify-inline li {
    float: left;
    font-size: 16px;
  }
  .classify-inline li a {
    display: inline-block;
    width: 100%;
    height: 100%;
    padding: 0 30px;
  }
  .classify-inline li a:hover {
    color: #ff3c1b;
  }
}
.part2,
.part1-outC {
  width: @WinWidth;
  margin-left: auto;
  margin-right: auto;
  border: 1px solid transparent;
}
.part2 {
  margin-bottom: 30px;
  background-color: #fff;
  .card-list {
    padding: 0 0 30px 30px;
  }
  h2 {
    margin: 26px 0 26px 30px;
    font-size: 18px;
  }
}
.part3 {
  .floor {
    width: @WinWidth;
    margin: 30px auto;
  }
}
</style>
