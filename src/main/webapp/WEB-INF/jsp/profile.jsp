<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh" data-theme="light">
  
  <head>
    <meta charset="utf-8" />
    <title data-react-helmet="true">梦的6次方</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1" />
    <meta name="renderer" content="webkit" />
    <meta name="force-rendering" content="webkit" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="google-site-verification" content="FTeR0c8arOPKh8c5DYh_9uu98_zJbaWw53J-Sch9MTg" />
    <meta data-react-helmet="true" name="apple-itunes-app" content="app-id=432274380,
    app-argument=zhihu://people/uu-ll-98" />
    <link data-react-helmet="true" rel="prefetch" href="/assets/img/user_cover_image.jpg" />
    <link rel="shortcut icon" type="image/x-icon" href="https://static.zhihu.com/static/favicon.ico" />
    <link rel="dns-prefetch" href="//static.zhimg.com" />
    <link rel="dns-prefetch" href="//pic1.zhimg.com" />
    <link rel="dns-prefetch" href="//pic2.zhimg.com" />
    <link rel="dns-prefetch" href="//pic3.zhimg.com" />
    <link rel="dns-prefetch" href="//pic4.zhimg.com" />
    <script src="/assets/js/jquery.js"></script>
    <script src="/assets/js/bootstrap.min.js"></script>
    <!-- 星星评分CSS-->
    <script src="/assets/js/star-rating.min.js" type="text/javascript"></script>
    <link href="/assets/css/star-rating.css" media="all" rel="stylesheet" type="text/css" />

    <link href="/assets/css/douban.main.css" rel="stylesheet" />
    <link href="/assets/css/bootstrap.css" rel="stylesheet">

    <style>
      .component-poster-detail .nav-tabs > li {
        width: 50% !important;
      }
    </style>

    <script type="text/javascript">
        window.onload=function(){
            $("input[name='allstar']").rating({
                    showClear:false,
                    size:'xs',
                    showCaption:false,
                    readonly:true,
                }
            );}
    </script>
  </head>
  
  <body class="Entry-body">
    <div id="root">
      <div data-zop-userToken="{&quot;urlToken&quot;:&quot;uu-ll-98&quot;}" data-reactroot="" data-reactid="1" data-react-checksum="-1191953014">
        <!-- react-empty: 2 -->
        <div class="LoadingBar" data-reactid="3"></div>
        <!-- react-empty: 4 -->
        <div data-reactid="5">
          <!-- 导航栏-->
          <nav class="navbar navbar-default" role="navigation" style="background-color: black;margin-bottom: 0%">
            <a class="navbar-brand" href="/" style="color: white">电影推荐网站</a>

            <div class="col-xs-4">
              <input id="inp-query" class="form-control" style="margin-bottom: 8px;margin-top: 8px;border-radius: 5px;" name="search_text"  maxlength="60" placeholder="搜索电影" value="">
            </div>
            <a class="navbar-brand" href="/index" style="color: white">选电影</a>
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
        </div>
        <!-- react-empty: 47 -->
        <main role="main" class="App-main" data-reactid="48">
          <div data-reactid="49">
            <!-- react-empty: 50 -->
            <div itemprop="people" itemtype="http://schema.org/Person" itemscope="" data-reactid="51">
              <meta itemprop="url" content="https://www.zhihu.com/people/uu-ll-98" data-reactid="52" />
              <meta itemprop="gender" content="Male" data-reactid="53" />
              <meta itemprop="image" content="https://pic3.zhimg.com/49d24e6c727b38ebd140ec0572ad84ca_is.jpg" data-reactid="54" />
              <meta itemprop="zhihu:voteupCount" content="20" data-reactid="55" />
              <meta itemprop="zhihu:thankedCount" content="0" data-reactid="56" />
              <meta itemprop="zhihu:followerCount" content="0" data-reactid="57" />
              <meta itemprop="zhihu:answerCount" content="7" data-reactid="58" />
              <meta itemprop="zhihu:articlesCount" content="0" data-reactid="59" />
              <!-- react-empty: 60 -->
              <div id="ProfileHeader" class="ProfileHeader" data-reactid="61">
                <div class="Card" data-reactid="62">
                  <div class="ProfileHeader-userCover" data-reactid="63">
                    <div class="UserCoverEditor" data-reactid="64">
                      <div data-reactid="65">
                        <div class="UserCover" data-reactid="71">
                          <div class="VagueImage UserCover-image" data-src="/assets/img/user_cover_image.jpg" data-reactid="72">
                            <img src="/assets/img/user_cover_image.jpg">
                            <div class="VagueImage-mask" data-reactid="73"></div>
                          </div>
                        </div>
                      </div>
                      <input type="file" accept="image/png,image/jpeg" style="display:none;" data-reactid="74" /></div>
                  </div>
                  <div class="ProfileHeader-wrapper" data-reactid="75">
                    <div class="ProfileHeader-main" data-reactid="76" style="margin-bottom: 0px;">
                      <div class="UserAvatarEditor ProfileHeader-avatar" style="top:-57px;margin-left: 20px;" data-reactid="77">
                        <div class="UserAvatar" data-reactid="78">
                          <img class="Avatar Avatar--large UserAvatar-inner" width="160" height="160" src="/assets/img/user_avatar.jpg" srcset="/assets/img/user_avatar.jpg 2x" data-reactid="79" /></div>
                        <div class="Mask UserAvatarEditor-mask Mask-hidden" data-reactid="80">
                          <div class="Mask-mask Mask-mask--black UserAvatarEditor-maskInner" data-reactid="81"></div>
                          <div class="Mask-content" data-reactid="82">
                            <svg class="Zi Zi--Camera UserAvatarEditor-cameraIcon" fill="currentColor" viewBox="0 0 24 24" width="36" height="36" data-reactid="83">
                              <path d="M20.094 6S22 6 22 8v10.017S22 20 19 20H4.036S2 20 2 18V7.967S2 6 4 6h3s1-2 2-2h6c1 0 2 2 2 2h3.094zM12 16a3.5 3.5 0 1 1 0-7 3.5 3.5 0 0 1 0 7zm0 1.5a5 5 0 1 0-.001-10.001A5 5 0 0 0 12 17.5zm7.5-8a1 1 0 1 0 0-2 1 1 0 0 0 0 2z" fill-rule="evenodd" data-reactid="84"></path>
                            </svg>
                            <div class="UserAvatarEditor-maskInnerText" data-reactid="85">修改我的头像</div></div>
                        </div>
                        <input type="file" accept="image/png,image/jpeg" style="display:none;" data-reactid="86" /></div>
                      <div class="ProfileHeader-content" data-reactid="87">
                        <div class="ProfileHeader-contentHead" data-reactid="88">
                          <h1 class="ProfileHeader-title" data-reactid="89">
                            <span class="ProfileHeader-name" data-reactid="90">${sessionScope.user.username}</span>
                            <!-- react-empty: 92 --></h1>
                        </div>
                        <div style="overflow:hidden;transition:height 300ms ease-out;" class="ProfileHeader-contentBody" data-reactid="93">
                          <div data-reactid="94">
                            <div class="ProfileHeader-info" data-reactid="95">
                              <div class="ProfileHeader-infoItem" data-reactid="96">
                                <div class="ProfileHeader-iconWrapper" data-reactid="97">

                                </div>
                                <div class="ProfileHeader-divider" data-reactid="102"></div>
                                <div class="ProfileHeader-divider" data-reactid="104"></div>
                                <div class="ProfileHeader-iconWrapper" data-reactid="105">

                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="ProfileHeader-contentFooter" data-reactid="109">
                          <button class="Button ProfileHeader-expandButton Button--plain" type="button" data-reactid="110">
                            <%--<svg viewBox="0 0 10 6" class="Icon ProfileHeader-arrowIcon Icon--arrow" style="height:16px;width:10px;" width="10" height="16" aria-hidden="true" data-reactid="111">--%>
                              <%--<title data-reactid="112"></title>--%>
                              <%--<g data-reactid="113">--%>
                                <%--<path d="M8.716.217L5.002 4 1.285.218C.99-.072.514-.072.22.218c-.294.29-.294.76 0 1.052l4.25 4.512c.292.29.77.29 1.063 0L9.78 1.27c.293-.29.293-.76 0-1.052-.295-.29-.77-.29-1.063 0z" /></g>--%>
                            <%--</svg>--%>
                            <%--<!-- react-text: 114 -->查看详细资料--%>
                            <!-- /react-text --></button>
                          <div class="ProfileButtonGroup ProfileHeader-buttons" data-reactid="115" style="bottom: 30px;">
                            <button class="Button Button--blue" type="button" data-reactid="116">
                              <!-- react-text: 117 -->编辑
                              <!-- /react-text -->
                              <!-- react-text: 118 -->个人
                              <!-- /react-text -->
                              <!-- react-text: 119 -->资料
                              <!-- /react-text --></button></div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="Profile-main" data-reactid="120">
                <div class="Profile-mainColumn" data-reactid="121">
                  <div class="Card ProfileMain" id="ProfileMain" data-reactid="122">
                    <div class="ProfileMain-header" data-reactid="123">
                      <%--<ul role="tablist" class="Tabs ProfileMain-tabs" data-reactid="124" style="margin-bottom: 0px;">--%>
                        <%--<li role="tab" class="Tabs-item Tabs-item--noMeta" aria-controls="Profile-activities" data-reactid="125">--%>
                          <%--<a class="Tabs-link is-active" href="/people/uu-ll-98/activities" data-reactid="126">喜欢的电影</a></li>--%>
                        <%--<li role="tab" class="Tabs-item" aria-controls="Profile-answers" data-reactid="127">--%>
                          <%--<a class="Tabs-link" href="/people/uu-ll-98/answers" data-reactid="128">--%>
                            <%--<!-- react-text: 129 -->已评价的电影--%>
                            <%--<!-- /react-text -->--%>
                            <%--<span class="Tabs-meta" data-reactid="130">7</span></a>--%>
                        <%--</li>--%>
                      <%--</ul>--%>

                        <ul class="nav nav-tabs" role="tablist">
                          <li role="presentation" class="active" style="text-align: center"><a href="#film-info"
                                                                                               aria-controls="film info"
                                                                                               data-toggle="tab"
                                                                                               aria-expanded="true">喜欢</a>
                          </li>
                          <li role="presentation" class="" style="text-align: center"><a id="reviewsId"
                                                                                         href="#reviews"
                                                                                         aria-controls="reviews"
                                                                                         data-toggle="tab"
                                                                                         aria-expanded="false">已评价</a></li>
                        </ul>

                        <div class="tab-content">
                          <div class="tab-pane fade active in" id="film-info" data-zop-feedlistfather="1" data-reactid="158">
                            <div class="List-header" data-reactid="159">
                              <h4 class="List-headerText" data-reactid="160"><span data-reactid="161">
              <!-- react-text: 162 -->我喜欢的电影
                          </span></h4>
                              <div class="List-headerOptions" data-reactid="164"></div>
                            </div>
                            <div class="" data-reactid="165">

                              <c:if test="${sessionScope.movies != null}">
                                <c:forEach var="item"   items="${sessionScope.movies}">

                                  <div class="List-item" data-reactid="166">
                                    <p class="ul first"></p>
                                    <table width="100%" class="">
                                      <tr class="item">
                                        <td width="100" valign="top">
                                          <a class="nbg" value="${item.movieid}" onclick='javascript:$.post("/Customer/Description",{id:$(this).attr("value")}, function (data) {
                                                  if (data=="success") {
                                                      location.href = "/MovieDescription"
                                                  } else {
                                                  }
                                              })' title="${item.moviename}">
                                            <img src="${item.picture}" width="75" alt="${item.moviename}" class=""/>
                                          </a>
                                        </td>
                                        <td valign="top">
                                        <div class="pl2">

                                          <a  value="${item.movieid}" onclick='javascript:$.post("/Customer/Description",{id:$(this).attr("value")}, function (data) {
                                                  if (data=="success") {
                                                      location.href = "/MovieDescription"
                                                  } else {
                                                  }
                                              })' class="">
                                              ${item.moviename}
                                          </a>
                                          <p class="pl"><fmt:formatDate type="date" value="${item.showyear}" pattern="yyyy-MM-dd"/>上映</p>
                                          <p class="pl">导演：${item.director}</p>
                                          <div class="star clearfix">
                                            <span class="allstar40"></span>
                                            <span class="rating_nums">${item.averating}</span>
                                            <span class="pl">(${item.numrating}人评价)</span>

                                          </div>


                                        </div>

                                      </td>
                                    </tr>
                                  </table>
                                  <div id="collect_form_11584016"></div>

                              </div>
                                </c:forEach>
                              </c:if>
                            </div>

                          </div>

                          <div class="tab-pane fade" id="reviews" data-zop-feedlistfather="1" data-reactid="158">
                            <div class="List-header" data-reactid="159">
                              <h4 class="List-headerText" data-reactid="160"><span data-reactid="161">
              <!-- react-text: 162 -->我评价过的电影
                          </span></h4>
                              <div class="List-headerOptions" data-reactid="164"></div>
                            </div>
                            <div class="" data-reactid="165">

                              <c:if test="${sessionScope.reviews != null}">
                              <c:forEach var="item"   items="${sessionScope.reviews}">

                                <div class="List-item" data-reactid="166">
                                  <p class="ul first"></p>
                                  <table width="100%" class="">
                                    <tr class="item">
                                      <td width="100" valign="top">
                                        <a class="nbg" value="${item.movieid}" onclick='javascript:$.post("/Customer/Description",{id:$(this).attr("value")}, function (data) {
                                                  if (data=="success") {
                                                      location.href = "/MovieDescription"
                                                  } else {
                                                  }
                                              })' >
                                          <img src="${item.picture}" width="75" class=""/>
                                        </a>
                                      </td>
                                      <td valign="top">
                                        <div class="pl2">
                                          <div> <input name="allstar"  value="${item.star}" ></div>
                                          <div><b style="font-size: 11pt">你的评分:</b> <span style="font-size: 9pt">${item.star}分</span></div>
                                          <span property="v:dtreviewed" content="2018-03-19" class="main-meta">
                                              <fmt:formatDate type="date" value="${item.reviewtime}" pattern="yyyy-MM-dd"/>
                                          </span>
                                          <p class="pl">你的评价！！！！</p>
                                        </div>
                                      </td>
                                    </tr>
                                  </table>
                                </div>
                              </c:forEach>
                              </c:if>

                            </div>

                          </div>
                        </div>
                    </div>

                  </div>
              </div>
                <div class="Profile-sideColumn" data-za-module="RightSideBar" data-reactid="294">
                  <div class="Card" data-reactid="295">
                    <div class="Card-header Profile-sideColumnTitle" data-reactid="296">
                      <div class="Card-headerText" data-reactid="297">推荐电影</div></div>
                  </div>
                  <!-- react-empty: 318 -->

                  <div class="Profile-lightList" data-reactid="329">

                    <c:if test="${sessionScope.rectabs != null}">
                    <c:forEach var="item"   items="${sessionScope.rectabs}">
                        <a class="Profile-lightItem" href="/people/uu-ll-98/following/topics" data-reactid="330"><span class="Profile-lightItemName" data-reactid="331">${item.moviename}</span><span class="Profile-lightItemValue" data-reactid="332">${item.averating}分</span></a>
                    </c:forEach>
                    </c:if>
                  </div>

                </div>
            </div>
            </div>
          </div>
        </main>
        <!-- react-empty: 348 -->
        <!-- react-empty: 349 -->
        <!-- react-empty: 350 -->
        <!-- react-empty: 351 --></div>
    </div>
   
    </div>
    <script src="https://static.zhihu.com/heifetz/vendor.d063778094ddaa35854a.js"></script>
    <script src="https://static.zhihu.com/heifetz/main.raven.7f65994fced9bab43ea4.js" async=""></script>
    <script src="https://static.zhihu.com/heifetz/main.app.fef597c154271aa91044.js"></script>
    <script></script>
  </body>

</html>