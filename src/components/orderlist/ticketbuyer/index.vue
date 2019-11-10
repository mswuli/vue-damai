<template>
    <div class="ticketbuyer">
        <div class="buyer-btn">
            <Button type="error" @click="modalbuyer = true">新建购票人</Button>

            <Modal v-model="modalbuyer" title="常用购票人" @on-ok="ok">
                <!-- 表单开始 -->
                <Form ref="formValidate" :model="formValidate" :rules="ruleValidate" :label-width="80">
                    <FormItem label="用户姓名" prop="name">
                        <Input v-model="formValidate.name" placeholder="请输入您的用户姓名"></Input>
                    </FormItem>
                    <FormItem label="身份证号" prop="idCard">
                        <Input v-model="formValidate.idCard" placeholder="请输入身份证号码"></Input>
                    </FormItem>
                    <FormItem label="卡类型" prop="cardType">
                        <Select v-model="formValidate.cardType" placeholder="请输入卡类型">
                            <Option value="0">身份证</Option>
                            <Option value="1" disabled>军官证</Option>
                        </Select>
                    </FormItem>
                </Form>
                <!-- 表单结束 -->
            </Modal>
        </div>
        <Table border :columns="columns" :data="databuyer" @on-selection-change="selectoption"></Table>
    </div>
</template>

<script>
export default {
  data() {
    return {
      columns: [
        {
          type: "index",
          width: 60,
          align: "center"
        },
        {
          title: "姓名",
          key: "name"
        },
        {
          title: "卡类型",
          key: "cardType"
        },
        {
          title: "身份证号",
          key: "idCard"
        },
        {
          title: "操作",
          key: "action",
          width: 150,
          align: "center",
          render: (h, params) => {
            return h("div", [
              h(
                "Button",
                {
                  props: {
                    type: "error",
                    size: "small"
                  },
                  on: {
                    click: () => {
                      this.remove(params.index, params.row.linkId);
                      //   console.log("params="+JSON.stringify(params))
                    }
                  }
                },
                "删除"
              )
            ]);
          }
        }
      ],
      databuyer: [
        /*{
          name: "John Brown",
          cardType: "身份证",
          idCard: "37088923839435454"
        } */
      ],
      // 添加购票人
      modalbuyer: false,
      // 表单
      /* 
      name	字符串	用户姓名
      idCard	字符串	身份证号码
      cardType	字符串	卡类型(0:身份证,1:军官证) 
      */
      formValidate: {
        // 用户姓名
        name: "",
        // 身份证号码
        idCard: "",
        // 卡类型
        cardType: ""
      },
      // 验证信息
      ruleValidate: {
        name: [
          {
            required: true,
            message: "姓名不能为空",
            trigger: "blur"
          }
        ],
        idCard: [
          {
            required: true,
            message: "身份证号不能为空",
            trigger: "blur"
          },
          {
            type: "string",
            min: 15,
            message: "身份证号不能少于15位",
            trigger: "blur"
          }
        ],
        cardType: [
          {
            required: true,
            message: "卡类型不能为空",
            trigger: "change"
          }
        ]
      },
      linkIds: []
    };
  },
  components: {},
  props: ["params", "num"],
  methods: {
    // 删除购票人
    remove(index, linkId) {
      // 删除当前列
      this.databuyer.splice(index, 1);
      // 根据linkId返回给后台接口
      this.$http
        .postRequest({
          type: "deleteTicketBuyer",
          data: {
            // 输入为 用户ID
            linkId: linkId
          }
        })
        .then(res => {
          //  对用用户的信息
          //  console.log("对用用户的购票人列表 = " + JSON.stringify(res.data));
          //  卡类型(0:身份证,1:军官证)
          //   this.databuyer = res.data;
          //  调用查询接口渲染
          this.getbuyerlist();
        });
    },
    // 获得自己的购票人列表
    getbuyerlist() {
      this.$http
        .postRequest({
          type: "ticketBuyerList"
        })
        .then(res => {
          //  对用用户的信息
          //  console.log("对用用户的购票人列表 = " + JSON.stringify(res.data));
          //  卡类型(0:身份证,1:军官证)
          for (var i in res.data) {
            if (res.data[i].cardType == 0) {
              res.data[i].cardType = "身份证";
            } else {
              res.data[i].cardType = "军官证";
            }
          }
          this.databuyer = res.data;
        });
    },
    // 新建购票人
    addbuyer() {
      //   console.log("this.formValidate ===" + JSON.stringify(this.formValidate));
      this.$http
        .postRequest({
          type: "addTicketBuyer",
          // 提交的数据
          data: this.formValidate
        })
        .then(res => {
          //  对用用户的信息
          console.log("添加成功= " + res.data);
        });
    },
    // 购票人人的信息置为空
    setNull() {
      this.formValidate.name = "";
      this.formValidate.idCard = "";
      this.formValidate.cardType = "0";
    },
    // 验证购票人是否存在
    validateexist() {
      this.$http
        .postRequest({
          type: "validateBuyerExist",
          data: {
            // 输入为 用户ID
            idCard: this.formValidate.idCard
          }
        })
        .then(res => {
          //  对添加购票的人做判断
          if (res.errorCode == 1009) {
            this.$Notice.warning({
              title: "购票人已经存在，请重新添加哦"
            });
            // 购票人人的信息置为空
            this.setNull();
          } else {
            // 点击确定之后 提交新增购票人
            this.addbuyer();

            this.$Notice.warning({
              title: "添加成功"
            });
            // 购票人人的信息置为空
            this.setNull();
            // 添加成功之后，调用查询接口渲染
            this.getbuyerlist();
          }
        });
    },
    // 确定添加购票人
    ok() {
      // 首先判断索要添加的购票人是否存在了
      this.validateexist();
    },
    // 选中项目
    selectoption(e) {
      //   console.log(JSON.stringify(e));
      //   console.log(e.length);
      if (e.length == this.num) {
        this.$Notice.success({
          title: "人数等于购票数量,请不要继续选择了"
        });
        for (var i = 0; i < e.length; i++) {
          this.linkIds.push(e[i].linkId);
        }
        this.$emit("listenbuyer", this.linkIds.toString());
        this.linkIds = [];
      } else if (e.length > this.num) {
        this.$Notice.error({
          title: "人数已超过购票数量"
        });
      }
      // 数组转为字符串
      //   console.log("this.linkIds字符串=" + typeof this.linkIds.toString());
      //   console.log("this.linkIds字符串=" + this.linkIds.length);
      //   console.log("this.num=" + this.num);
    }
  },
  mounted() {
    // 组件挂载时候，去调用自己的购票人列表
    this.getbuyerlist();
  },
  watch: {
    params: function() {
      //   console.log("params=" + JSON.stringify(this.params));
      // 只有当 传递的 param组件有变化的时候才会改变参数
      this.columns = this.params;
    }
  }
};
</script>

<style lang="less" scoped>
.buyer-btn {
  padding: 0 0 20px;
  overflow: hidden;
  button {
    float: right;
  }
}
</style>
