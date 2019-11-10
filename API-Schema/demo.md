### API名称
#### API METHOD :　［POST］
#### INPUT
> 无

需要传递参数时：
~~~javascript
{
    username : 'string', //登录用户名，必填
    password : 'string' //登录密码，必填
}
~~~

#### **OUTPUT**
~~~javascript
{
     success : true | false, //系统是否正常运行，若报异常，返回false
     statusCode :  '自定义业状态码', //1：xxx 2：xxx
     errorCode : '错误码',
     massge:'' //当errorCode有值时，对应的错误信息
     data:{
          userDTO : {},
          otherDTO:[]
      }
}
~~~

#### 字段说明
~~~java
public static void main(String[] agrs){
    System.out.println("Hello");
}
~~~