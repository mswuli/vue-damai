<template>
  <div>
    <headerSimple title="欢迎登录" />
    <div class="login-bg">
      <div class="login-main">
        <Row>
          <Col class="login-left" span="13">
          <a href="javascript:;"><img :src="imgcode" alt="loginIMg"></a>
          </Col>
          <Col class="login-right" span="11">
          <Tabs type="card">
            <!-- 账户登录 -->
            <Tab-pane label="账户登录">
              <div class="login-part1">
                <i-form ref="formPhoneLogin" :model="formPhoneLogin" :rules="ruleForm">
                  <Form-item prop="phone">
                    <Input type="text" size="large" key="username-input" v-model="formPhoneLogin.phone" placeholder="请输入手机号码">
                    <Icon type="android-contact" slot="prepend"></Icon>
                    </Input>
                  </Form-item>
                  <Form-item prop="password">
                    <Input type="password" size="large" v-model="formPhoneLogin.password" placeholder="请输入登录密码">
                    <Icon type="android-lock" slot="prepend"></Icon>
                    </Input>
                  </Form-item>
                  <Form-item>
                    <i-button class="login-btn1" type="primary" long @click="login('formPhoneLogin')">登录</i-button>
                  </Form-item>
                </i-form>
                <Row>
                  <Col span='16'>
                  <Checkbox :checked.sync="single">下次自动登录</Checkbox>
                  </Col>
                  <Col span='8'>
                  <a href="javascript:;">忘记密码？</a>
                  <a href="javascript:;" style="color:red;">立即注册</a>
                  </Col>
                </Row>
                <Row class="other-login">
                  <span> 其他登录：</span>
                  <a href="javascript:;"><img :src="weixincode" alt="微信"></a>
                </Row>
              </div>
            </Tab-pane>
            <!-- 短信快捷登录 -->
            <Tab-pane label="短信快捷登录">
              <div class="login-part2">
                <p>验证即登录，未注册将自动创建大麦网账号</p>
                <i-form ref="formMsgLogin" :model="formMsgLogin" :rules="ruleForm">
                  <Form-item prop="phone">
                    <Input type="text" key="phone-input" size="large" v-model="formMsgLogin.phone" placeholder="请输入手机号码">
                    <Icon type="android-contact" slot="prepend"></Icon>
                    </Input>
                  </Form-item>
                  <!-- 滑块 -->
                  <!-- <move style="margin:20px 0 20px;" /> -->
                  <Form-item prop="vcode">
                    <Row>
                      <Col span="13">
                      <Input type="text" v-model="formMsgLogin.vcode" placeholder="动态密码">
                      <Icon type="android-lock" slot="prepend"></Icon>
                      </Input>
                      </Col>
                      <Col span="10" offset="1">
                      <i-button type="ghost" @click="sendMsg">发送动态密码</i-button>
                      </Col>
                    </Row>
                  </Form-item>
                  <Form-item>
                    <i-button class="login-btn1" type="primary" long @click="login('formMsgLogin')">登录</i-button>
                  </Form-item>
                </i-form>
              </div>
            </Tab-pane>
          </Tabs>
          </Col>
        </Row>
      </div>
    </div>
    <footerSimple />
  </div>
</template>

<script>
import validator from "validator";
import headerSimple from "@/components/headerSimple";
import footerSimple from "@/components/footerSimple";
import move from "@/components/move";
import message from "@/utils/message";
import back from "@/utils/back";

import er_code from "./img/loginImg.jpg";
import weixin from "./img/weixin.png";

export default {
  components: { headerSimple, footerSimple, move },
  data() {
    return {
      imgcode: er_code,
      weixincode: weixin,
      single: false,
      formPhoneLogin: {
        phone: "",
        password: ""
      },
      formMsgLogin: {
        phone: "",
        vcode: ""
      },
      ruleForm: {
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
          { type: "string", min: 6, message: "密码长度不能小于6位", trigger: "blur" }
        ],
        vcode: [{ required: true, message: "请填写验证码", trigger: "blur" }]
      }
    };
  },
  methods: {
    login(name) {
      this.$refs[name].validate(valid => {
        if (!valid) {
          return this.$Message.error("表单验证失败");
        }

        let loginUrl;
        let args;
        switch (name) {
          case "formPhoneLogin": {
            const { phone, password } = this.formPhoneLogin;
            loginUrl = "postUserLogin";
            args = [phone, password];
            break;
          }
          case "formMsgLogin": {
            const { phone, vcode } = this.formMsgLogin;
            loginUrl = "postUserLoginForMsg";
            args = [phone, vcode];
            break;
          }
          default: {
            throw new Error(`${name} is not the expected value`);
          }
        }
        this.$http
          [loginUrl](...args)
          .then(res => {
            const { messageType, defMsg, success } = message(
              res,
              "登录成功",
              "登录失败"
            );
            this.$Message[messageType]({
              content: res.msg || defMsg,
              onClose: () => {
                if (success) back(this.$route);
              }
            });
          })
          .catch(err => console.log(err));
      });
    },
    sendMsg() {
      this.$refs.formMsgLogin.validateField("phone", err => {
        if (err) return;
        const { phone } = this.formMsgLogin;
        this.$http
          .postUserMsg(phone)
          .then(res => {
            const { messageType, defMsg } = message(res, "验证码发送成功", "验证码发送失败");
            this.$Message[messageType](res.msg || defMsg);
          })
          .catch(e => console.log(e));
      });
    }
  }
};
</script>

<style lang="less" scoped>
.login-bg {
  width: 100%;
  background: #f5f5f5;
}
.login-main {
  width: 1000px;
  margin: 0 auto;
  // border: 1px solid red;
  padding: 90px 0 100px;
}
.login-left img {
  width: 526px;
  height: 398px;
}
.login-right {
  border: 1px solid #e6e6e6;
  background-color: #fff;
  // 设置了右边表单的高度
  height: 398px;


  .login-btn1 {
    height: 40px;
    margin-top: 10px;
  }
  .login-part1,
  .login-part2 {
    margin: 0 26px 30px;
  }
  .other-login {
    margin-top: 16px;
    span {
      height: 24px;
      display: inline-block;
      vertical-align: middle;
    }
    img {
      width: 24px;
      height: 24px;
      vertical-align: middle;
    }
  }

  .login-part2 p {
    margin: 20px 0 30px;
  }
}
</style>
