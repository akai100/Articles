<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${basePath}/static/css/header.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="header">
    <ul>
        <c:choose>
            <c:when test="${pageName == 'index'}">
                <li class="first"><a href="${basePath }/">首页</a></li>
            </c:when>
            <c:otherwise>
                <li class="item"><a href="${basePath }/">首页</a></li>
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${pageName == 'MyPost'}">
            <li class="first"><a href="javascript:void(0)">原创故事</a></li>
            </c:when>
            <c:otherwise>
            <li class="item"><a href="javascript:void(0)">原创故事</a></li>
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${pageName == 'hotPost'}">
            <li class="first"><a href="javascript:void(0)">热门专题</a></li>
            </c:when>
            <c:otherwise>
            <li class="item"><a href="javascript:void(0)">热门专题</a></li>
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${pageName == 'xinshangmeiwen1'}">
            <li class="first"><a href="javascript:void(0)">欣赏美文</a></li>
            </c:when>
            <c:otherwise>
            <li class="item"><a href="javascript:void(0)">欣赏美文</a></li>
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${pageName == 'postEdit'}">
            <li class="first"><a href="${basePath }/postedit.jsp">写文章</a></li>
            </c:when>
            <c:otherwise>
            <li class="item"><a href="${basePath }/postedit.jsp">写文章</a></li>
            </c:otherwise>
        </c:choose>
        
        <c:choose>
            <c:when test="${pageName == 'support'}">
                <li class="first"><a href="javascript:void(0)">赞助</a></li>
            </c:when>
            <c:otherwise>
                <li class="item"><a href="javascript:void(0)">赞助</a></li>
            </c:otherwise>
        </c:choose>     
    </ul>
    <div class="login">
        <c:choose>
            <c:when test="${empty sessionScope.username}">
                <span><a href="${basePath}/login.jsp">登陆</a></span>
                <span>|</span>
                <span><a href="${basePath}/regist.jsp">注册</a></span>
            </c:when>
            <c:otherwise>
                <span><a href="javascript:void(0)">欢迎您，${sessionScope.username}</a></span>
                <span>|</span>
                <span><a href="${basePath }/controller/lagoutController.jsp">退出</a></span>
            </c:otherwise>
        </c:choose>
    </div>
</div>
