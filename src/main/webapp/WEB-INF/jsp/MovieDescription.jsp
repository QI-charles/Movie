<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans" class="ua-mac ua-webkit">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>梦的6次方</title>
    <!-- JS-->
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <script src="/assets/js/star-rating.min.js" type="text/javascript"></script>
    <!-- 星星评分CSS-->
    <link href="/assets/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <!-- 整体DIV CSS-->
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <link href="/assets/css/wholeframe.css" rel="stylesheet" type="text/css">
    <!-- 鼠标悬浮在<A>时背景和导航栏同步-->
    <style type="text/css">
        a.dream:hover {
            background-color: black;
        }

        #liked:focus {
            background-color: pink;
            color: white;
            outline: 0 none !important;
        }

        #liked:hover {
            color: white;
            background-color: pink;
            outline: 0 none !important;
        }

        #play:hover {
            background-color: white;
            outline: 0 none !important;
            color: #00b4ef;
        }

        #submitevalutionstar:hover {
            outline: 0 none !important;
            background-color: white;
            color: #00b4ef;
        }
    </style>
    <script type="text/javascript">
        window.onload = function () {
            $("#allstar").rating({
                        showClear: false,
                        size: 'xs',
                        showCaption: false,
                        readonly: true,
                    }
            );
            $("#Evaluation").rating({
                min: 0,
                max: 5,
                step: 0.5,
                size: 'sm',
            })
        }

    </script>
</head>

<body>
<!-- 导航栏BT模板-->
<nav class="navbar navbar-default" role="navigation" style="background-color: black;margin-bottom: 0%">
    <a class="navbar-brand" href="/" style="color: white">电影推荐网站</a>

    <div class="col-xs-4">
        <input id="inp-query" class="form-control"
               style="margin-bottom: 8px;margin-top: 8px;border-radius: 5px;border-color: white" name="search_text"
               maxlength="60" placeholder="搜索电影" value="">
    </div>
    <a class="navbar-brand" href="/index" style="color: white">选电影</a>
    <c:if test="${sessionScope.user == null}">
        <a class="dream" href="javascript:window.location.href='/page/register'" id="register"
           style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span
                style="color: white" class="glyphicon glyphicon-user"></span> 注册</a>
        <a class="dream" href="javascript:window.location.href='/page/login'"
           style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span
                style="color: white" class="glyphicon glyphicon-log-in"></span> 登录</a>
    </c:if>
    <c:if test="${sessionScope.user != null}">

        <a class="dream" id="logout" href="javascript:window.location.href='/page/logout'"
           style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span
                style="color: white" class="glyphicon glyphicon-log-in"></span> 退出</a>
        <a class="dream" href="javascript:"
           style="float: right;color: white;font-size: 13pt;margin-top: 10px;margin-right: 10px"><span
                style="color: white" class="glyphicon glyphicon-user"></span> ${sessionScope.user.username}</a>
    </c:if>

