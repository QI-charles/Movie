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
    <link href="/assets/css/bootstrap.css" rel="stylesheet">
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <!-- 电影推荐模块CSS-->
    <link href="https://img3.doubanio.com/f/shire/420c6a4b676c73bc6af48dfcdd18b662f5c223d7/css/douban.css" rel="stylesheet" type="text/css">
    <!-- 左右模块位置排序和推荐CSS-->
    <link href="https://img3.doubanio.com/f/movie/8864d3756094f5272d3c93e30ee2e324665855b0/css/movie/base/init.css" rel="stylesheet">
    <!-- 电影选择模块CSS（类型/排序/展示）-->
    <link rel="stylesheet" href="https://img3.doubanio.com/f/movie/fc5a7b9631f6e089a6a047e0e701207243e3fbdf/css/movie/project/gaia/__init__.css" />
<!-- 电影推荐模块CSS-->
    <link rel="stylesheet" href="https://img3.doubanio.com/misc/mixed_static/554ab01e9256e005.css">
    <!-- 鼠标悬浮在<A>时背景和导航栏同步-->
    <style type="text/css">
       a.dream:hover
       {
            background-color: #303f53;
        }
    </style>
</head>

<body>

<!-- 导航栏-->
<nav class="navbar navbar-default" role="navigation" style="background-color: #303f53;margin-bottom: 0%">
    <a class="navbar-brand" href="#" style="color: white">电影推荐网站</a>
    <div class="col-xs-4">
    <input id="inp-query" class="form-control" style="margin-bottom: 8px;margin-top: 8px;border-radius: 5px;border-color: #303f53" name="search_text"  maxlength="60" placeholder="搜索电影" value="">
    </div>
    <!-- 判断用户是否登录-->
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


<div id="wrapper">
    <div id="content">
        <h1>选电影</h1>
        <div class="grid-16-8 clearfix">

            <!-- 左侧电影展示模块-->

            <div class="article">
                <div class="gaia">
                    <div class="detail-pop"></div>
                    <div class="fliter-wp">
                        <div class="filter">
                            <form action="get" class="gaia_frm" autocomplete="off">
                                <input type="hidden" name="type" value="movie">

                                <!-- 电影类型标签-->

                                <div class="tags">
                                    <div id="tags-list" class="tag-list">

                                        <!-- 从数据库到seesion读入，默认第一个选中activate-->

                                        <c:forEach var="item"   items="${sessionScope.category}" varStatus="i">
                                            <c:if test="${i.count==1}">
                                                <label  class="activate" style="font-size: 13pt" value="${i.count}">${item.category}
                                                    <input type="radio" name="tag" value="${i.count}">
                                                </label>
                                            </c:if>
                                            <c:if test="${i.count!=1}">
                                                <label  style="font-size: 13pt" value="${i.count}">${item.category}
                                                    <input type="radio" name="tag" value="${i.count}">
                                                </label>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>

                                <!-- 电影类型标签选择事件-->

                                <script>
                                    $("input[name='tag']").click(function () {
                                        //设置选中标签ACTIVATE之前的remove
                                        $("#tags-list label").attr("class","");
                                        var label= $(this).parent();
                                        label.attr("class","activate");
                                        //清空电影数据
                                        $("#list").children().remove();
                                        //请求数据对应的电影类型
                                        $.post("/typesortmovie",{type:$(this).attr("value"),sort:$("input[name='sort']:checked").val()}, function (data) {
                                            if (data.status == 200)
                                            {
                                                if(data.data.length!=0) {
                                                    //返回movielist,用sc模板append
                                                    $.each(data.data, function (i, item) {
                                                        var headHtml = $("#subject-tmpl").html();
                                                        headHtml = headHtml.replace(/{cover}/g, "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512283982.jpg");
                                                        headHtml = headHtml.replace(/{id}/g, item.movieid);
                                                        headHtml = headHtml.replace(/{rate}/g, "4.0");
                                                        headHtml = headHtml.replace(/{cover_x}/g, "1500");
                                                        headHtml = headHtml.replace(/{cover_y}/g, "2200");
                                                        headHtml = headHtml.replace(/{title}/g, item.moviename);
                                                        $("#list").append(headHtml);
                                                    })
                                                }
                                                else
                                                {alert("没有该类型影片数据")}
                                            }
                                            else {
                                                alert("请求电影信息错误");
                                            }
                                        })
                                    })
                                </script>

                                <!-- 电影时序等选择radio-->

                                <div class="tool" style="">
                                    <div class="sort">
                                        <label>
                                            <input  type="radio" name="sort" value="hot" checked="checked"> 按热度排序
                                        </label>
                                        <label>
                                            <input type="radio" name="sort" value="time"> 按时间排序
                                        </label>
                                        <label>
                                            <input type="radio" name="sort" value="rank"> 按评价排序
                                        </label>
                                    </div>

                                    <!-- 电影时序等选择radio事件（未完成）-->

                                    <script>
                                        $("input[name='sort']").click(function () {
                                             alert($(this).attr("value"));
                                             alert($("input[name='tag']:checked ").val())
                                            $("#list").children().remove()
                                            var headHtml = $("#subject-tmpl").html();
                                            headHtml = headHtml.replace(/{url}/g,"https://movie.douban.com/subject/26882533/?tag=热门");
                                            headHtml = headHtml.replace(/{tag}/g,"热门");
                                            headHtml = headHtml.replace(/{cover}/g,"https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512283982.jpg");
                                            headHtml = headHtml.replace(/{id}/g,"1");
                                            headHtml = headHtml.replace(/{rate}/g,"4.0");
                                            headHtml = headHtml.replace(/{cover}/g,"https://movie.douban.com/subject/26882533/?tag=热门");
                                            headHtml = headHtml.replace(/{cover_x}/g,"1500");
                                            headHtml = headHtml.replace(/{cover_y}/g,"2200");
                                            headHtml = headHtml.replace(/{title}/g,"测试");
                                            $("#list").append(headHtml);
                                        })
                                    </script>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- 电影信息卡片展示模块-->

                    <div   class="list-wp">
                        <div id="list" class="list">

                            <!-- 初始化或刷新页面用C:FOREACH加载电影（类似于SC模板）-->

                            <c:if test="${sessionScope.movie != null}">
                                <c:forEach var="item"   items="${sessionScope.movie}">
                                    <a class="item"   target="_blank" name="imgitem" id="${item.movieid}" onclick='javascript:$.post("/Customer/Description",{id:$(this).attr("id")}, function (data) {
                                    if (data.status == 200) {
                                        location.href = "/MovieDescription"
                                    } else {
                                    }
                                    })'>
                                        <div class="cover-wp">
                                            <c:if test="${item.picture==null}">
                                              <img src="https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512283982.jpg" alt="${item.moviename}" data-x="1500" data-y="2200"/>
                                            </c:if>
                                            <c:if test="${item.picture!=null}">
                                                <img src="https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512283982.jpg" alt="${item.moviename}" data-x="1500" data-y="2200"/>
                                            </c:if>
                                        </div>
                                        <p>${item.moviename}
                                            <strong>4.7</strong>
                                        </p>
                                    </a>
                                </c:forEach>
                            </c:if>
                        </div>

                        <!-- 加载更多<a>-->

                        <a class="more" id="loadmore" href="javascript:;">加载更多</a>
                    </div>
                </div>

            </div>

            <!-- 右侧推荐模块（基本未修改/后期可修改）-->

            <div class="aside">

                <!-- douban ad begin -->
                <div id="dale_movie_towhome_explore_right"></div>
                <!-- douban ad end -->
                <div id="doulist">
                    <h2>电影推荐</h2>
                    <ul>
                        <li>
                            <span>13个好评</span>
                            <div class="title"><a target="_blank" href="https://www.douban.com/doulist/161820/" style="color: #1a1a1a">红海行动</a></div>
                        </li>
                        <li>
                            <span>13个好评</span>
                            <div class="title"><a target="_blank" href="https://www.douban.com/doulist/1502467/" style="color: #1a1a1a">大话西游</a></div>
                        </li>
                        <li>
                            <span>13个好评</span>
                            <div class="title"><a target="_blank" href="https://www.douban.com/doulist/166423/" style="color: #1a1a1a">旺角卡门</a></div>
                        </li>
                        <li>
                            <span>13个好评</span>
                            <div class="title"><a target="_blank" href="https://www.douban.com/doulist/83485/" style="color: #1a1a1a">月光宝盒</a></div>
                        </li>
                    </ul>
                </div>
            </div>
