<%@page import="com.zxl.web.articles.service.RegisService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<%
String userName = request.getParameter("userName");
String password = request.getParameter("password");
String email = request.getParameter("email");
String male = request.getParameter("sex");
String address = request.getParameter("address");
RegisService regisService = new RegisService();
regisService.regis(userName, password, email, male, address);
out.print(1);
%>