</nav>
<br>
<br>
<!--电影信息栏 自定义-->
<div class="component-poster-detail">
    <!--bt-->
    <div class="container">
        <div class="row">
            <!--电影名称导演 -->
            <div class="col-md-9 col-sm-8">
                <h1>${sessionScope.moviedescription.moviename}</h1>
                <h2>Directed by ${sessionScope.moviedescription.director}</h2>
            </div>
        </div> <!-- /row -->
        <div class="row">
            <!--电影海报和其他信息/喜欢播放提交按钮 -->
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-md-7 col-sm-12">
                        <div class="movie-poster">
                            <a><img src="${sessionScope.moviedescription.picture}" alt="" style="width: 100%"></a>
                            <c:if test="${sessionScope.user != null&&sessionScope.userstar==null}">
                                <div id="evalutiondiv">
                                    <input id="Evaluation">
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-12 film-stats" style="">
                        <div><b style="font-size: 11pt">编剧:</b> <span
                                style="font-size: 9pt">${sessionScope.moviedescription.screenwriter}</span></div>
                        <div><b style="font-size: 11pt">制片国家/地区:</b><span
                                style="font-size: 9pt"> ${sessionScope.moviedescription.nation}</span></div>
                        <div><b style="font-size: 11pt">类别:</b><span
                                style="font-size: 9pt"> ${sessionScope.moviedescription.typelist}</span></div>
                        <div><b style="font-size: 11pt">上映日期:</b><span style="font-size: 9pt">
                                        <fmt:formatDate value="${sessionScope.moviedescription.showyear}"
                                                        pattern="yyyy-MM-dd"/>
                                    </span></div>
                        <div><b style="font-size: 11pt">多少人看过:</b> <span
                                style="font-size: 9pt">${sessionScope.moviedescription.numrating}</span></div>
                        <div><b style="font-size: 11pt">总评分:</b> <span
                                style="font-size: 9pt">${sessionScope.moviedescription.averating}分</span></div>
                        <div><input id="allstar" value="${sessionScope.moviedescription.averating}"></div>
                        <c:if test="${sessionScope.user != null&&sessionScope.userstar!=null}">
                            <div><b style="font-size: 11pt">你的评分:</b> <span
                                    style="font-size: 9pt">${sessionScope.userstar.star}分</span></div>
                            <div><b style="font-size: 11pt">日期:</b><span style="font-size: 9pt">
                                        <fmt:formatDate value="${sessionScope.userstar.reviewtime}"
                                                        pattern="yyyy-MM-dd"/>
                                    </span></div>
                        </c:if>
                        <br>
                        <button class="btn btn-default btn-md" id="liked" title=""><span
                                class="glyphicon glyphicon-heart"></span><span class="fm-opt-label"> 喜欢</span></button>
                        <br><br>
                        <a class="btn btn-default btn-md"
                           href="http://so.iqiyi.com/so/q_${sessionScope.moviedescription.moviename}" id="play"
                           target="_Blank"><span class="glyphicon glyphicon-play-circle"></span><span
                                class="fm-opt-label"> 播放</span></a><br>
                        <br>
                        <c:if test="${sessionScope.user != null&&sessionScope.userstar==null}">
                            <button id="submitevalutionstar" class="btn btn-default btn-md"
                                    onclick='$.post("/getstar",{userid:${sessionScope.user.userid},movieid:${sessionScope.moviedescription.movieid},time:getNowFormatDate(),star:$("#Evaluation").val()},function (data) {
                                            alert(data);window.location.href=window.location.href})'><span
                                    class="glyphicon glyphicon-ok-circle"></span><span class="fm-opt-label"> 提交</span>
                            </button>

                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
                <!-- 分享链接栏 -->
                <div id="atstbx2" style="float: right;margin-top: -7%"
                     class="at-share-tbx-element addthis-smartlayers addthis-animated at4-show">
                    <div class="at-share-btn-elements" style="float: right;margin-top: -10%">
                        <a href="" class="at-icon-wrapper at-share-btn at-svc-email" style=" border-radius: 0%;">
                            <img style="line-height: 32px; height: 32px; width: 32px;"
                                 src="https://www.vmovier.com/Public/Home/images/baidu-weibo-v2.png?20160109"/>
                        </a>
                        <a class="at-icon-wrapper at-share-btn at-svc-bitly" style=" border-radius: 0%;">
                            <img style="line-height: 32px; height: 32px; width: 32px;"
                                 src="https://www.vmovier.com/Public/Home/images/baidu-wechat-v2.png?20160109"/>
                        </a>
                        <a class="at-icon-wrapper at-share-btn at-svc-bitly" style=" border-radius: 0%;">
                            <img style="line-height: 32px; height: 32px; width: 32px;"
                                 src="https://www.vmovier.com/Public/Home/images/baidu-qzone-v2.png?20160109"/>
                        </a>
                        <a class="at-icon-wrapper at-share-btn at-svc-bitly" style=" border-radius: 0%;">
                            <img style="line-height: 32px; height: 32px; width: 32px;"
                                 src="https://www.vmovier.com/Public/Home/images/baibu-tengxun-v2.png?20160109"/>
                        </a>
                        <a class="at-icon-wrapper at-share-btn at-svc-bitly" style=" border-radius: 0%;">
                            <img style="line-height: 32px; height: 32px; width: 32px;"
                                 src="https://www.vmovier.com/Public/Home/images/baibu-qq-v2.png?20160109"/>
                        </a>
                    </div>
                </div>
                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                <script type="text/javascript"
                        src="//s7.addthis.com/js/300/addthis_widget.js#pubid=kinointernational"></script>
                <!-- Nav tabs 信息切换栏-->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active" style="text-align: center"><a href="#film-info"
                                                                                         aria-controls="film info"
                                                                                         data-toggle="tab"
                                                                                         aria-expanded="true">简介</a>
                    </li>
                    <li role="presentation" class="" style="text-align: center"><a id="reviewsId"
                                                                                   href="#reviews"
                                                                                   aria-controls="reviews"
                                                                                   data-toggle="tab"
                                                                                   aria-expanded="false">相似电影</a></li>
                    <li role="presentation" class="" style="text-align: center"><a href="#resource"
                                                                                   aria-controls="resource"
                                                                                   data-toggle="tab"
                                                                                   aria-expanded="false">电影资源</a></li>
                </ul>
                <!-- 设置每一个<a>宽度占总div的百分比和电影资源DIV -->
                <style>
                    .component-poster-detail .nav-tabs > li {
                        width: 33.33% !important;
                    }

                    .qBox legend {
                        margin: 0 4px;
                        padding: 4px;
                        font-weight: bold;
                        white-space: nowrap;
                        border: none;
                        background: none;
                        border-radius: 25px;
                        line-height: 1;
                        vertical-align: text-top;
                        font-size: 12px;
                    }

                    .qBox legend .keyword {
                        display: inline-block;
                        max-width: 30em;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        vertical-align: top;
                    }

                    .qBox a {
                        color: #333;
                        display: block;
                        float: left;
                        min-width: 100px;
                        line-height: 30px;
                        text-align: center;
                        padding: 4px 8px;
                        margin: 4px;
                        font-size: 12px;
                        border: 1px solid;
                        /* background: rgba(0,0,0,0.04); */
                        opacity: 1;
                        transition-duration: 0.3s;
                    }

                    .qBox a:hover {
                        font-size: 16px;
                        color: #4b8ccb;
                        background-color: whitesmoke;
                    }
                </style>

                <!-- Tab panes -->
                <div class="tab-content">
                    <!--电影信息 -->
                    <div role="tabpanel" class="tab-pane fade active in" id="film-info">
                        <br>
                        <h2>${sessionScope.moviedescription.moviename}</h2>
                        Directed by ${sessionScope.moviedescription.director}<br><br>
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
                        <p><span style="font-weight: 400;"> ${sessionScope.moviedescription.description}</span></p>
                    </div>
                    <!--推荐电影table -->
                    <div role="tabpanel" class="tab-pane fade" id="reviews">
                        <%-- <div id="myCarousel" class="carousel slide pad_010 b_k" data-ride="carousel" style="margin-left: 3%;margin-top: 3%">
                             <!-- 轮播（Carousel）指标 -->
                             <ol class="carousel-indicators" style="margin-bottom: -5%">
                                 <li data-target="#myCarousel" data-slide-to="0" class="active" style="background-color: #00b4ef"></li>
                                 <li data-target="#myCarousel" data-slide-to="1" ></li>
                                 <li data-target="#myCarousel" data-slide-to="2" ></li>
                             </ol>
                             <!-- 轮播（Carousel）项目 -->
                             <div class="carousel-inner bor_btm">
                                 <div class="item active" >
                                     <div class="pic" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                     </div>
                                 </div>
                                 <div class="item">
                                     <div class="pic">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                     </div>
                                 </div>
                                 <div class="item">
                                     <div class="pic">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%" >
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                         <img src="http://image.tmdb.org/t/p/w185/rhIRbceoE9lR4veEXuwCC2wARtG.jpg"  style="height: 200px;margin-right: 3%;margin-bottom: 3%">
                                     </div>
                                 </div>

                             </div>
                         </div>
                         <br>--%>
                        <br>

                        <div>
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <th style="font-size: 13pt">电影名</th>
                                    <th style="font-size: 13pt">类型</th>
                                    <th style="font-size: 13pt">导演</th>
                                    <th style="font-size: 13pt">评分</th>
                                </tr>
                                </thead>
                                <tbody id="movietable">
                                </tbody>
                            </table>
                        </div>

                    </div>
                    <!--电影资源-->
                    <div role="tabpanel" class="tab-pane fade" id="resource">
                        <br>
                        <div class="全网搜索 clear none" id="qlink" style="display: block;">
                            <fieldset class="qBox qwatch">
                                <legend>《<span class="keyword">${sessionScope.moviedescription.moviename}</span>》在线观看
                                </legend>
                                <a href="http://so.iqiyi.com/so/q_${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">奇艺搜索</a>
                                <a href="http://v.sogou.com/v?query=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">搜狗影视</a>
                                <a href="http://www.quankan.tv/index.php?s=vod-search-wd-${sessionScope.moviedescription.moviename}.html"
                                   target="_blank" rel="nofllow">全看网</a>
                                <a href="http://www.soku.com/search_video/q_${sessionScope.moviedescription.moviename}?f=1&kb=020200000000000__${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">优酷</a>
                                <a href="http://www.acfun.cn/search/?#query=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">AcFun</a>
                                <a href="http://search.bilibili.com/all?keyword=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">Bilibili</a></fieldset>
                            <fieldset class="qBox qdown">
                                <legend>《<span class="keyword">${sessionScope.moviedescription.moviename}</span>》资源下载&nbsp;
                                </legend>
                                <a href="http://www.atugu.com/infos/${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">搜磁力</a>
                                <a href="http://www.btbtt.me/search-index-keyword-${sessionScope.moviedescription.moviename}.htm"
                                   target="_blank" rel="nofllow">搜种子</a>
                                <a href="http://www.xilinjie.com/s?t=pan&amp;q=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">搜网盘</a>
                                <a href="https://www.ziyuanmao.com/#/result/${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">资源猫</a>
                                <a href="http://www.zimuku.cn/search?q=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">字幕库</a>
                                <a href="http://www.zimuzu.tv/search?keyword=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">字幕组</a></fieldset>
                            <fieldset class="qBox qdata">
                                <legend>《<span class="keyword">${sessionScope.moviedescription.moviename}</span>》资料介绍&nbsp;
                                </legend>
                                <a href="http://baike.baidu.com/search/word?word=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">百度百科</a>
                                <a href="http://www.baike.com/wiki/${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">互动百科</a>
                                <a href="https://zh.wikipedia.org/wiki/${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">维基百科</a>
                                <a href="https://en.wikipedia.org/wiki/${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">Wiki</a></fieldset>
                            <fieldset class="qBox qreview">
                                <legend>《<span class="keyword">${sessionScope.moviedescription.moviename}</span>》评分影评
                                </legend>
                                <a href="https://m.douban.com/search/?query=${sessionScope.moviedescription.moviename}&amp;type=movie"
                                   target="_blank" rel="nofllow">豆瓣电影</a>
                                <a href="http://search.mtime.com/search/?q=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">时光网</a>
                                <a href="http://www.imdb.com/find?q=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">IMDB</a>
                                <a href="https://www.rottentomatoes.com/search/?search=${sessionScope.moviedescription.moviename}"
                                   target="_blank" rel="nofllow">烂番茄</a></fieldset>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /row -->
    </div> <!-- /container -->
