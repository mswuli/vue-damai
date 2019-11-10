<template>
    <div class="show-ticket-message"  >
        <div v-html="itemData.basicDescription"></div>
        <div v-html="itemData.projectDescription"></div>
   
        <!-- <div class="mess-box">
            <hr>
            <div class="title">基本信息</div>
            <div class="body ">
                <table>
                    <tr class="row">
                        <td class="column">演出时间</td>
                        <td class="column">2018.01.06-01.14</td>
                        <td class="column">演出场馆</td>
                        <td class="column">光华路5号国际会展中心三楼湖西岛音乐厅</td>
                    </tr>
                    <tr class="row">
                        <td class="column">演出时间</td>
                        <td class="column">2018.01.06-01.14</td>
                        <td class="column">演出场馆</td>
                        <td class="column">光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅光华路5号国际会展中心三楼湖西岛音乐厅</td>
                    </tr>
                </table>
            </div>
        </div> -->
        <!-- <div class="mess-box">
            <hr>
            <div class="title">项目介绍</div>
            <div class="body">
                <div class="project-desc">
                    <div class="pro-title">英文站入口</div> 
                    <p>英文站购买链接：https://en.dami.cn/event/tickets_135693/</p>
                    <div class="pro-title">演出介绍</div>
                    <p>世界经典原版音乐剧《猫》 </p>
                     <p>猫的足迹</p> 
                     <p>超过20种语言，30个国家，300座城市，7300万观众超过20种语言，30个国家，300座城市，7300万观众超过20种语言，30个国家，300座城市，7300万观众超过20种语言，30个国家，300座城市，7300万观众超过20种语言，30个国家，300座城市，7300万观众超过20种语言，30个国家，300座城市，7300万观众超过20种语言，30个国家，300座城市，7300万观众 </p> 
                     <p>横扫7座托尼奖，囊获奥利弗奖、格莱美奖等全球主要奖项</p> 
                     <p>伦敦西区及纽约百老汇有史以来成功、连续公演最久的音乐剧之一</p> 
                      <p class="p-img">
                          <img :src="imgurl"  alt="">
                      </p>
                     <p>伦敦西区及纽约百老汇有史以来成功、连续公演最久的音乐剧之一</p> 
                     <p>伦敦西区及纽约百老汇有史以来成功、连续公演最久的音乐剧之一</p> 
                     <p>伦敦西区及纽约百老汇有史以来成功、连续公演最久的音乐剧之一</p> 
                </div>
            </div>
        </div> -->
        <writeComments :item-data="itemData"/>
    </div>
</template>
<script>
import img_01 from "./img/img_01.png";
import writeComments from "./writeComments";
export default {
  data() {
    return {
       imgurl: img_01
    };
  },
  methods: {},
  mounted() {
    /* 
      通过此方法获取当前node节点的显示信息，参照itemData为基础进行数据查询，
      */
  },
  props: ["itemData"],
  components: {
    writeComments
  }
};
</script> 
