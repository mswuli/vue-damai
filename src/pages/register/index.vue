<template>
  <div>
    <headerSimple title="账户注册" />

    <section class="registerMian">
      <div class="form">
        <i-form ref="formInline" :model="formInline" :rules="ruleInline">
          <Form-item class="margin-B" prop="phone">
            <i-input type="text" size="large" v-model="formInline.phone" placeholder="请输入手机号">
              <Icon type="android-contact" slot="prepend"></Icon>
            </i-input>
          </Form-item>
          <Form-item class="margin-B" prop="password">
            <i-input type="password" size="large" v-model="formInline.password" placeholder="请输入登录密码">
              <Icon type="android-lock" slot="prepend"></Icon>
            </i-input>
          </Form-item>
          <Form-item class="margin-B" prop="passwdCheck">
            <i-input type="password" size="large" v-model="formInline.passwdCheck" placeholder="请确认登录密码">
              <Icon type="android-lock" slot="prepend"></Icon>
            </i-input>
          </Form-item>
          <Form-item prop="vcode">
            <Row>
              <i-col span="13">
                <i-input type="text" v-model="formInline.vcode" placeholder="请输入验证码">
                  <Icon type="chatbox-working" slot="prepend"></Icon>
                </i-input>
              </i-col>
              <i-col span="10" offset="1">
                <i-button type="ghost" @click="getCode">获取验证码</i-button>
              </i-col>
            </Row>
          </Form-item>
          <Form-item>
            <i-button class="margin-B" type="error" long @click="handleSubmit('formInline')">立即注册</i-button>
          </Form-item>
        </i-form>
      </div>
    </section>

    <footerSimple/>
  </div>
</template>

<script>
import validator from "validator";
import headerSimple from "@/components/headerSimple";
import footerSimple from "@/components/footerSimple";
import message from "@/utils/message";

export default {
  components: { headerSimple, footerSimple },
  data() {
    return {
      formInline: {
        phone: "",
        password: "",
        passwdCheck: "",
        vcode: ""
      },
      ruleInline: {
        phone: [
          { required: true, message: "请填写手机号", trigger: "blur" },
          {
            validator: (rule, value, callback) => {
              if (!validator.isMobilePhone(value, "zh-CN")) {
                callback(new Error("请输入正确的手机号码"));
              }
              callback();
            },
            trigger: "blur"
          }
        ],
        password: [
          { required: true, message: "请填写密码", trigger: "blur" },
          { type: "string", min: 6, message: "密码长度不能小于6位", trigger: "blur" },
          {
            validator: (rule, value, callback) => {
              this.$refs.formInline.validateField("passwdCheck");
              callback();
            },
            trigger: "blur"
          }
        ],
        passwdCheck: [
          { required: true, message: "请填写确认密码", trigger: "blur" },
          { type: "string", min: 6, message: "确认密码长度不能小于6位", trigger: "blur" },
          {
            validator: (rule, value, callback) => {
              if (value !== this.formInline.password) {
                callback(new Error("两次密码输入不一致"));
              }
              callback();
            },
            trigger: "blur"
          }
        ],
        vcode: [{ required: true, message: "请填写验证码", trigger: "blur" }]
      }
    };
  },
  methods: {
    // 点击“获取验证码”按钮时提交请求获取验证码
    getCode() {
      if (!validator.isMobilePhone(this.formInline.phone || "", "zh-CN")) {
        return this.$Message.error("请输入正确的手机号");
      }
      this.$http
        .postUserCode(this.formInline.phone)
        .then(res => {
          const { messageType, defMsg } = message(res, "验证码发送成功", "验证码发送失败");
          this.$Message[messageType](res.msg || defMsg);
        })
        .catch(err => console.log(err));
    },
    // 点击立即注册时发送注册请求
    handleSubmit(name) {
      this.$refs[name].validate(valid => {
        if (!valid) {
          return this.$Message.error("表单验证失败");
        }
        const { phone, password, vcode } = this.formInline;
        this.$http
          .postUserRegister(phone, password, vcode)
          .then(res => {
            const { messageType, defMsg, success } = message(
              res,
              "注册成功，将跳到登陆页",
              "注册失败"
            );
            this.$Message[messageType]({
              content: res.msg || defMsg,
              onClose: () => {
                if (success) {
                  this.$router.replace("/login");
                }
              }
            });
          })
          .catch(err => console.log(err));
      });
    }
  }
};
</script>

<style lang="less" scoped>
.registerMian {
  width: 100%;
  min-width: 1000px;
  padding: 90px 0 100px;
  background-color: #f5f5f5;
  .form {
    width: 1000px;
    padding: 50px 200px;
    box-sizing: border-box;
    background-color: #fff;
    margin: 0 auto;
    .margin-B {
      margin-bottom: 30px;
    }
  }
}
</style>
