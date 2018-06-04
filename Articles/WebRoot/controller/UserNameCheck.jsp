<%@page import="com.zxl.web.articles.service.RegisService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<%
 String userName = request.getParameter("userName");
 System.out.println(userName);
 RegisService regisService = new RegisService();
 if (regisService.userNameIsExit(userName))
     out.print(1);
 else
     out.print(0);
%>
