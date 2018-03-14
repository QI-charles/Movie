<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans" class="ua-mac ua-webkit">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>
        梦的6次方
    </title>
    <!-- JS-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- 星星评分-->
    <link href="/assets/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
    <script src="/assets/js/star-rating.min.js" type="text/javascript"></script>
    <!-- 整体DIV CSS-->
    <link href="https://img3.doubanio.com/f/shire/420c6a4b676c73bc6af48dfcdd18b662f5c223d7/css/douban.css" rel="stylesheet" type="text/css">
    <!-- 鼠标悬浮在<A>时背景和导航栏同步-->
    <style type="text/css">
        a.dream:hover
        {
            background-color: #303f53;
        }
        #liked:focus
        {
            background-color: pink;
            color: white;
            outline:0 none !important;
        }
        #liked:hover
        {
            color: white;
            background-color: pink;
            outline:0 none !important;
        }
        #play:hover
        {
            background-color: white;
            outline:0 none !important;
            color: #00b4ef;
        }
        #submitevalutionstar:hover
        {
            outline:0 none !important;
            background-color: white;
            color: #00b4ef;
        }
    </style>
    <script type="text/javascript">
        window.onload=function(){
            $("#allstar").rating({
                    showClear:false,
                    size:'xs',
                showCaption:false,
                readonly:true,
                }
            );
            $("#Evaluation").rating({

                showCaption:false,
                min:0,
                max:5,
                step:0.5,
                size:'sm',
            })
        }

    </script>
</head>

<body>
<!-- 导航栏-->
<nav class="navbar navbar-default" role="navigation" style="background-color: #303f53;margin-bottom: 0%">
    <a class="navbar-brand" href="/" style="color: white">电影推荐网站</a>
    <div class="col-xs-4">
        <input id="inp-query" class="form-control" style="margin-bottom: 8px;margin-top: 8px;border-radius: 5px;border-color: #303f53" name="search_text"  maxlength="60" placeholder="搜索电影" value="">
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
<br>
<br>