</div>
<br>
<script>
    $('#reviewsId').click(function (event) {
        event.preventDefault();
        $("#movietable").children().remove();
        $.post("/getSimiMovies", {"id": "${sessionScope.moviedescription.movieid}"},function (data) {
                if (data.status == 200) {
                    if(data.data.length!=0) {
                        $.each(data.data, function (i, item) {
                            var headHtml = $("#recommodmovies").html();
                            headHtml = headHtml.replace(/{id}/g, item.movieid);
                            headHtml = headHtml.replace(/{averating}/g,changeTwoDecimal_f(item.averating));
                            headHtml = headHtml.replace(/{director}/g, item.director);
                            headHtml = headHtml.replace(/{typelist}/g, item.typelist);
                            headHtml = headHtml.replace(/{moviename}/g, item.moviename);
                            $("#movietable").append(headHtml);
                        })
                    }else
                    {alert("没有更多影片了")}
                }
                else {
                    alert("加载更多图片资源错误");
                }
            })
    })
</script>
<br>
<br>
<!--底部 -->
<div class="footer">
    <a href="/" target="_blank">客户端</a>
    <a href="/" target="_blank">关于我们</a>
    <a href="/" target="_blank">加入我们</a>
    <div class="tip">Copyright © 2011-2018 &nbsp;&nbsp; <p>声明：本站不提供视频观看，将跳转到第三方网站进行观看</p></a>
        &nbsp;
    </div>
