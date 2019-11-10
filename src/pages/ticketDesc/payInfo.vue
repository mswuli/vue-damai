<template>
    <div style="padding-bottom:20px;">
        <div class="mess-box by-info">
            <hr>
            <div class="title">在线支付</div>
            <div class="body ">
                <div class="info-row">

                    <p> 支持多家网上银行、支付平台（支付宝、快钱、银联、微信支付等）在线支付，查看详情>>
                    </p>
                    <p style="font-size:18px;margin-top:5px;">支付平台：</p>
                    <p class="info-img">
                        <img :src="icons05" alt="">
                        <img :src="icons06" alt="">
                    </p>
                </div>
            </div>
        </div> 
        <div class="mess-box by-info">
            <hr>
            <div class="title">柜台付款</div>
            <div class="body ">
                <div class="info-row">

                    <p> 您也可以选择就近的公司网点，到柜台直接付款购买，查看分公司上门地址>></p>

                </div>
            </div>
        </div>
        <div class="mess-box by-info">
            <hr>
            <div class="title">电子钱包</div>
            <div class="body ">
                <div class="info-row">

                    <p> 电子钱包是由大麦网自主研发的第三方支付平台，为每一个用户在购票过程中提供"简单、安全、快速"的在线支付解决方案； 查看详情>>
                    </p>

                </div>
            </div>
        </div>
    </div>
</template>
<script>
import icons01 from "./img/icons-android.png";
import icons02 from "./img/icons-iphone.png";
import icons03 from "./img/icons-ipad.png";
import icons04 from "./img/icons-steps.png";
import icons05 from "./img/icons-zfb.png";
import icons06 from "./img/icons-wx.png";
export default {
  data() {
    return {
      icons01,
      icons02,
      icons03,
      icons04,
      icons05,
      icons06
    };
  }
};
</script>
