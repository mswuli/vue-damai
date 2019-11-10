<template>
    <div class="tickets-comments">
        <div class="comments-left">
            <p>
                <img :src="itemData.imgUrl" alt="">
            </p>
            <div>
                {{itemData.userId}}
            </div>
        </div>
        <div class="comments-right">
            <p class="com-right-desc">
                {{itemData.content}}
            </p>
            <p>
                <Rate disabled allow-half  :value="itemData.score"></Rate>
                <span> {{itemData.createdTime}}</span>
            </p>
        </div>
    </div>
</template>
<script>
import img_01 from "./img/user.png";
export default {
  data() {
    return {
      imgUrl: img_01,
      rateVal:4.5
    };
  },
  props:["itemData"] 
};
</script>

<style lang="less" scoped>
.tickets-comments {
  margin-left: 15px;
  margin-bottom: 37px;
  .comments-left,
  .comments-right {
    display: inline-block;
  }
  .comments-left {
    text-align: center;
    img {
      width: 44px;
      height: 44px;
    }
    margin-right: 10px;
  }
  .comments-right {
    vertical-align: top;
    margin-left: 40px;
    width: 740px;
    height: 87px;
    background-color: #f0f0f0;
    padding: 21px 0 15px 29px;
    .com-right-desc{
        font-size: 14px;
        margin-bottom: 10px;
    }
    
  }
}
</style>
