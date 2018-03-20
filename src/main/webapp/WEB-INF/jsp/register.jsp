<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <title>register</title>
    <!-- CSS -->
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="/assets/css/login2.css">
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <![endif]-->

    <style type="text/css">

        #mz_Float{position: absolute;z-index: 1000;top: -376px;left:750px;width: 200px;display: block;}
        #tip{
            text-align:left
        }
        .bRadius2 {border-radius: 2px;outline: left um none;}

        .checkedN{border-color: green}
        .errorC{ border-color: red}

        .mail{box-shadow: 0 0 15px #141414;width: 210px;border: solid 1px silver;z-index: 10;position:absolute;top:70px;left:470px;display: none;}
        .mail .item{width:210px;position:relative;right:40px;margin-left:0px;background-color: #fff;color: #515151;cursor: pointer;height: 22px;line-height: 22px;letter-spacing: 1px;font-size: 13px;padding-left: 5px;}/*letter-spacing字符间距*/
        .mail .item:hover{background-color: #ccc; color: #fff;}
        .img{
            width: 153px;
            height: 200px;
            border-radius: 10px;
        }
        .imgSelected{
            border:2px solid #0F0;
        }



    </style>
</head>

<body>
<div class="page-container">
    <h1 style="color: white">请填写注册信息</h1>
    <form id="regForm_mod">
        <%--用户名--%>
        <div id="d1">

            <span  style="color: white" class="glyphicon glyphicon-user"></span>
            <input type="text" name="username"  id="regName" value="111111" placeholder="用 户 名" required="required" />
            <span style="color: red"  class="usernameerror"></span>
        </div>


        <%--邮箱--%>
        <div  id="d2">
            <span style="color: white" class="glyphicon glyphicon-envelope"></span>
            <input type="email" name="email"  id="email" value="11@qq.com" placeholder="电子邮箱" required="required">
            <span  style="color: red" class="emailerror"></span>
        </div>

        <%--密码--%>
        <div id="d3">
            <span style="color: white" class="glyphicon glyphicon-asterisk"></span>
            <input type="password" name="password" id="pwd" value="11111111" placeholder="密　码" required="required">
            <span   style="color: red" class="pwderror"></span>
        </div>

            <%--确认密码--%>
        <div id="d4">
            <span style="color: white" class="glyphicon glyphicon-asterisk"></span>
            <input type="password" id="pwdRepeat" value="11111111" placeholder="确 认 密 码" required="required">
            <span   style="color: red" class="pwdRerror"></span>
        </div>

            <!-- 按钮触发模态框 -->
        <%--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" style="width: 150px;font-size: 8px ">请选择您喜欢的电影</button>--%>
          <%--  </br>
            </br>
            </br>--%>
        <button  class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal #identifier" type="button" style="background-color: #00b4ef" onclick="REGISTER.reg()">注册</button>
            <%--邮箱提示信息--%>

         <ul class="bRadius2 mail">
                <li data-mail="@qq.com" class="item item1" type="none">@qq.com</li>
                <li data-mail="@sina.com" class="item item2" type="none">@sina.com</li>
                <li data-mail="@126.com" class="item item3" type="none">@126.com</li>
                <li data-mail="@163.com" class="item item4" type="none">@163.com</li>
                <li data-mail="@gmail.com" class="item item5" type="none">@gmail.com</li>
         </ul>
    </form>
    <%--//错误提示信息--%>
    <div id="mz_Float">
        <div id="tip"style="color: red" class="bRadius2"></div>
    </div>





    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 810px">
            <div class="modal-content"  style="height:620px;width: 810px">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="width: 30px">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">请选择您喜欢的电影</h4>
                </div>
                <div class="modal-body">
                    <table id="tab" border="2px">
                        <tr>
                            <td>
                                <h6>${sessionScope.movie[0].moviename}</h6>
                                <img  alt="0" name="movieid"  class="img" movieId="${sessionScope.movie[0].movieid}" src="${sessionScope.movie[0].picture}">

                            </td>
                            <td>
                                <h6>${sessionScope.movie[1].moviename}</h6>
                                <img alt="1"  name="movieid" class="img" movieId="${sessionScope.movie[1].movieid}" src="${sessionScope.movie[1].picture}">
                            </td>
                            <td>
                                <h6>${sessionScope.movie[2].moviename}</h6>
                                <img alt="2" name="movieid"  class="img" movieid="${sessionScope.movie[2].movieid}" src="${sessionScope.movie[2].picture}">
                            <td>
                                <h6>${sessionScope.movie[3].moviename}</h6>
                                <img  alt="3" name="movieid" class="img" movieId="${sessionScope.movie[3].movieid}" src="${sessionScope.movie[3].picture}">

                            </td>
                            <td>
                                <h6>${sessionScope.movie[4].moviename}</h6>
                                <img  alt="4" name="movieid" class="img" movieId="${sessionScope.movie[4].movieid}" src="${sessionScope.movie[4].picture}">

                            </td>

                        </tr>
                        <tr>
                            <td>
                                <h6>${sessionScope.movie[5].moviename}</h6>
                                <img  alt="5" name="movieid" class="img" movieId="${sessionScope.movie[5].movieid}" src="${sessionScope.movie[5].picture}">

                            </td>
                            <td>
                                <h6>${sessionScope.movie[6].moviename}</h6>
                                <img alt="6" name="movieid" class="img" movieId="${sessionScope.movie[6].movieid}" src="${sessionScope.movie[6].picture}">
                            </td>
                            <td>
                                <h6>${sessionScope.movie[7].moviename}</h6>
                                <img  alt="7" name="movieid" class="img" movieId="${sessionScope.movie[7].movieid}" src="${sessionScope.movie[7].picture}">
                            <td>
                                <h6>${sessionScope.movie[8].moviename}</h6>
                                <img  alt="8" class="img"  name="movieid" movieId="${sessionScope.movie[8].movieid}" src="${sessionScope.movie[8].picture}">

                            </td>
                            <td>
                                <h6>${sessionScope.movie[9].moviename}</h6>
                                <img  alt="9" class="img"  name="movieid" movieId="${sessionScope.movie[9].movieid}" src="${sessionScope.movie[9].picture}">

                            </td>
                        </tr>
                    </table>


                </div>
                <div class="modal-footer" style="position: relative;top:40px;text-align: center;">

                    <button type="button" class="btn btn-default" data-dismiss="modal" style="width: 55px;height: 30px;">关闭</button>
                    <button type="button" class="btn btn-primary" style="width: 55px;height: 30px" onclick="movieSubmit()">提交</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

</div>
<%--选择喜欢的电影--%>
<script type="text/javascript">

        $(".img").click(function () {

            $(this).toggleClass("imgSelected");
           // alert($(this).css('border-color'));
    })

   function movieSubmit() {

//      var imgs=$("img.imgSelected[name='movieid']");
       var imgs=$(".imgSelected");

       console.log(imgs);
       var ids = [];
       for(var i =0;i< imgs.size();i++){
       //    alert(i);
//           alert(imgs[i].getAttribute('movieId'));
           ids.push($(imgs[i]).attr("movieId"));
//           ids.append($(imgs[i]).attr("movieId"));
//           alert($(imgs[i]).attr("movieId").toString());

       }

       var id=ids.toString();
//       alert($("#regName").val())

       $.post("/customer/register/movieSubmit",{'ids':id},function (data) {
           alert("提交成功");
           $('#myModal').modal('hide');
           location.href = "/page/login";
           })

    }

</script>

<!-- 注册事件-->

<script type="text/javascript">

    //用户名获得焦点
    $("#regName").focus(function () {
        $("#regName").removeClass("errorC");
        $("#regName").removeClass("checkedN");
        $(".usernameerror").show();
        $(".usernameerror").html("");


    });
    //邮箱获得焦点
    $("#email").focus(function () {
        $("#email").removeClass("errorC");
        $("#email").removeClass("checkedN");
        $(".emailerror").show();
        $(".emailerror").text("");
    });
    //密码获得焦点
    $("#pwd").focus(function () {
        $("#pwd").removeClass("errorC");
        $("#pwd").removeClass("checkedN");
        $(".pwderror").show();
        $(".pwderror").text("");
    });
    //确认密码获得焦点
    $("#pwdRepeat").focus(function () {
        $("#pwdRepeat").removeClass("errorC");
        $("#pwdRepeat").removeClass("checkedN");
        $(".pwdRerror").hide();
    });

    //用户名失去焦点
    $("#regName").blur(function () {
        if ($("#regName").val() == "") {
            $("#regName").addClass("errorC");
            $(".usernameerror").html("<span style = 'position: relative ;left: -45px;'>◀不能为空</span>");
            $(".usernameerror").show();


        }
        else if($("#regName").val().length>10 || $("#regName").val().length<4){
            $(".usernameerror").show();
            $(".usernameerror").html("<span style = 'position: relative ;left: 5px;'>◀请输入4-10位长度用户名</span>").show();
            $("#regName").addClass("errorC");
        }
        else{
            $("#regName").addClass("checkedN");
            $(".usernameerror").show();
            $(".usernameerror").text("");
        }
        //判断用户名是否被占用
        var surl = "";
        $.ajax({url:surl + "/customer/check/"+escape($("#regName").val())+"/1?r=" + Math.random(),
            success : function(data) {
                if (data.data) {
                } else {
                    $(".usernameerror").show();
                    $(".usernameerror").html("<span style = 'position: relative ;left: 10px;'>◀用户已被注册，请重新输入</span>");
                    $("#regName").addClass("errorC");
                }
            }
        });
    });


    //密码失去焦点
    $("#pwd").blur(function () {
        var reg1=/^.*[\d]+.*$/;
        var reg2=/^.*[A-Za-z]+.*$/;
        var reg3=/^.*[_@#%&^+-/*\/\\]+.*$/;//验证密码

        if ($("#pwd").val() == "") {
            $("#pwd").addClass("errorC");
            $(".pwderror").show();
            $(".pwderror").html("◀密码不能为空");
        }
        else if ($("#pwd").val().length>16 || $("#pwd").val().length<8){
            $("#pwd").addClass("errorC");
            $(".pwderror").show();
            $(".pwderror").html("<span style = 'position: relative ;left: 28px;'>◀密码长度为8-16个字符</span>");
        }
        else if (!(reg1.test($("#pwd").val()) ||  reg2.test($("#pwd").val())|| reg3.test($("#pwd").val()) )){
            $("#pwd").addClass("errorC");
        }
        else{
            //输入正确
            $("#pwd").addClass("checkedN");
            $(".pwderror").show();
            $(".pwderror").text("");
        }

    })
    //确认密码失去焦点
    $("#pwdRepeat").blur(function () {
        if ($("#pwd").val() != $("#pwdRepeat").val() || $("#pwdRepeat").val() =="") {
            $("#pwdRepeat").addClass("errorC");
            $(".pwdRerror").show();
            $(".pwdRerror").html("◀密码不一致");
        }
        else{
            $("#pwdRepeat").addClass("checkedN");
            $(".pwdRerror").show();
            $(".pwdRerror").text("");
        }

    })

    //邮箱栏键盘操作
    $("#email").keyup(function () {//键盘监听keyup,keydown,keypress
//        alert("键盘操作");
        var emailVal = $("#email").val();
        var emailValN = emailVal.replace(/\s/g,'');//去空
        emailValN = emailValN.replace(/[\u4e00-\u9fa5]/g,'');//屏蔽中文
        if(emailValN!=emailVal){
            $("#email").val(emailValN);//
        }

        var mailVal = emailValN.split("@");
        var mailHtml = mailVal[0];
        if(mailHtml.length>15)
        {
            mailHtml=mailHtml.slice(0,15)+"...";//字数超加省略
        }
        for(var i=1;i<6;i++)
        {
            var M = $(".item"+i).attr("data-mail");
            $(".item"+i).html(mailHtml+M);
        }
    });

    //邮箱提示
    $(".item").click(function () {
        var a = $("#email").val();
        var b = $(this).attr("data-mail");
        $("#email").val(a+b);
        $("#email").trigger("focus");


    });

    $("#email").click(function () {


        $(".mail").show();
        return false;
    });

    $(document).click(function(){
        $(".mail").hide();

    });
    //邮箱失去焦点
    $("#email").blur(function () {
//        $(".mail").hide();
        reg=/^\w+[@]\w+((.com)|(.net)|(.cn)|(.org)|(.gmail))$$/;
        if ($("#email").val() == "") {
            $("#email").addClass("errorC");
            $(".emailerror").show();
            $(".emailerror").html("◀邮箱不能为空");

        }
        else if(!reg.test($("#email").val())){
            $("#email").addClass("errorC");
            $(".emailerror").show();
            $(".emailerror").html("◀邮箱格式错误");
        }

        else {
            $(".emailerror").show();
            $(".emailerror").text("");
            $("#email").addClass("checkedN");
        }

        //判断邮箱是否被占用
        var surl = "";
        $.ajax({url:surl + "/customer/check/"+escape($("#email").val())+"/3?r=" + Math.random(),
            success : function(data) {
                if (data.data) {
                } else {
                    $(".emailerror").show();
                    $(".emailerror").html("<span style = 'position: relative ;left: 40px;'>◀邮箱已被注册，请重新输入</span>");
                    $("#regName").addClass("errorC");
                }
            }
        });
    });

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
                $('#identifier').modal('hide');
            }
            if ($("#pwd").val() == "") {
                alert("密码不能为空！");
                flag = false;
                $('#identifier').modal('hide');
            }
            //密码检查
            if ($("#pwd").val() != $("#pwdRepeat").val()) {
                alert("两次密码不一致！");
                flag = false;
                $('#identifier').modal('hide');
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
                        $('#identifier').modal('hide');
                    }
                }
            });

        },
        doSubmit:function() {
            $.post("/customer/register",$("#regForm_mod").serialize(), function(data){
                if(data.status == 200){
                    alert('用户注册成功，请选择您喜欢的电影！');
//                    REGISTER.login();
                    $('#myModal').modal('show');

                } else {
                    alert("注册失败！");
                    $('#identifier').modal('hide');
                }
            });
        },
        login:function() {
            alert('deng！');
            location.href = "/page/login";
            return false;
        },
        reg:function() {
//            this.doSubmit();
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

