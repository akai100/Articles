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
	
	<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.min.js"></script>

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
                                  <p class="mt8">
                                      <span class="ipt-remark">最多添加3个标签</span>
                                  </p>
                              </div>
                          </div>
                          <!-- 个人分类 -->
                          <div class="form-group row form-control-sm">
                              <label class="labTitle col-form-label">个人分类：</label>
                              <div class="txt-box">
                                  <div class="tag-box d-flex flex-row" id="categorieBox">
                                      <button class="btn-add-tag" id="addCategorie">添加新分类</button>
                                  </div>
                                  <!--  -->
                                  <div class="categorie-list">
                                      <div class="form-check">
                                          <label class="form-check-label">
                                              <input class="form-check-input" type="checkbox" value="Java Web">
                                          </label>
                                      </div>
                                  </div>
                              </div>
                          </div>
                          <!-- end -->
                          <!-- 文章类型 -->
                          <div class="form-group row form-control-sm d-flex">
                              <label class="labTitle col-form-label">文章类型：</label>
                              <div class="txt-box">
                                  <select id="selType">
                                      <option value="0">请选择</option>
                                      <option value="1">原创</option>
                                      <option value="2">转载</option>
                                      <option value="4">翻译</option>
                                  </select>
                                  <span class="required">*</span>
                              </div>
                              <label class="labTitle col-form-label ml-24">博客分类：</label>
                              <div class="txt-box">
                                  <select class="droBlogType" id="radCh1">
                                  
                                  </select>
                                  <span class="required">*</span>
                              </div>
                          </div>
                          <!--  -->
                          <div class="opt-box row unfull">
                              <label class="labTitle col-form-label"></label>
                              <div class="txt-box">
                                  <input id="btnPublish" type="button" class="btn btn-outline-danger" value="发布文章">
                                  <input id="btnDraft" type="button" class="btn btn-outline-danger" value="保存草稿">
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <script type="text/javascript">
          // 添加标签点击事件
          var tagNum = 0;
          $("#addTag").click(function(){
              
              $("#addTag").before("<div class=\"tag\"><span class=\"name\" contenteditable=\"true\"></span><i class=\"xheIcon icon-guanbi\"></i></div>");
              $(".xhIcon").click(function() {
                  alert("click");
              });
              tagNum += 1;
              if (tagNum == 3)
              {
                  $("#addTag").attr("disabled", "");
              }
          });
          
      </script>
  </body>
</html>
