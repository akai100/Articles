<%@page import="com.zxl.web.articles.bean.User"%>
<%@page import="com.zxl.web.articles.utils.StringUtils"%>

<%@ page language="java" import="java.util.*, com.zxl.web.articles.service.LoginService, com.zxl.web.articles.bean.User, com.zxl.web.articles.utils.StringUtils" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 获取客户端传递过来参数
String username = request.getParameter("username");
String password = request.getParameter("password");
System.out.println(username);
System.out.println(password);

if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
    out.print("-1");
else {
    LoginService loginService = new LoginService();
    // 判断用户名是否存在
    User user = loginService.getUser(username);
    if (user == null)
        out.print("-2");
    else if (!username.equals(user.getUsername()) || !password.equals(user.getPassword()))
        out.print("-3");
    else {
        out.print("1");
        session.setAttribute("user", user);
        session.setAttribute("username", user.getUsername());
    }
}
%>
