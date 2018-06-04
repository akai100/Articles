package com.zxl.web.articles.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.zxl.web.articles.bean.Comment;
import com.zxl.web.articles.utils.DataBaseUtils;

public class CommentService {

	/**
	 * 保存评论
	 * @param comment
	 */
	public void saveComment(Comment comment) {
		String sql = "insert into t_comment(id,user_id,content,article_id,create_time,is_delete) values(?,?,?,?,?,?)";
		DataBaseUtils.update(sql, comment.getId(),comment.getUserId(),
	            comment.getContent(),comment.getArticleId(),new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()),0);
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<Map<String,Object>> getCommentsByArticleId(String id){
	    return DataBaseUtils.queryForList("select b.username ,a.content from t_comment a left JOIN t_user b " +
	             "on a.user_id = b.id  where a.article_id = ?", id);
	}
}
