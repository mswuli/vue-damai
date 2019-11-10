<template>
    <div :class="'riband ' + param.extendType.color">
        <h2>
            <span>{{param.extendType.name}}</span>
        </h2>
    </div>
</template>
<script>
export default {
  data() {
    return {};
  },
  props: ["param"]
};
</script>
 <style lang="less" scoped>
@red: #d8364d;
@red-h2: #f44a62;
@purple: #8534cb;
@purple-h2: #a042f0;
@pink: #cf3f64;
@pink-h2: #f75b83;
@orange: #d17d0f;
@orange-h2: #f89a1f;
.riband-comment {
  h2:before {
    left: -26px;
    border-left-color: transparent;
  }
  h2:after {
    right: -26px;
    border-right-color: transparent;
  }
}
.riband-border(@red) {
  border: 12px solid @red;
  border-bottom: 20px solid @red;
  border-top: 20px solid @red;
}
.riband-h2(@red-h2) {
  background-color: @red-h2;
}
.riband {
  h2 {
    font-weight: normal;
    position: relative;
    .riband-h2(@red-h2);
    width: 130px;
    color: #ffffff;
    text-align: center;
    padding: 10px 20px;
    margin: 10px auto;
    text-transform: uppercase;
    border-radius: 6px;
    font-size: 14px;
  }

  h2:before,
  h2:after {
    content: "";
    position: absolute;
    display: block;
    top: 2px;
    width: 60px;
    .riband-border(@red);
    border-radius: 5px;
    height: 30px;
    z-index: -1;
  }
  .riband-comment;
}
.purple {
  h2 {
    .riband-h2(@purple-h2);
  }
  h2:before,
  h2:after {
    .riband-border(@purple);
  }
  .riband-comment;
}
.pink {
  h2 {
    .riband-h2(@pink-h2);
  }
  h2:before,
  h2:after {
    .riband-border(@pink);
  }
  .riband-comment;
}
.orange {
  h2 {
    .riband-h2(@orange-h2);
  }
  h2:before,
  h2:after {
    .riband-border(@orange);
  }
  .riband-comment;
}
</style> 