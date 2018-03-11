<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <title>register</title>
    <!-- CSS -->
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/login2.css">
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <![endif]-->
</head>

<body>
<div class="page-container">
    <h1 style="color: white">请填写注册信息</h1>
    <form id="regForm_mod">
        <span  style="color: white" class="glyphicon glyphicon-user"></span>
        <input type="text" name="username"  id="regName" placeholder="用 户 名" required="required">
        <span style="color: white" class="glyphicon glyphicon-asterisk"></span>
        <input type="password" name="password" id="pwd" placeholder="密　码" required="required">
        <span style="color: white" class="glyphicon glyphicon-asterisk"></span>
        <input type="password" id="pwdRepeat"  placeholder="确 认 密 码" required="required">
        <button type="button" style="background-color: #00b4ef" onclick="REGISTER.reg()">注册</button>
    </form>
</div>

<!-- 注册事件-->

<script type="text/javascript">
    var REGISTER={
        param:{
            surl:""
        },
        inputcheck:function(){
            var flag = true;
            //不能为空检查
            if ($("#regName").val() == "") {
                alert("用户名不能为空！");
                flag = false;
            }
            if ($("#pwd").val() == "") {
                alert("密码不能为空！");
                flag = false;
            }
            //密码检查
            if ($("#pwd").val() != $("#pwdRepeat").val()) {
                alert("两次密码不一致！");
                flag = false;
            }
            return flag;
        },
        beforeSubmit:function() {
            //检查用户是否已经被占用
            $.ajax({
                url : REGISTER.param.surl + "/customer/check/"+escape($("#regName").val())+"/1?r=" + Math.random(),
                success : function(data) {
                    if (data.data) {

                        REGISTER.doSubmit();

                    } else {
                        alert("用户名已被注册");
                    }
                }
            });

        },
        doSubmit:function() {
            $.post("/customer/register",$("#regForm_mod").serialize(), function(data){
                if(data.status == 200){
                    alert('用户注册成功，请登录！');
                    REGISTER.login();
                } else {
                    alert("注册失败！");
                }
            });
        },
        login:function() {
            location.href = "/page/login";
            return false;
        },
        reg:function() {
            if (this.inputcheck()) {
                this.beforeSubmit();
            }
        }
    };
</script>

<!-- Javascript背景轮播 -->
<script type="text/javascript">
    var curIndex = 0;
    //时间间隔(单位毫秒)，每秒钟显示一张，数组共有3张图片放在img文件夹下
    var timeInterval = 2000;
    //定义一个存放照片位置的数组，可以放任意个，在这里放3个
    var arr = new Array();
    arr[0] = "/assets/img/loginimg/1.jpg";
    arr[1] = "/assets/img/loginimg/2.jpg";
    arr[2] = "/assets/img/loginimg/3.jpg";
    setInterval(changeImg, timeInterval);
    function changeImg() {
        if (curIndex == arr.length - 1) {
            curIndex = 0;
        } else {
            curIndex += 1;
        }
        //设置body的背景图片

        document.body.style.backgroundImage = "URL("+arr[curIndex]+")";  //显示对应的图片
    }
</script>
</body>

</html>