</div>

<style>
    .footer {
        background-color: black;
        color: #CCC;
        font-size: 12px;
        text-align: center;
        padding: 35px 0;
        margin-top: 10%;

    }
</style>

<script>
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                + " " + date.getHours() + seperator2 + date.getMinutes()
                + seperator2 + date.getSeconds();
        return currentdate;
    }

</script>
<br>
</body>

<script type="text/tmpl" id="recommodmovies">
    <tr>
    <td>
    <a value="{id}" onclick='javascript:$.post("/Customer/Description",{id:$(this).attr("value")}, function (data) {
            if (data=="success") {
                location.href = "/MovieDescription"
            } else {
            }
        })'>{moviename}</a></td>
    <td>{typelist}</td>
    <td>{director}</td>
    <td>
    <span class="fm-rating">{averating}</span>
        </td>
        </tr>
</script>

<!-- 强制保留一位小数点-->

<script>
    function changeTwoDecimal_f(x)
    {
        var f_x = parseFloat(x);
        if (isNaN(f_x))
        {
            return 0;
        }
        var f_x = Math.round(x*100)/100;
        var s_x = f_x.toString();
        var pos_decimal = s_x.indexOf('.');
        if (pos_decimal < 0)
        {
            pos_decimal = s_x.length;
            s_x += '.';
        }
        while (s_x.length <= pos_decimal + 1)
        {
            s_x += '0';
        }
        return s_x;
    }
</script>
</html>
