<template>
  <div class="personinfo">
    <Tabs type="card" :animated="false" name="info1" @on-click="">
      <Tab-pane name="info1" label="基本资料">
        <p class="tip">完善更多个人信息，有助于我们为您提供更加个性化的服务，大麦网将尊重并保护您的隐私。</p>
        <!-- 表单提交开始 -->
        <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
          <FormItem label="昵称" prop="nickName">
            <Input v-model="formValidate.nickName" placeholder="请输入您的昵称"></Input>
          </FormItem>
          <FormItem label="联系电话" prop="phone">
            <Input v-model="formValidate.phone" placeholder="请输入联系电话"></Input>
          </FormItem>
          <FormItem label="真实姓名" prop="realName">
            <Input v-model="formValidate.realName" placeholder="请输入真实姓名"></Input>
          </FormItem>
          <FormItem label="身份证号" prop="idCard">
            <Input v-model="formValidate.idCard" placeholder="请输入身份证号"></Input>
          </FormItem>
          <FormItem label="生日" prop="birthday">
            <DatePicker format="yyyy-MM-dd" type="date" placeholder="请选择" v-model="formValidate.birthday"></DatePicker>
          </FormItem>
          <FormItem label="性别" prop="sex">
            <RadioGroup v-model="formValidate.sex">
              <Radio label="0">男</Radio>
              <Radio label="1">女</Radio>
            </RadioGroup>
          </FormItem>
          <FormItem>
            <Button type="primary" @click="handleSubmit('formValidate')">保存</Button>
          </FormItem>
        </Form>
        <!-- 表单提交结束 -->
      </Tab-pane>
      <Tab-pane name="info2" label="头像设置">
        <!-- 头像开始 -->
        <div class="clearfix">
          <div class="upload-main fl">
            <Upload ref="upload" :show-upload-list="false" :on-success="handleSuccess" :format="['jpg','jpeg','png']" :max-size="2048" :on-format-error="handleFormatError" :on-exceeded-size="handleMaxSize" multiple type="drag" action="//jsonplaceholder.typicode.com/posts/" style="display: inline-block;">
              <div style="width: 158px;height:158px;line-height: 188px;">
                <Icon type="camera" size="60"></Icon>
              </div>
            </Upload>
            <p>请选择一张照片,支持jpg、jpeg、png格式</p>
          </div>
          <div class="demo-upload-list fl">
            <!-- 如果请求后台个人信息当中有头像存在的话并且没有手动上传头像的话，就用自己的头像 -->
            <img v-if="flag" :src="formValidate.headUrl">
            <!-- 如果不存在的话，就用icon先占领位置 -->
            <Icon v-if="uploadList.status != 'finished'" type="person" style="font-size:50px"></Icon>
            <template v-if="uploadList.status === 'finished'">
              <img :src="uploadList.url">
            </template>
          </div>
        </div>

        <!-- 头像结束 -->
      </Tab-pane>
      <Tab-pane name="info3" label="兴趣爱好">
        <div style="width:500px">
          <Input v-model="formValidate.interest" type="textarea" :rows="4" placeholder="请输入兴趣爱好..."></Input>
          <Button style="margin-top:30px;" type="primary" @click="submitinterest">保存</Button>
        </div>
      </Tab-pane>

    </Tabs>
  </div>
</template>

