<template>
  <div class="headsearch">
    <!-- header LOGO部分+搜索 -->
    <div class="container clearfix">
      <Row>
        <i-col span="7">
          <a href="#" class="t-logo"><img :src="imgLogo" width="167" height="60"></a>
          <div class="t-city">
            <Dropdown>
              <a class="t-ct" href="javascript:void(0)">
                北京
                <Icon type="chevron-down"></Icon>
              </a>
              <Dropdown-menu slot="list">
                <div class="t-infos">
                  <dl class="clearfix">
                    <dt>华北东北 ></dt>
                    <dd>
                      <ul>
                        <li>
                          <a href="#">北京</a>
                          <i>523</i>
                        </li>
                        <li>
                          <a href="#">北京</a>
                          <i>523</i>
                        </li>
                      </ul>
                    </dd>
                  </dl>
                  <dl class="clearfix">
                    <dt>华南 ></dt>
                    <dd>
                      <ul>
                        <li>
                          <a href="#">北京</a>
                          <i>523</i>
                        </li>
                        <li>
                          <a href="#">北京</a>
                          <i>523</i>
                        </li>
                      </ul>
                    </dd>
                  </dl>

                </div>
              </Dropdown-menu>
            </Dropdown>
          </div>
        </i-col>
        <!-- search 开始 -->
        <i-col span="14">
          <div class="t-search">
            <div class="search-main">
              <input type="text" placeholder="请输入演出、艺人、场馆名称..." v-model="keyword" class="search-text">
              <button class="search-btn" type="button" @click="searchlist">搜索</button>
            </div>
          </div>
        </i-col>
      </Row>
    </div>

  </div>
</template>

<script>
import logo from "./img/logo-334-120.png";

export default {
  data() {
    return {
      imgLogo: logo,
      city: [],
      // 搜索的关键词
      keyword:""
    };
  },
  components: {},
  methods: {
    // 根据内容搜索页面
    searchlist() {
      // this.$emit("keyWordData",this.keyword)
      this.$router.push({
        path: "ticketlist",
        query: { keyword: this.keyword }
      });
    }
  }
};
</script>

<style lang="less" scoped>
.headsearch {
  // header下方LOGO+搜索
  .container {
    height: 62px;
    margin: 15px auto;

    .t-logo {
      margin-right: 10px;
      float: left;
      display: inline-block;
      width: 167px;
      height: 60px;
    }

    .t-ct {
      height: 16px;
      line-height: 16px;
      font-size: 16px;
      color: #333;
      vertical-align: middle;
      margin-bottom: 10px;
      padding-left: 6px;
    }

    .t-infos {
      width: 400px;

      dl {
        border-bottom: 1px dotted #bfbfbf;
        line-height: 30px;
        padding: 10px 0 10px 10px;
      }

      dt {
        font-size: 14px;
        color: #333;
        width: 75px;
        float: left;
        text-align: right;
      }

      dd {
        float: left;

        ul {
          padding-bottom: 8px;

          li {
            float: left;
            padding: 0 0 0 7px;
            width: 80px;

            a {
              color: #333;
              margin-right: 5px;
            }

            i {
              border: 1px solid #d7d7d7;
              padding: 1px 3px;
              border-radius: 8px;
            }
          }
        }
      }
    }

    .search-main {
      height: 40px;

      .search-text {
        border: 3px solid #ff3c1b;
        width: 485px;
        float: left;
        height: 24px;
        line-height: 24px;
        padding: 17px 10px;
        overflow: hidden;
        color: #666;
        outline: 0;
      }

      .search-btn {
        background: #ff3c1b;
        width: 90px;
        height: 40px;
        float: left;
        line-height: 35px;
        text-align: center;
        color: #fff;
        font-size: 16px;
        cursor: pointer;
        border: none;
      }
    }
  }
}
</style>
