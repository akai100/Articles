<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% 
String fromUrl = request.getParameter("from");
if (fromUrl == null || fromUrl.equals("")  )
    fromUrl = basePath ;
request.setAttribute("fromUrl", fromUrl);
%>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${basePath}/static/css/login.css">
	<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.min.js"></script>
	
	
	<style type="text/css">
	    *{
	            font-style: normal;
	            font-family: 微软雅黑;
	            list-style: none;
	            border-width: 0px;
	            border-style: initial;
	            border-color: initial;
	            border-image: initial;
	            outline: none;
	            margin: 0px;
	            padding: 0px;
	    }
	</style>
  </head>
  
  <body>
      <!-- 头部页面 -->
      <%@include file="common/header.jsp" %>
      <!-- 注册内容 -->
      <div class="login_">
          <div class="login-img">
              <img src="${basePath }/static/imgs/login_img.jpg"/>
          </div>
          <div class="login-box">
              <div class="login-cont">
                  <dt>
                      <span>账号登录</span>
                  </dt>
                  <dd style="display: block;">
                      <font class="error" id="mobileTip" style="display:none;">邮箱/用户名</font>
                      <p class="login-member">
                          <i></i>
                          <input id="username" name type="text" placeholder="请输入用户名/邮箱">
                      </p>
                      <p class="login-number">
                          <i></i>
                          <input id="password" name type="password" placeholder="请输入密码">
                      </p>
                      <span>
                          <button id="loginBtn" type="submit" class="btn btn btn-primary btn-block m-t-25" onclick="login()">登录</button>
                      </span>
                  </dd>
              </div>
          </div>
      </div>
      <script type="text/javascript">
          function login()
          {
              var username = $("#username").val();
              var password = $("#password").val();
              if (username == "")
              {
                  alert("账号不能为空！");
                  return;
              }
              if (password == "")
              {
                  alert("密码不能为空！");
              }
              
              $("#loginBtn").addClass("disabled");
              $("#loginBtn").text("登录中...");
              $.ajax({
                  type: "post",
                  url: "${basePath}/controller/loginController.jsp",
                  data: {"username": username, "password": password},
                  err: function () {
                      alert("登陆出错！");
                  },
                  success: function(data) {
                      if (data == -1)
                          alert("用户名和密码不能为空！");
                      else if (data == -2)
                          alert("用户名不存在！");
                      else if (data == -3)
                          alert("用户名或密码错误！");
                      else
                          window.location.href = "${fromUrl}";
                      $("#loginBtn").removeClass("disabled");
                      $("#loginBtn").text("登录");
                  }
              });
          }
      </script>
  </body>
</html>
