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
	<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${basePath }/static/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<script type="text/javascript" src="${basePath}/static/js/jquery-3.3.1.min.js"></script>
	<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${basePath }/static/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  </head>
  
  <body>
      <!-- 模态框 -->
      <div class="modal fade" id="categorieModal" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
              <div class="modal-content">
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                      <h4>选择其他分类</h4>
                  </div>
                  <!-- body -->
                  <div class="modal-body">
                      <div id="treeView">
                      </div>
                  </div>
                  <!-- footer -->
                  <div class="modal-footer">
                  </div>
              </div>
          </div>
      </div>
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
                              <label class="labTitle col-form-label">文章标签：</label>
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
                                      <div class="dropdown">
                                          <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                          Dropdown
                                              <span class="caret"></span>
                                          </button>
                                          <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                              <li><a>Action</a></li>
                                              <li><a>Another action</a></li>
                                              <li><a>Something else here</a></li>
                                              <li role="separator" class="divider"></li>
                                              <li><a data-toggle="modal" data-target="#categorieModal">选择其他分类...</a></li>
                                          </ul>
                                      </div>
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
              tagNum += 1;
              $("div.tag:last i").click(function() {
                  $("div.tag:last").remove();
                  if (tagNum == 3)
                      $("#addTag").removeAttr("disabled");
                  tagNum -= 1;
              });
              if (tagNum == 3)
              {
                  $("#addTag").attr("disabled", "");
              }
          });
          // 添加个人分类按钮
          $("#addCategorie").click(function() {
              $("#categorieModal").modal('show');
          })
          //
          var data = {files: [
             {id: 0,pid: -1,title: '全部文件'},{id: 1,pid: 0,title: '我的收藏'},{id: 2,pid: 0,title: '我的音乐'},
             {id: 3,pid: 0,title: '我的电影'},{id: 4,pid: 0,title: '我的书籍'},{id: 11,pid: 1,title: '工具'},
             {id: 12,pid: 1,title: '画册'},{id: 13,pid: 1,title: '班级图片'},{id: 41,pid: 4,title: 'JavaScript 高级程序设计'},
             {id: 42,pid: 4,title: '锋利的jQuery'},{id: 43,pid: 4,title: 'JavaScript语言精粹'}
         ]};
         var fileData = data.files;
         var treeView = $("#treeView")[0];
         treeView.innerHTML = treeHtml(fileData, -1);
         function treeHtml(fileData, fileId)
         {
             var _html = '';
             var children = getChildById(fileData, fileId);
             var hideChild = fileId > 0 ? 'none' : '';
             
             _html += '<ul class="' + hideChild + '">';
             
             children.forEach(function(item, index){
                 var level = getLevelById(fileData, item.id);
                 var distance = (level - 1) * 20 + 'px';
                 var hasChild = hasChilds(fileData, item.id);
                 var className = hasChild ? '' : 'treeNode-empty';
                 var treeRoot_cls = fileId === -1 ? 'treeNode-cur' : '';
                 
                 _html += '<li><div class="treeNode' + className + ' ' + treeRoot_cls + '" style="padding-left:' + distance + '}" data-file-id="' + item.id + '"><i class="icon icon-control icon-add"></i><i class="icon icon-file"></i><span class="title">' + item.title + '</span></div>' + treeHtml(fileData, item.id) +'</li>';
             });
             _html += '</ul>';
             return _html;
             
         }
         function getChildById(arr, pid)
         {
             var newArr = [];
             for (var i = 0; i < arr.length; i++)
             {
                 if (arr[i].pid == pid)
                     newArr.push(arr[i]);
             }
             return newArr;
         }
         function getLevelById(data, id) 
         {
             return getParents(data, id).length;
         }
         function hasChilds(data, id)
         {
             return getChildById(data, id).length !== 0;
         }
         function getParents(data, currentId)
         {
             var arr = [];
             for (var i = 0; i < data.length; i++)
             {
                 if (data[i].id == currentId)
                 {
                     arr.push(data[i]);
                     arr = arr.concat(getParents(data, data[i].pid))
                     break;
                 }
             }
             return arr;
         }
      </script>
  </body>
</html>
