<%--
  Created by IntelliJ IDEA.
  User: wangqi
  Date: 2018/3/17
  Time: 下午9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>
        梦的6次方
    </title>
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/css/Homediscovery.css" rel="stylesheet">
</head>
<body>


<body>
<nav class="navbar navbar-default" role="navigation" style="background-color: #222;margin-bottom: 0%">
    <a class="navbar-brand" href="/" style="color: white">电影推荐网站</a>

    <div class="col-xs-4">
        <input id="inp-query" class="form-control" style="margin-bottom: 8px;margin-top: 8px;border-radius: 5px;" name="search_text"  maxlength="60" placeholder="搜索电影" value="">
    </div>
    <a class="navbar-brand" href="/index" style="color: white">选电影</a>
    <!-- 判断用户是否登录-->
    <c:if test="${sessionScope.user == null}">
        <a  class="dream" href="javascript:window.location.href='/page/register'" id="register" style=" text-decoration:none;float: right;color: white;font-size: 13pt;margin-top: 12px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-user"></span> 注册</a>
        <a  class="dream" href="javascript:window.location.href='/page/login'" style=" text-decoration:none;float: right;color: white;font-size: 13pt;margin-top: 12px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-log-in"></span> 登录</a>
    </c:if>
    <c:if test="${sessionScope.user != null}">

        <a class="dream" id="logout" href="javascript:window.location.href='/page/logout'" style=" text-decoration:none;float: right;color: white;font-size: 13pt;margin-top: 12px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-log-in"></span>  退出</a>
        <a class="dream" href="javascript:" style=" text-decoration:none;float: right;color: white;font-size: 13pt;margin-top: 12px;margin-right: 10px"><span style="color: white" class="glyphicon glyphicon-user"></span> ${sessionScope.user.username}</a>
    </c:if>
</nav>

<div class="fm-discovery" style="background-image: url(https://image.tmdb.org/t/p/w780/dji4Fm0gCDVb9DQQMRvAI8YNnTz.jpg)">
    <div class="x-kankan">
        <div id="x-kankan-detail" class="x-kankan-detail">
            <p class="x-kankan-title">
                <a href="" class="q" data-toggle="tooltip" title="" data-placement="top" data-original-title="点击查看《Toy Story》的详细资料">
                    Toy Story
                </a>
                <span class="revision-score">
            <span class="fm-rating">
        <a class="fm-green"  rel="nofollow" href="">
            评分 6.0 </a>
</span>
            </span>

            </p>
            <p class="x-kankan-desc">
                Led by Woody, Andy's toys live happily in his room until Andy's birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy's heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.

            <p></p>
            <p class="muted x-kankan-starring" style="margin-top:5px;">Directed by John Lasseter</p>
            <p class="muted">Animation,Comedy,Family</p>
        </div>
    </div>
    <div class="x-usermovie-controls x-kankan-buttons">
        <div class="btn-group fm-discovery-actions">

            <a href="" data-placement="top" class="btn-default revision-btn-left " title="" data-toggle="tooltip" data-movie="the-other-guys" data-cat="watched" data-class="btn-success" data-original-title="已经评过">
                <span class="glyphicon glyphicon-check"></span>
            </a>


            <a href="" data-placement="top" class="btn-default revision-btn-left " title="" data-toggle="tooltip" data-movie="the-other-guys" data-cat="liked" data-class="btn-danger" data-original-title="喜欢">
                <span class="glyphicon glyphicon-heart"></span>
            </a>


            <a href="" data-placement="top" class="btn-default revision-btn-left " title="" data-toggle="tooltip" data-movie="the-other-guys" data-cat="disliked" data-class="btn-gray" data-original-title="不喜欢">
                <span class="glyphicon glyphicon-trash"></span>
            </a>

        </div>
        <div class="btn-group x-kankan-navigator">
            <a class="revision-btn-history" id="btn_gethis">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a href="" class="btn-default revision-btn-next">
                <span>换一个看看&nbsp;</span><span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>



    <div class="xx-play-button">
        <a href="http://so.iqiyi.com/so/q_Toy%20Story" target="_blank" class="q" data-title="全网资源搜索" style="display: none;">
            <img src="/assets/img/Homeimg/kankan_play.7b61b6e9285d.png" alt="播放按钮">
        </a>
    </div>

</div>




<!--页面按钮hover提示 -->
<script>
    $(function(){
        if(!('ontouchstart' in window)) {
            $('[data-toggle="tooltip"]').tooltip();
        }
        if($('.top_messages').length > 0){
            setTimeout(function () {
                $('.top_messages').fadeOut();
            }, 5000);
        }
        $('.fm-lazy-img').each(function(i,e){
            $(e).attr('src', $(e).attr('data-src'));
        });
    });
</script>




<script>window._bd_share_config={"common":{"bdSnsKey":{"tsina":"2366108406"},"bdText":"电影《二流警探》高清资源，@电影FM网","bdMini":"2","bdMiniList":false,"bdPic":"http://7xksqe.com1.z0.glb.clouddn.com/media/backdrops/aw/awMESdeGymmNYTMhWvjJE5AP61a.jpg-discovery720","bdStyle":"0","bdSize":"24"},"slide":{"type":"slide","bdImg":"6","bdPos":"right","bdTop":"101"}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

<script>
    //播放按钮
    window.setTimeout(function(){
        $('.xx-play-button a').fadeIn(500, function(){
            window.setTimeout(function(){
                if(! $('.xx-play-button a').attr('data-hover')){
                    $('.xx-play-button a').hide();
                }
            }, 10*1000);
        });
        $('#fm_cache').html('<img src="http://7xksqe.com1.z0.glb.clouddn.com/media/backdrops/nC/nCK3Api5TteYOhbc7JTrbcD9OlO.jpg-discovery720" style="display:none;">');

        if(UI.getCookie('hide_qrcode') == ''){
            $('#fm_qrcode').show();
        }
    }, 500);
    $('.xx-play-button').mouseenter(function(){
        $(this).children('a').show();
        $(this).children('a').attr('data-hover', 'true');
    }).mouseleave(function(){
        $(this).children('a').hide();
    });




<!--回退上一部电影按钮 -->
    $('a#btn_gethis').click(function(){

        window.location.href = '';

    });

    $('#ctrl_mark_more_options').click(function(){
        var more_options = $('#mark_more_options');
        $(this).hide();
        more_options.show();
    });
</script>

<%--<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?10701d9b4e040e37e58bee7e1ec1d252";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>--%>



<!-- 分享栏-->
<div class="bdshare-slide-button-box bdshare-slide-style-r6" style="top: 101px; width: 0px; z-index: 99999; right: 0px;" data-bd-bind="1521336898773">
    <a href="#" onclick="return false;" class="bdshare-slide-button" style="left: -24px;"></a>
    <div class="bdshare-slide-list-box" style="width: 0px; display: none;">
        <div class="bdshare-slide-top">分享到</div><div class="bdshare-slide-list">
        <ul class="bdshare-slide-list-ul" style="width: 226px;"></ul></div>
        <div class="bdshare-slide-bottom" style="width: 226px;">
            <a href="#" onclick="return false;" class="slide-more" data-cmd="more">更多...</a>
        </div></div></div></body>
</body>
</html>
