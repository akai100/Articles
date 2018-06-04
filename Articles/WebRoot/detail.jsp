<%@page import="com.zxl.web.articles.service.CommentService"%>
<%@page import="com.zxl.web.articles.service.ArticleService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${basePath}/static/css/index.css">
	<link rel="stylesheet" type="text/css" href="${basePath}/static/css/detail.css">
	<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.min.js"></script>

  </head>
  
  <body>
      <!-- 头部页面 -->
      <%@include file="common/header.jsp" %>
      <div class="right mt32">
          <div class="author">
              <img src="${basePath}/static/imgs/1.jpg }" class="header_pic" width="90" height="90"></img>作者张三
          </div>
      </div>
      <% 
          ArticleService articleService = new ArticleService();
          String id = request.getParameter("id");
          Map<String, Object> map = articleService.getContentByArticleId(id);
          pageContext.setAttribute("article", map);
      %>
      <!-- 内容区 -->
      <div class="article">
          <div class="title">${article.name }</div>
          <div class="ategory"><span class="light-font">分类：</span><span class="info">${article.category_name}</span></div>
          <div class="publicDate"><span class="light-font">发布时间：</span><span class="info">${article.create_time }</span></div>
          <hr/>
          <div class='content'>
              ${article.content}
          </div>
      </div>
      <hr />
      <% 
          CommentService commentService = new CommentService();
          List<Map<String,Object>> list = commentService.getCommentsByArticleId(id);
          pageContext.setAttribute("comments", list);
      %>
      <!-- 评论区 -->
      <div class='commentBox'>
          <textarea class="comment_input" id="commenttxt" placeholder="请输入评论信息(600)..." maxlength="600"></textarea>
          <input type="button" value="保存评论" class="button">
      </div>
      <div class='clearfix'></div>
      <br/><hr/>
      <div class='mb64' class="comment_list">
          <c:forEach items="${comments }" var="comment">
              <div class="comment_infor clearfix">
                  <div style='border-bottom:1px solid #ccc' class="comment_word">
                  <p style='border-bottom:20px solid #fff'>${comment.username}说：</p>
                  <p class='mb32'>${comment.content}</p>
              </div>
          </c:forEach>
      </div>
      <script type="text/javascript">
        $(".button").eq(0).on("click", function() {
            var txt = $("#commenttxt").val();
            $.post("${basePath}/controller/CommentController.jsp", {txt: txt, articleId: "${article.id}"}, function(data) {
                data = data.trim();
                if (data == "-1")
                    alert("请先登录！");
                else if (data == "1")
                {
                    alert("评论成功！");
                    location.reload();
                }
                  
            });
        });
      </script>
  </body>
</html>
