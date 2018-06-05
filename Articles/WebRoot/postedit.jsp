<%@page import="com.zxl.web.articles.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp" %>
<%
String pageName = "postEdit";
request.setAttribute("pageName", pageName);
User user = (User) session.getAttribute("user");
String url = request.getRequestURL().toString();
if (user == null)
      response.sendRedirect(basePath + "/login.jsp?from=" + url);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>写文章</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${basePath }/static/css/postedit.css">
	<link rel="stylesheet" type="text/css" href="${basePath }/static/css/common.css">

  </head>
  
  <body>
      <!-- 头部页面 -->
      <%@include file="common/header.jsp" %>
      <!--  -->
      <div class="container">
          <div class="row row-offcanvas row-offcanvas-right main-wrapper">
              <div class="col-6 col-md-2 sidebar-offcanvas">
                  <div class="list-group-item list-group-title">内容</div>
                  <div class="list-group">
                      <a class="list-group-item active">写文章</a>
                      <a class="list-group-item">文章类别管理</a>
                  </div>
                  <div class="list-group-item list-group-title">设置</div>
                  <div class="list-group"></div>
              </div>
              <!-- - -->
              <div class="col-12 col-md-10" id="content-body">
                  <div class="title-box">
                      <input type="text" id="txtTitle" maxlength="100" placeholder="请输入文章标题">
                  </div>
                  <div class="selection">
                      <textarea rows="30" id="editor" name="editor"></textarea>
                  </div>
                  <!--  -->
                  <div id="moreDiv">
                      <div class="pos-box">
                          <div class="form-group row form-control-sm">
                              <label class="labTitle" col-form-label">文章标签：</label>
                              <div class="txt-box">
                                  <div class="tag-box d-flex flex-row" id="articleTagBox">
                                      <button class="btn-add-tag" id="addTag">
                                          <i class="xheIcon icon-tianjia mr8" aria-hidden="true"></i>添加标签                                       
                                      </button>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </body>
</html>
