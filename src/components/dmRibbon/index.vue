<template>
  <div class="dm-ribbon">
    <!-- <riband v-if="param.type=='riband'" :param="param"/>   -->
    <riband v-if="param.type=='riband'" :param="param"/>  
    <totem v-if="param.type=='totem'" :param="param"/>  
    <slot></slot>
  </div>
</template>
<script>
/* 
  param 父节点调研传递参数：
  type： 显示类型
  color：显示的颜色是什么
 */
import riband from './riband'
import totem from './totem'
export default {
  data() {
    return {};
  },
  props: ["param"],
  components: {
    riband,totem
  }
};
</script>

<style lang="less" scoped>
.dm-ribbon {
  position: relative;
  z-index: 0;
  margin:20px 0 ;
  padding: 5px 0;
}
</style>
