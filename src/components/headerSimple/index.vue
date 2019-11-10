
<template>
  <header id="headSimple">
    <div class="wrap">
      <a href="#" <img :src='imglogo' alt="LOGO"></a>
      <span class="icon"></span>
      <h1>{{title || ''}}</h1>
    </div>
  </header>
</template>



<script>
import logo from "./img/logo.png";
export default {
  props: ["title"],
  data() {
    return {
      imglogo: logo
    };
  }
};
</script>


<style lang="less" scoped>
#headSimple {
  width: 100%;
  background-color: #fff;

  .wrap {
    width: 1000px;
    margin: 0 auto;
    height: 88px;
  }
}
#headSimple img {
  width: 196px;
  height: 58px;
  // margin-left: 50px;
  margin-top: 16px;
}
.icon {
  display: inline-block;
  width: 2px;
  height: 50px;
  background-color: #dadada;
  margin-top: 6px;
  margin-left: 12px;
}
h1 {
  display: inline-block;
  font-size: 22px;
  vertical-align: top;
  margin-left: 12px;
  margin-top: 34px;
}
</style>
