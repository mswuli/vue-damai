<template>
    <div style="padding-bottom:20px;">
        <div class="mess-box by-info">
            <hr>
            <div class="title">特别提示</div>
            <div class="body ">
                <div class="info-row">
                    <div class="info-title">
                        售前提示
                    </div>
                    <p> 1.为避免快递配送不能及时送达，演出距开场时间少于3天时不提供【快递配送】服务，请谅解！您可以选择电子票或在线支付后上门自取纸质票。 点击查看上门
                        <a href="">取票地址&gt;&gt;</a>
                    </p>
                    <p>
                        2.凡演出票类商品，开票时间一般为演出前二到四周，正式开票后会第一时间短信通知您，请注意接收。
                    </p>
                    <p>
                        3.如您不是通过“选座购买”通道进行的票品购买，最终票品数量视项目主办方及场馆情况而定，正式开票后大麦网将根据用户付款先后顺序依次配票，可能存在票品不足不能为您配票的风险，如最终未能配票，大麦网承诺全额退款，但不承担其他损失。
                    </p>
                </div>
                <div class="info-row">
                    <div class="info-title">
                        支付方式
                    </div>
                    <p>
                        网上银行（招商银行等） 支付平台（支付宝等） 转账汇款(招商银行等)
                        <a href="">查看详情&gt;&gt;</a>
                    </p>
                </div>
                <div class="info-row">
                    <div class="info-title">
                        退/换货说明
                    </div>
                    <p>
                        针对不可抗力和非不可抗力的退/换票情况和处理，请点击查阅
                        <a href="">大麦网退换货说明&gt;&gt;</a>
                    </p>
                </div>
            </div>
        </div>
        <div class="mess-box by-info">
            <hr>
            <div class="title">无线端购票</div>
            <div class="body ">

                <div class="info-row">
                    <p> 1. 使用智能设备用户在各应用商店中搜索"大麦"下载安装客户端，购票体验更流畅 </p>
                    <p> 2. 非智能设备用户可浏览器访问m.dami.cn进行演出查询，随时购票</p>
                    <p class="info-img">
                        <img :src="icons01" alt="">
                        <img :src="icons02" alt="">
                        <img :src="icons03" alt="">
                    </p>
                </div>

            </div>
        </div>

        <div class="mess-box by-info">
            <hr>
            <div class="title">网上订购</div>
            <div class="body ">
                <div class="info-row">

                    <p> 1. 使用智能设备用户在各应用商店中搜索"大麦"下载安装客户端，购票体验更流畅
                    </p>
                    <p>
                        2. 非智能设备用户可浏览器访问 www.dami.cn进行演出查询，随时购票
                    </p>
                    <p class="info-img">
                        <img :src="icons04" alt="">
                    </p>
                </div>
            </div>
        </div>
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
            <div class="title">电话订购</div>
            <div class="body ">
                <div class="info-row">
                    <p> 全国统一服务热线：1001001010</p>
                </div>
            </div>
        </div>
        <div class="mess-box by-info">
            <hr>
            <div class="title">上门订购</div>
            <div class="body ">
                <div class="info-row">

                    <p>大麦网北京总部 </p>
                    <br>
                    <p>办公地址：北京市东城区东中街32号楼7层（东环广场街心花园对面） 点击查看如何到达 </p>
                    <br>
                    <p>营业时间：星期一至星期日9:00-18:00</p>
                    <br>
                    <p>支付说明：可用POS机刷卡、现金、预存；支票支付（需要支付等同现金，支票入账后返还）；上门购票也可使用：福利卡（福卡）收取3%手续费。特殊项目除外，具体以上门购票为准！ 点击查看周边提款</p>
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
