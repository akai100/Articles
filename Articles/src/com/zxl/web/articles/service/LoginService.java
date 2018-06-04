package com.zxl.web.articles.service;

import com.zxl.web.articles.bean.User;
import com.zxl.web.articles.utils.DataBaseUtils;

/**
 * 登陆的服务类
 * @author Nada
 *
 */
public class LoginService {

	public User getUser(String username) {
		String sql = "select * from t_user where username = ?";
		User user = DataBaseUtils.queryForBean(sql, User.class, username);
		
		if (user == null)
			return null;
		return user;
	}
}
