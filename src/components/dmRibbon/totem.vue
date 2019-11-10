<template>
    <div class="totem">
        <div class="totem-background"></div>
        <h2>{{param.extendType.name}}</h2>
    </div>
</template>
<script>
export default {
  data () {
      return {
          
      }
  },props: ["param"]
}
</script>

<style lang="less" scoped>
.totem {
  height: 60px;
  .totem-background {
    height: 50px;
    width:618px;
    margin: 10px auto;
    background-image: url('img/ribbon-totem.png') ;
  }
  h2 {
    font-weight: Bold;
    width: 130px;
    text-align: center;
    margin: -60px auto;
    text-transform: uppercase;
    font-size: 18px;
  }
}
</style>
