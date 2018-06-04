<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="common/taglib.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${basePath }/static/css/regist.css">
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.min.js"></script>
  </head>
  
  <body>
      <!-- 头部页面 -->
      <%@include file="common/header.jsp" %>
      <!-- 注册内容 -->
      <div class="signup-container">
        <div class="sigup-header">
            <h3 class="text-center">创建账号</h3>
        </div>
        <div class="bg-white tiled signup-block">
            <div class="signup-block__left">
                <!-- 用户名 -->
                <div class="form-group">
                    <label><em class="red">*</em> 用户名</label>
                    <input class="form-control" type="text" id="userNameInput"/>
                    <span class="red" id="usernameError"></span>
                </div>
                <!-- 密码 -->
                <div class="form-group">
                    <label><em class="red">*</em> 密码</label>
                    <input class="form-control" type="text" id="passwordInput"/>
                    <span class="red" id="passwordError"></span>
                </div>
                <!-- 确认密码 -->
                <div class="form-group">
                    <label><em class="red">*</em> 确认密码</label>
                    <input class="form-control" type="text" id="passwordConfirmInput"/>
                    <span class="red" id="passwordConfirmError"></span>
                </div>
                <!-- 邮箱 -->
                <div class="form-group">
                    <label><em class="red">*</em> 邮箱</label>
                    <input class="form-control" type="text" id="emailInput"/>
                    <span class="red" id="emailError"></span>
                </div>
                <!-- 性别 -->
                <div class="form-group">
                    <label>性别</label><br/>
                    <label>
                        <input type="radio" name="sexRadios" id="maleRadio" value="男" checked>男
                    </label>
                    <label>
                        <input type="radio" name="sexRadios" id="femaleRadio" value="女">女
                    </label>
                </div>
                <!-- 地址 -->
                <div class="form-group">
                    <label>地址</label>
                    <input class="form-control" type="text" id="addressInput"/>
                </div>
                
                <button id="regisBtn" type="submit" class="btn btn btn-primary btn-block m-t-25" onclick="regis()">注册</button>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        // 检查用户名
        function checkUserName()
        {
            var userName = $("#userNameInput").val();
            alert(userName);
            if (userName == "")
            {
                $("#usernameError").text("用户名不能为空！");
                return;
            }
            if (userName.length < 6)
            {
                $("#usernameError").text("用户名长度不能低于6！");
                return;
            }
            $.ajax({
                type: "post",
                url: "${basePath}/controller/UserNameCheck.jsp",
                data: {"userName": userName},
                success: function (data) {
                    if (data == 0)
                    {
                        $("#usernameError").text("");
                    }
                       
                    if (data == 1)
                    {
                        $("#usernameError").text("该用户名已经存在！");
                    }
                       
                }
            });
        }
        
        function checkPassword()
        {
            var password = $("#passwordInput").val();
            if (password == "")
            {
               $("#passwordError").text("请输入密码!");
               return;
            }
            if (password.length < 6)
            {
                $("#passwordError").text("密码不能低于6位！");
                return;
            }
            $("#passwordError").text("");
        }
        
        function checkConfirmPassword()
        {
            var password = $("#passwordInput").val();
            var passwordConfirm = $("#passwordConfirmInput").val();
            if (passwordConfirm == "")
            {
                $("#passwordConfirmError").text("请输入密码！");
                return;
            }
            if (password != passwordConfirm)
            {
                $("#passwordConfirmError").text("两次密码不一致！");
                return;
            }
            $("#passwordConfirmError").text("");
        }
        
        function checkEmail()
        {
            var email = $("#emailInput").val();
            if (email == "")
            {
                $("#emailError").text("请输入邮箱！");
                return;
            }
            var pattern = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
            if (!pattern.test(email))
            {
                $("#emailError").text("请输入正确邮箱！");
                return;
            }
            $("#emailError").text("");
        }
        
        function canRegis()
        {
            if ($("#usernameError").val() != "")
                return false;
            if ($("#passwordError").val() != "")
                return false;
            if ($("#passwordConfirmError").val() != "")
                return false;
            if ($("#emailError").val() != "")
                return false;
            return true;
        }
        //  用户名输入框失去焦点事件
        $("#userNameInput").blur(function() {
            checkUserName();
        });
        
        // 密码框失去焦点事件
        $("#passwordInput").blur(function () {
            checkPassword();
        });
        // 密码确认框失去焦点事件
        $("#passwordConfirmInput").blur(function() {
           checkConfirmPassword();
        });
        // 邮箱框失去焦点事件
        $("#emailInput").blur(function() {
           checkEmail();
        });
        function regis()
        {
            checkUserName();
            checkPassword();
            checkConfirmPassword();
            checkEmail();
            if (!canRegis())
                return;
            var userName = $("#userNameInput").val();
            var password = $("#passwordInput").val();
            var passwordConfirm = $("#passwordConfirmInput").val();
            var email = $("#emailInput").val();
            var sex = $("input[name='sexRadios']:checked").val();
            var address = $("#addressInput").val();
            $("#regisBtn").text("注册中...");
            $("#regisBtn").addClass("disabled");
            
            $.ajax({
                 type: "post",
                 url: "${basePath}/controller/RegisController.jsp",
                 data:{"userName": userName, "password": password, "email": email, "sex": sex, "address": address},
                 err: function() {
                     alert("注册失败！");
                     $("#regisBtn").removeClass("disabled");
                     
                 },
                 success: function(data) {
                     if (data == -1)
                     {
                         alert("注册失败！");
                         $("#regisBtn").removeClass("disabled");
                     }
                     if (data == 1)
                          window.location.href = "${basePath}/login.jsp";
                 }
            });
        }
       
    </script>
  </body>
</html>
