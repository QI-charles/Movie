<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans" class="ua-mac ua-webkit">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>
        梦的6次方
    </title>
    <meta name="baidu-site-verification" content="cZdR4xxR7RxmM4zE" />
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="mobile-agent" content="format=xhtml; url=http://m.douban.com/movie/">
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <link href="/assets/css/style-login.css" rel="stylesheet" type="text/css"/>
    <link href="https://img3.doubanio.com/f/shire/420c6a4b676c73bc6af48dfcdd18b662f5c223d7/css/douban.css" rel="stylesheet" type="text/css">
    <link href="https://img3.doubanio.com/f/movie/8864d3756094f5272d3c93e30ee2e324665855b0/css/movie/base/init.css" rel="stylesheet">
    <link rel="stylesheet" href="https://img3.doubanio.com/misc/mixed_static/523d8e8145eb5bf.css">
    <!-- 鼠标悬浮在<A>时背景和导航栏同步-->
    <style type="text/css">
        a.dream:hover
        {
            background-color: #303f53;
        }
    </style>

</head>

<body>

<nav class="navbar navbar-default" role="navigation" style="background-color: #303f53;margin-bottom: 0%">
    <a class="navbar-brand" href="/jsp/Home.jsp" style="color: white">电影推荐网站</a>
    <div class="col-xs-4">
        <input id="inp-query" class="form-control" style="margin-bottom: 8px;margin-top: 8px;border-radius: 5px;border-color: #303f53" name="search_text"  maxlength="60" placeholder="搜索电影、电视剧、综艺、影人" value="">
    </div>
    <c:if test="${sessionScope.user == null}">
        <a  class="dream" href="javascript:window.location.href='/page/register'" id="register" style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-user"></span> 注册</a>
        <a  class="dream" href="javascript:window.location.href='/page/login'" style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-log-in"></span> 登录</a>
    </c:if>
    <c:if test="${sessionScope.user != null}">

        <a class="dream" id="logout" href="javascript:window.location.href='/page/logout'" style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-log-in"></span>  退出</a>
        <a class="dream" href="javascript:" style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-user"></span> ${sessionScope.user.username}</a>
    </c:if>

</nav>
<script>
    $('#register').click(function () {
        $('#myModal').modal('show');
    })
</script>
<br>
<br>

<div id="wrapper">
    <div id="content" >
        <h1>${sessionScope.moviedescription.moviename}</h1>

            <div >
                <div id="mainpic" class="">
                    <a class="nbgnbg"  title="点击看更多海报">
                        <img src="https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2506137067.webp"  title="点击看更多海报" alt="Accident Man" rel="v:image">
                    </a>
                </div>
                <div >
                    <span style="font-size: 15pt">导演: ${sessionScope.moviedescription.director}</span><br>
                    <span style="font-size: 15pt">编剧: ${sessionScope.moviedescription.screenwriter}</span><br>
                    <span style="font-size: 15pt">主演: ${sessionScope.moviedescription.leadactors}</span><br>
                    <span style="font-size: 15pt">制片国家/地区: ${sessionScope.moviedescription.nation}</span><br>
                    <span style="font-size: 15pt">上映日期: ${sessionScope.moviedescription.showyear}</span><br>
                </div>

            </div>




    </div>
</div>



</body>
</html>
