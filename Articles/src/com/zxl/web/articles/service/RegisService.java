package com.zxl.web.articles.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.zxl.web.articles.utils.DataBaseUtils;

public class RegisService {

	public boolean userNameIsExit(String userName) {
		String sql = "select * from t_user where username = ?";
		Map<String, Object> result = DataBaseUtils.queryForMap(sql, userName);
		if(result == null)
			return false;
		return true;
	}
	
	public void regis(String userName, String password, String email, String sex, String address ) {
		String sql = "insert into t_user(username, password, email, sex, create_time, is_delete, address) values(?,?,?,?,?,?,?)";
		DataBaseUtils.update(sql, userName, password, email, sex, 
				new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()), 0, address);
	}
}