<script>
export default {
  data() {
    return {
      // 个人信息的数据
      formValidate: {
        // 昵称
        nickName: "",
        // 联系电话
        phone: "",
        // 真实姓名
        realName: "",
        // 身份证号
        idCard: "",
        // 性别
        sex: "",
        // 生日
        birthday: "",
        // 头像
        headUrl: "",
        // 爱好
        interest: ""
      },
      // 验证信息
      ruleValidate: {
        nickName: [
          {
            required: true,
            message: "昵称不能为空",
            trigger: "blur"
          }
        ],
        phone: [
          {
            required: true,
            message: "电话号码不能为空",
            trigger: "blur"
          }
        ]
      },
      //  头像开始
      defaultList: [
        {
          name: "bc7521e033abdd1e92222d733590f104",
          url:
            "https://o5wwk8baw.qnssl.com/bc7521e033abdd1e92222d733590f104/avatar"
        }
      ],
      imgName: "",
      uploadList: {},
      // 控制头像显示隐藏
      flag: false,
      isValidate: ""
    };
  },
  components: {},
  props: ["infos", "isinfo"],
  methods: {
    // 判断包含子串，则返回大于等于0的索引，否则返回-1
    isContains(str, substr) {
      return str.indexOf(substr) >= 0;
    },
    // 提交修改个人信息
    handleSubmit() {
      // console.log("个人信息=" + JSON.stringify(this.formValidate));
      let nickName = this.isContains(
        this.isValidate,
        this.formValidate.nickName
      );
      let phone = this.isContains(this.isValidate, this.formValidate.phone);
      let realName = this.isContains(
        this.isValidate,
        this.formValidate.realName
      );
      let idCard = this.isContains(this.isValidate, this.formValidate.idCard);
      let sex = this.isContains(this.isValidate, this.formValidate.sex);
      //  取出日期的 完整日期部分来做判断
      let str = JSON.stringify(this.formValidate.birthday);
      let strsub = str.substring(0, 11);
      let birthday = this.isContains(this.isValidate, strsub);
      // 只要是一个有修改就可以提交内容
      let formFlag = nickName && phone && realName && idCard && sex && birthday;
      console.log("formFlag = " + formFlag);
      if (formFlag) {
        this.$Notice.warning({
          title: "请修改之后再提交哦"
        });
      } else {
        this.$http
          .postRequest({
            type: "modifyPersonInfo",
            data: this.formValidate
          })
          .then(res => {
            //  修改用户的信息，返回结果
            console.log("是否修改信息 = " + res.data);
          });
      }
    },
    // 头像开始
    // 图片提交成功时
    handleSuccess(res, file, fileList) {
      // 需要请求后台接口，返回一个token，然后携带该token上传
      console.log("图片上传file=" + JSON.stringify(file));
      console.log("图片上传fileList=" + JSON.stringify(fileList[0]));
      //图片上传file={"status":"finished","name":"1.png","size":7525,"percentage":100,"uid":1515392597210,"showProgress":true,"response":{"id":101}}
      /* file.url =
        "https://o5wwk8baw.qnssl.com/7eb99afb9d5f317c912f08b5212fd69a/avatar";
      file.name = "7eb99afb9d5f317c912f08b5212fd69a"; */

      // console.log("图片上传uploadList"+ JSON.stringify(this.uploadList))
      this.uploadList = fileList[0];
      this.uploadList.name = "7eb99afb9d5f317c912f08b5212fd69a";
      this.uploadList.url =
        "https://o5wwk8baw.qnssl.com/7eb99afb9d5f317c912f08b5212fd69a/avatar";
    },
    // 图片格式验证方法
    handleFormatError(file) {
      this.$Notice.warning({
        title: "文件格式不正确",
        desc: "文件 " + file.name + " 格式不正确，请上传 jpg 或 png 格式的图片。"
      });
    },
    // 图片大小验证方法
    handleMaxSize(file) {
      this.$Notice.warning({
        title: "超出文件大小限制",
        desc: "文件 " + file.name + " 太大，不能超过 2M。"
      });
    },
    // 提交图片之前的钩子函数
    /*  handleBeforeUpload() {
      const check = this.uploadList.length < 5;
      if (!check) {
        this.$Notice.warning({
          title: "只能传一张头像."
        });
      }
      return check; 
    }, */
    // 头像结束

    // 兴趣爱好开始
    submitinterest() {
      // 先判断是否修改了
      if (this.isContains(this.isValidate, this.formValidate.interest)) {
        this.$Notice.warning({
          title: "请修改之后再提交哦"
        });
      } else {
        this.$http
          .postRequest({
            type: "modifyPersonInfo",
            data: {
              interest: this.formValidate.interest
            }
          })
          .then(res => {
            //  修改用户的信息，返回结果
            console.log("是否修改信息123 = " + res.data);
          });
      }
    }
    // 兴趣爱好结束
  },
  // 侦听属性。有一些数据需要随着其它数据变动而变动时使用
  watch: {
    infos: function() {
      this.formValidate = this.infos;
      /* console.log(
        "formValidate--this.infos = " + JSON.stringify(this.formValidate)
      ); */
      // 初始状态时，控制头像是否显示
      this.flag =
        this.formValidate.headUrl != "" && this.uploadList.status != "finished";
    },
    isinfo: function() {
      this.isValidate = this.isinfo;
    },
    uploadList: function() {
      // 当上传新的头像时候，控制原来的头像隐藏
      this.flag =
        this.formValidate.headUrl != "" && this.uploadList.status != "finished";
    }
  },
  mounted() {
    // 头像
    this.uploadList = this.$refs.upload.fileList;
  }
};
</script>

<style lang="less" scoped>
// 根据需求修改iview样式信息
@import "../../../../static/less/custom.less";

.personinfo {
  .tip {
    background: #fffdee;
    border: 1px solid #edd28b;
    padding: 10px 20px;
    color: #999;
    margin-bottom: 15px;
  }

  .upload-main {
    height: 400px;
    width: 400px;
    text-align: center;
    p {
      line-height: 30px;
    }
  }
}
</style>
<style lang="less">
.personinfo {
  .ivu-tabs {
    // border: 1px solid #ececec;
    padding-bottom: 10px;
  }
  .ivu-tabs-bar {
    margin-bottom: 0;
  }
  .ivu-tabs-content {
    border: 1px solid #ececec;
    border-top: none;
    padding: 20px 20px 120px;
  }
  .ivu-form {
    width: 400px;
  }
  // 头像开始
  .demo-upload-list {
    // display: inline-block;
    width: 150px;
    height: 150px;
    text-align: center;
    line-height: 150px;
    border: 1px solid transparent;
    border-radius: 4px;
    overflow: hidden;
    background: #fff;
    position: relative;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
    margin-right: 4px;
    img {
      width: 100%;
      height: 100%;
    }
  }
  .demo-upload-list-cover {
    display: none;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: rgba(0, 0, 0, 0.6);
    i {
      color: #fff;
      font-size: 20px;
      cursor: pointer;
      margin: 0 2px;
    }
  }
  .demo-upload-list:hover {
    .demo-upload-list-cover {
      display: block;
    }
  }
  // 头像结束
}
</style>

