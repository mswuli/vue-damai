<template>
    <div>
        <div class="mess-box">
            <hr>
            <div class="title">写剧评</div>
            <div class="body ">
                <div class="comments-rate">
                    <label for="">打个分吧：</label>
                    <Rate allow-half v-model="comData.score"></Rate>
                    <span class="com-rate-text">{{comData.score}}</span>
                </div>
                <div class="comments-input">
                    <Input v-model="comData.comment" type="textarea" :rows="4" placeholder="写个评价吧10-10000字..."></Input>
                </div>
                <div class="btns">
                    <Button type="primary" @click="commitComments" style="width:150px;height:40px;">评价</Button>
                </div>
            </div>
        </div>
        <comments v-for="item in comments" :item-data='item' />
    </div>
</template>
<script>

import comments from "@/components/comments";
export default {
  data() {
    return {
      comData: {
        score: 0,
        itemId: "",
        userId: "",
        comment: ""
      },
      comments:[]
    };
  },
  methods: {
    commitComments() {
      if (this.comData.score > 0 && this.comData.comment && this.comData.comment != null) {
        this.$http
          .postRequest({ type: "postComments", data: this.comData })
          .then(res => {
            this.$Message.success("提交数据成功！");
            this.getComments();
          });
      }else{
          this.$Message.info("请编写提交数据信息！");
      }
    },
    getComments(){
        this.$http.postRequest({ type: "getComments",data:{id:this.itemData.id} }).then(res => {
      if(res.data&& res.data.length>0){
        this.comments = res.data;
      }
    }); 
    }

  },
  mounted() {
    /* 
      通过此方法获取当前node节点的显示信息，参照nodeid为基础进行数据查询，
      */
      this.getComments();
  },
  props: ["itemData"],
  components: {
    comments
  }
};
</script> 
