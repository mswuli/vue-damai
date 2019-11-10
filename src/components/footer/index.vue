<template>
  <div class="page clearfix" >
    <div class="container">
      <div class="con-wrapper">
        <Row :gutter="16">
          <i-col span="3">
            <dl>
              <dt>订购方式</dt>
              <dd>
                <a href="#">在线订购</a>
              </dd>
              <dd>
                <a href="#">电话订购</a>
              </dd>
              <dd>
                <a href="#">上门订购</a>
              </dd>
              <dd>
                <a href="#">大客户团体订购</a>
              </dd>
              <dd>
                <a href="#">大麦超级票订购</a>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>配送方式</dt>
              <dd>
                <a href="#">送货上门</a>
              </dd>
              <dd>
                <a href="#">电子票</a>
              </dd>
              <dd>
                <a href="#">上门自取</a>
              </dd>
              <dd>
                <a href="#">大麦自助机换票</a>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>支付方式</dt>
              <dd>
                <a href="#">在线支付</a>
              </dd>
              <dd>
                <a href="#">柜台付款</a>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>大麦网微信</dt>
              <dd>
                <span class="t-code"><img :src="imgcode" alt=""> </span>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>大麦网触屏版</dt>
              <dd>
                <span class="t-code"><img :src="imgcode" alt=""> </span>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>账户安全</dt>
              <dd>
                <a href="#">找回密码</a>
              </dd>
              <dd>
                <a href="#">账户注册</a>
              </dd>
              <dd>
                <a href="#">账户绑定</a>
              </dd>
              <dd>
                <a href="#">SSL安全证书</a>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>配送方式</dt>
              <dd>
                <a href="#">退换及缺货说明</a>
              </dd>
              <dd>
                <a href="#">发票帮助</a>
              </dd>
              <dd>
                <a href="#">订票服务条款</a>
              </dd>
            </dl>
          </i-col>
          <i-col span="3">
            <dl>
              <dt>特色服务</dt>
              <dd>
                <a href="#">演出订阅</a>
              </dd>
            </dl>
          </i-col>
        </Row>
      </div>
    </div>
    <!-- links -->
    <div class="t-link tc h4">
      <a href="#">公司介绍</a>|
      <a href="#">品牌识别</a>|
      <a href="#">企业荣誉</a>|
      <a href="#">隐私声明</a>|
      <a href="#">联系及合作</a>|
      <a href="#">招聘信息</a>|
      <a href="#">网站地图</a>|
      <a href="#">友情链接</a>|
      <a href="#">公司大事记</a>
    </div>
    <!-- copyright -->
    <div class="t-copyright tc">
      <!-- 动态绑定一个key 就不会报警告了 -->
      <a href="#" v-for="(item,index) in copyrights" :key="index">
        <img :src="item.imgurl" />
      </a>
    </div>
  </div>
</template>

<script>
import er_code from "./img/p_code.jpg";
// 版权图片
import piao from "./img/piao.png";
import dzyy from "./img/dzyy.png";
import siteseal from "./img/siteseal_gd_3.gif";
import pci from "./img/pci.png";
import xin from "./img/xin.png";
import chengxin from "./img/chengxin.png";

export default {
  data() {
    return {
      imgcode: er_code,
      copyrights: [
        { imgurl: piao },
        { imgurl: dzyy },
        { imgurl: siteseal },
        { imgurl: pci },
        { imgurl: xin },
        { imgurl: chengxin }
      ]
    };
  },
  components: {}
};
</script>

<style lang="less" scoped>
.page {
  width: 100%;
  height: 400px;
  background-color: #e6e6e6;

  .con-wrapper {
    padding-top: 45px;
    padding-bottom: 20px;
    border-bottom: 2px solid #ff3c1b;

    dt {
      line-height: 40px;
      color: #333;
      font-size: 16px;
    }

    dd {
      line-height: 25px;
      color: #666;
    }

    .t-code {
      display: block;
      width: 90px;
      height: 89px;
    }
  }

  .t-link {
    color: #666;
    line-height: 52px;
    margin-bottom: 15px;

    a {
      color: #666;
      margin: 0 10px;
    }
  }
  // 版权信息
  .t-copyright {
    img {
      margin-right: 20px;
    }
  }
}
</style>