<%--<div id="wrapper">--%>
    <%--<div id="content" >
        <h1>${sessionScope.moviedescription.moviename}</h1>

            <div >
                <div id="mainpic" class="">
                    <a class="nbgnbg"  title="点击看更多海报">
                        <img src="${sessionScope.moviedescription.picture}"  title="点击看更多海报" alt="Accident Man" rel="v:image">
                    </a>
                </div>
                <div >
                    <span style="font-size: 10pt">导演: ${sessionScope.moviedescription.director}</span><br>
                    <span style="font-size: 10pt">编剧: ${sessionScope.moviedescription.screenwriter}</span><br>
                    <span style="font-size: 10pt">主演: ${sessionScope.moviedescription.leadactors}</span><br>
                    <span style="font-size: 10pt">制片国家/地区: ${sessionScope.moviedescription.nation}</span><br>
                    <span style="font-size: 10pt">故事简介: ${sessionScope.moviedescription.description}</span><br>
                    <span style="font-size: 10pt">上映日期: ${sessionScope.moviedescription.showyear}</span><br>
                </div>
            <c:if test="${sessionScope.user != null}">
                <div id="evalutiondiv">
                    <br>
                    <br>
                    <input id="Evaluation" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm" >
                    <button
                            id="submitevalutionstar" type="submit" class="btn btn-vmaig-auth" style="background-color: lightgray;color: indianred" onclick='$.post("/getstar",{userid:${sessionScope.user.userid},movieid:${sessionScope.moviedescription.movieid},star:$("#Evaluation").val()},function (data) {
                            alert(data);$("#Evaluation").attr("disabled","disabled");$("#submitevalutionstar").attr("disabled","disabled");})'>提交评价</button>
                </div>
            </c:if>
            </div>
    </div>--%>
        <div class="component-poster-detail">
            <div class="container">
                <div class="row">
                    <div class="col-md-9 col-sm-8">
                        <h1>${sessionScope.moviedescription.moviename}</h1>
                        <h2>Directed by ${sessionScope.moviedescription.director}</h2>
                    </div>
                </div> <!-- /row -->

                <div class="row">
                    <div class="col-sm-4">
                        <div class="row">
                            <div class="col-md-7 col-sm-12">
                                <div class="movie-poster">
                                    <a><img src="${sessionScope.moviedescription.picture}" alt="" style="width: 100%"></a>
                                    <c:if test="${sessionScope.user != null}">
                                        <div id="evalutiondiv">
                                            <input id="Evaluation" >

                                        </div>
                                    </c:if>
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-12 film-stats" style="">
                                <div><b style="font-size: 11pt">编剧:</b> <span style="font-size: 9pt">${sessionScope.moviedescription.screenwriter}</span></div>
                                <div><b style="font-size: 11pt">制片国家/地区:</b><span style="font-size: 9pt"> ${sessionScope.moviedescription.nation}</span></div>
                                <div><b style="font-size: 11pt">类别:</b><span style="font-size: 9pt"> Drama</span></div>
                                <div><b style="font-size: 11pt">上映日期:</b><span style="font-size: 9pt">
                                    <fmt:formatDate value="${sessionScope.moviedescription.showyear}" pattern="yyyy-MM-dd"/>
                                </span></div>
                                <div><b style="font-size: 11pt">多少人看过:</b> <span style="font-size: 9pt">${sessionScope.moviedescription.numrating}</span></div>
                                <div><b style="font-size: 11pt">总评分:</b> <span style="font-size: 9pt">${sessionScope.moviedescription.averating}分</span></div>
                                <div> <input id="allstar" value="${sessionScope.moviedescription.averating}" ></div>
                                <br>

                                <button class="btn btn-default btn-md"  id="liked" title=""><span class="glyphicon glyphicon-heart"></span><span class="fm-opt-label"> 喜欢</span></button><br><br>

                                <a  class="btn btn-default btn-md"  id="play" title=""><span class="glyphicon glyphicon-play-circle"></span><span class="fm-opt-label"> 播放</span></a><br>
                                <br>
                                <c:if test="${sessionScope.user != null}">
                                <button id="submitevalutionstar"  class="btn btn-default btn-md"  onclick='$.post("/getstar",{userid:${sessionScope.user.userid},movieid:${sessionScope.moviedescription.movieid},star:$("#Evaluation").val()},function (data) {
                                        alert(data);$("#Evaluation").attr("disabled","disabled");$("#submitevalutionstar").attr("disabled","disabled");})'><span class="glyphicon glyphicon-ok-circle"></span><span class="fm-opt-label"> 提交</span></button>

                                </c:if>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7">

                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active" style="text-align: center"><a href="#film-info" aria-controls="film info"  data-toggle="tab"  aria-expanded="true">简介</a></li>
                            <li role="presentation" class="" style="text-align: center"><a href="#reviews" aria-controls="reviews"  data-toggle="tab"  aria-expanded="false">相似电影</a></li>
                        </ul>
                        <!-- 设置每一个<a>宽度占总div的百分比 -->
                        <style>
                            .component-poster-detail .nav-tabs > li {
                                width: 50.00% !important;
                            }
                        </style>

                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade active in" id="film-info">
                                <h2>${sessionScope.moviedescription.moviename}</h2>
                                Directed by  ${sessionScope.moviedescription.director}<br><br>
                                <div><strong>演员表</strong></div>
                                <strong></strong>
                                ${sessionScope.moviedescription.leadactors}<br>
                                <%--<strong></strong>
                                Zar Amir Ebrahimi                <br>
                                <strong></strong>
                                <a href="/browse/by-cast/id/5277" sl-processed="1">Arash Marandi</a>
                                <br>
                                <strong></strong>
                                Bilal Yasar                <br>
                                <strong></strong>
                                Negar Mona Alizadeh                <br>
                                <strong></strong>
                                Payam Madjilessi                <br>--%>
                                <br>
                                <div><strong>故事简介</strong></div>
						<p><span style="font-weight: 400;"> ${sessionScope.moviedescription.description}</span></p></div>
                            <div role="tabpanel" class="tab-pane fade" id="reviews">

                            </div>
                </div>
                    </div>
                </div>
                <!-- /row -->
            </div> <!-- /container -->
        </div>
<%--</div>--%>


    </body>
</html>
