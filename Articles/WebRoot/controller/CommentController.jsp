<%@page import="com.zxl.web.articles.bean.Comment"%>
<%@page import="com.zxl.web.articles.service.CommentService"%>
<%@page import="com.zxl.web.articles.bean.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user = (User) session.getAttribute("user");
if (user == null){
    out.print("-1");
    return;
}
String txt = request.getParameter("txt").toString();
String articleId = request.getParameter("articleId").toString();

CommentService commentService = new CommentService();
Comment comment = new Comment();
comment.setId(UUID.randomUUID().toString());
comment.setUserId(user.getId());
comment.setArticleId(articleId);
comment.setContent(txt);
commentService.saveComment(comment);
%>
