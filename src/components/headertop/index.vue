<template>
  <div class="page">
    <div class="page-top">
      <!-- header头部部分 -->
      <div class="con-top">
        <Row>
          <i-col span="8">
            <div class="t-info fl">
              <span>HI , 欢迎来大麦</span>
              [
              <template v-if="gIsLogin">
                <a class="t-login" href="javascript:;">{{ sLoginInfo.nickName }}</a>
                <a class="t-register" href="javascript:;" @click="mLogout">退出</a>
              </template>
              <template v-else="gIsLogin">
                <router-link to="/login" class="t-login">登录</router-link>
                <router-link to="/register" class="t-register">注册</router-link>
              </template>
              ]
            </div>
            <!-- 下拉菜单 -->
            <Dropdown>
              <a href="javascript:void(0)">
                我的大麦
                <Icon type="chevron-down"></Icon>
              </a>
              <Dropdown-menu slot="list">
                <Dropdown-item>
                  <router-link to="/OrderList">个人信息</router-link>
                </Dropdown-item>
                <Dropdown-item>
                  <router-link to="/OrderList">订单管理</router-link>
                </Dropdown-item>
              </Dropdown-menu>
            </Dropdown>
          </i-col>

          <i-col span="8" offset="8">
            <div class="t-weixin">
              <Dropdown>
                <a href="javascript:void(0)">
                  大麦网微信
                </a>
                <Dropdown-menu slot="list">
                  <Dropdown-item><img :src="imgcode" /></Dropdown-item>
                </Dropdown-menu>
              </Dropdown>
            </div>

            <div class="t-weixin">
              <Dropdown>
                <a href="javascript:void(0)">
                  手机版
                </a>
                <Dropdown-menu slot="list">
                  <Dropdown-item><img :src="imgcode" /></Dropdown-item>
                </Dropdown-menu>
              </Dropdown>
            </div>

            <div class="t-weixin">
              <Dropdown>
                <a href="javascript:void(0)">
                  客户服务
                  <Icon type="chevron-down"></Icon>
                </a>
                <Dropdown-menu slot="list">
                  <Dropdown-item>帮助中心</Dropdown-item>
                  <Dropdown-item>在线客服</Dropdown-item>
                  <Dropdown-item>人工服务</Dropdown-item>
                </Dropdown-menu>
              </Dropdown>
            </div>

            <div class="t-weixin t-webnav">
              <Dropdown>
                <a href="javascript:void(0)">
                  网站导航
                  <Icon type="chevron-down"></Icon>
                </a>
                <Dropdown-menu slot="list">
                  <div class="web-nav clearfix">
                    <div class="left fl">
                      <span>演出分类</span>
                      <ul>
                        <li>
                          <a href="#">演唱会</a>
                        </li>
                        <li>
                          <a href="#">音乐会</a>
                        </li>
                        <li>
                          <a href="#">舞蹈芭蕾</a>
                        </li>
                        <li>
                          <a href="#">曲苑杂坛</a>
                        </li>
                        <li>
                          <a href="#">度假休闲</a>
                        </li>
                        <li>
                          <a href="#">儿童亲子</a>
                        </li>
                        <li>
                          <a href="#">话剧歌剧</a>
                        </li>
                        <li>
                          <a href="#">动漫</a>
                        </li>
                      </ul>
                    </div>
                    <div class="right fl">
                      <span>城市切换</span>
                      <ul>
                        <!-- <li v-for="(item,index) in city" :key="index">
                        <a href="#">{{item.name}}</a>
                      </li> -->
                        <li>
                          <a href="#">北京</a>
                        </li>
                        <li>
                          <a href="#">广州</a>
                        </li>
                        <li>
                          <a href="#">上海</a>
                        </li>
                        <li>
                          <a href="#">南京</a>
                        </li>
                        <li>
                          <a href="#">香港</a>
                        </li>
                        <li>
                          <a href="#">台州</a>
                        </li>
                        <li>
                          <a href="#">西安</a>
                        </li>
                        <li>
                          <a href="#">杭州</a>
                        </li>
                        <li>
                          <a href="#">成都</a>
                        </li>
                        <li>
                          <a href="#">重庆</a>
                        </li>
                        <li>
                          <a href="#">宁波</a>
                        </li>
                        <li>
                          <a href="#">无锡</a>
                        </li>
                        <li>
                          <a href="#">深圳</a>
                        </li>
                        <li>
                          <a href="#">武汉</a>
                        </li>
                        <li>
                          <a href="#">济南</a>
                        </li>
                        <li>
                          <a href="#">昆明</a>
                        </li>
                        <li>
                          <a href="#">南宁</a>
                        </li>
                        <li>
                          <a href="#">佛山</a>
                        </li>
                        <li>
                          <a href="#">太原</a>
                        </li>
                        <li>
                          <a href="#">哈尔滨</a>
                        </li>
                        <li>
                          <a href="#">南昌</a>
                        </li>
                        <li>
                          <a href="#">温州</a>
                        </li>
                        <li>
                          <a href="#">长沙</a>
                        </li>
                        <li>
                          <a href="#">福州</a>
                        </li>
                        <li>
                          <a href="#">天津</a>
                        </li>
                        <li>
                          <a href="#">苏州</a>
                        </li>
                        <li>
                          <a href="#">郑州</a>
                        </li>
                        <li>
                          <a href="#">东莞</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </Dropdown-menu>
              </Dropdown>
            </div>
            <div class="t-weixin">
              <a href="javascript:;">English</a>
            </div>
          </i-col>
        </Row>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapMutations, mapGetters } from "vuex";
import er_code from "./img/p_code.jpg";

export default {
  data() {
    return {
      imgcode: er_code,
      city: []
    };
  },
  components: {},
  methods: {
    ...mapMutations(["mLogout"])
  },
  computed: {
    ...mapState(["sLoginInfo"]),
    ...mapGetters(["gIsLogin"])
  }
};
</script>

<style lang="less" scoped>
.page {
  .page-top {
    width: 100%;
    background: #f7f7f7;
    border-bottom: 1px solid #e5e5e5;
    height: 35px;
    line-height: 35px;
    .con-top {
      width: 1200px;
      margin: 0 auto;
    }
  }
  .t-info {
    margin-right: 10px;
  }
  .t-login {
    margin-right: 5px;
    color: #ff3c1b;
  }

  .t-weixin {
    margin-right: 25px;
    float: left;
  }

  .web-nav {
    padding: 10px;
    width: 400px;

    .left {
      width: 130px;
      height: 200px;
      border-right: 1px solid #ccc;

      span {
        font-size: 14px;
        color: #666;
        margin-left: 10px;
      }

      li {
        float: left;
        width: 60px;
        height: 20px;
        line-height: 20px;
        margin-bottom: 8px;
      }
    }

    .right {
      width: 249px;
      span {
        font-size: 14px;
        color: #666;
        margin-left: 10px;
      }
      li {
        float: left;
        width: 48px;
        height: 20px;
        line-height: 20px;
        margin-bottom: 8px;
        text-align: center;
      }
    }
  }
}
</style>
