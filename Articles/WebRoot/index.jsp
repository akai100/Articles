<%@ page language="java" import="java.util.*"%>
<%@ page import="com.zxl.web.articles.service.ArticleService" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="common/taglib.jsp" %>
<% 
String pageName = "index";
request.setAttribute("pageName", pageName);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <base href="${pageName }">
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${basePath}/static/css/index.css">
	<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.min.js"></script>
  </head>
  
  <body>
      <!-- 头部页面 -->
      <%@include file="common/header.jsp" %>
      <!-- Banner -->
      <div class="banner">
          <div class="content">
              <ul>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/5.jpg" />
                      </a>
                  </li>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/1.jpg" />
                      </a>
                  </li>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/2.jpg" />
                      </a>
                  </li>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/3.jpg" />
                      </a>
                  </li>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/4.jpeg" />
                      </a>
                  </li>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/5.jpg" />
                      </a>
                  </li>
                  <li>
                      <a href="javascript:void(0)">
                          <img src="${basePath}/static/imgs/1.jpg" />
                      </a>
                  </li>
              </ul>
              <i class="btn_left"></i>
              <i class="btn_right"></i>
          </div>
      </div>
      <!-- 内容区域 -->
      <div style="border:1px solid #ccc">
          <br/><br/>
          <div class="category">
              <div class="title">连载小说</div>
              <ul class="items">
                  <li class="item"></li>
                  <li class="item"></li>
                  <li class="item"></li>
                  <div style="clear:both"></div>
              </ul>
          </div>
          
          <%
              ArticleService articleService = new ArticleService();
              Integer id = new Integer(2);
              Integer start = new Integer(0);
              Integer end = new Integer(6);
              List<Map<String, Object>> articles2 = articleService.getArticlesByCategoryId(id, start, end);
              pageContext.setAttribute("articles2", articles2);
           %>
          <div class="category">
              <div class="title">编程代码类</div>
              <ul class="items">
                  <c:forEach items="${articles2 }" var="item">
                      <li class="item" onclick="detail('${item.id }')">
                          <div class="item-banner">
                              <div class="item-header">${item.header }</div>
                              <div class="item-name" title="${item.name }">${item.name }</div>
                              <div class="item-author">@${item.author } 著</div>
                          </div>
                          <div class="item-description">${item.description}</div>
                      </li>
                  </c:forEach>
                  <div style="clear:both"></div>
              </ul>
          </div>
      </div>
      <script type="text/javascript">
          var leftBtn = $(".btn_left").eq(0);
          var rightBtn = $(".btn_right").eq(0);
          var index = 0;
          var imgwidth = $(".banner .content ul li").width();
          var len = $(".banner .content ul li").length - 2;
          function movePicture() {
              $(".banner .content ul").animate({"margin-left": -imgwidth * (index + 1 )}, 1000, function() {
                  if (index == len) {
                      $(this).css("margin-left", -imgwidth);
                      index = 0;
                  }
                  if (index == -1) {
                      $(this).css("margin-left", -imgwidth * len);
                      index = len - 1;
                  }
              });
          }
          rightBtn.on("click", function() {
              index ++;
              movePicture();
          });
          leftBtn.on("click", function() {
              index --;
              movePicture();
          });
          function detail(id) {
              var a =document.createElement("a");
              a.href="${basePath}" + "/detail.jsp?id=" + id;
              a.target = "_new";
              a.click();
          }
      </script>
  </body>
</html>
