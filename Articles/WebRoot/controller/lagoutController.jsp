<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="../common/taglib.jsp" %>
<%
// 注销
session.removeAttribute("username");
session.invalidate();
response.sendRedirect( basePath);
%>