</div>
</div>
</div>

<!-- 点击加载更多事件，通过SC模板加载电影信息-->

<script>
    $(document).on("click",'#loadmore',function() {
        $.post("/loadingmore",{molimit:$("#list").children("a").length,type:$("label[class='activate']").attr("value")}, function (data) {
            if (data.status == 200) {
                if(data.data.length!=0) {
                $.each(data.data, function (i, item) {

                        var headHtml = $("#subject-tmpl").html();
                        if (item.picture == null)
                            headHtml = headHtml.replace(/{cover}/g, "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512283982.jpg");
                        else
                            headHtml = headHtml.replace(/{cover}/g, "https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2512283982.jpg");
                        headHtml = headHtml.replace(/{id}/g, item.movieid);
                        headHtml = headHtml.replace(/{rate}/g, "4.0");
                        headHtml = headHtml.replace(/{cover_x}/g, "1500");
                        headHtml = headHtml.replace(/{cover_y}/g, "2200");
                        headHtml = headHtml.replace(/{title}/g, item.moviename);
                        $("#list").append(headHtml);
                })
                }else
                {alert("没有更多影片了")}
            }
            else {
                alert("加载更多图片资源错误");
            }
        })
        //headHtml = headHtml.replace(/{url}/g,"https://movie.douban.com/subject/26882533/?tag=热门");
        //headHtml = headHtml.replace(/{tag}/g,"热门");
    })

</script>

<!-- 电影卡片模板-->

<script type="text/tmpl" id="subject-tmpl">

        <a class="item"  name="imgitem" target="_blank" id="{id}" onclick='javascript:$.post("/Customer/Description",{id:$(this).attr("id")}, function (data) {
            if (data.status == 200) {
                location.href = "/MovieDescription"
            } else {
            }
        })'>

            <div class="cover-wp"  >
                <img src={cover} alt={title} data-x={cover_x} data-y={cover_y}/>
            </div>
            <p>{title}
               <strong>{rate}</strong>
            </p>
        </a>
    </script>
</body>
</html>
