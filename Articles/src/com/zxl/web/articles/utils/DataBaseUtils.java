package com.zxl.web.articles.utils;

import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;



public class DataBaseUtils {

	static {
		config("jdbc.properties");
	}
	
	private static String username;
	private static String password;
	private static String dataBaseName;
	
	public static void config(String path) {
		InputStream inputStream = DataBaseUtils.class.getClassLoader().getResourceAsStream(path);
		System.out.println(inputStream);
		Properties p = new Properties();
		try {
			p.load(inputStream);
			username = p.getProperty("db.username");
			password = p.getProperty("db.password");
			dataBaseName = p.getProperty("db.dataBaseName");;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取连接
	 * @return
	 */
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://39.108.228.251:3306/" + dataBaseName + "?useUnicode=true&characterEncoding=utf8", username, password);
		} catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return connection;
	}
	
	/**
	 * 关闭数据源操作
	 * @param connection
	 * @param statement
	 * @param rs
	 */
	public static void closeConnection(Connection connection, PreparedStatement statement, ResultSet rs) {
		try {
			if (rs != null) rs.close();
			if (statement != null) statement.close();
			if (connection != null) connection.close();
		} catch (Exception e) {
			// TODO: handle exception
			e.fillInStackTrace();
		}
	}
	
	/**
	 * 
	 * @param sql
	 * @param objects
	 */
	public static void update(String sql, Object...objects) {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		try {
			statement = (PreparedStatement) connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				statement.setObject(i + 1, objects[i]);
			}
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeConnection(connection, statement, null);
		}
	}
	
	/**
	 * 
	 * @param sql
	 * @param objects
	 * @return
	 */
	public static List<Map<String, Object>> queryForList(String sql, Object...objects) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		try {
			statement = connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				statement.setObject(i+1, objects[i]);
			}
			
			rs = statement.executeQuery();
			while (rs.next()) {
				ResultSetMetaData resultSetMetaData = rs.getMetaData();
				int count = resultSetMetaData.getColumnCount(); // 获取列数
				Map<String, Object> map = new HashMap<String, Object>();
				for (int i = 0; i < count; i++) {
					map.put(resultSetMetaData.getColumnName(i+1),
							rs.getObject(resultSetMetaData.getColumnName(i + 1)));
				}
				result.add(map);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			closeConnection(connection, statement, rs);
		}
		return result;
	}
	
	public static Map<String, Object> queryForMap(String sql, Object...objects) {
		 Map<String,Object> result = new HashMap<String,Object>();
		    List<Map<String,Object>> list = queryForList(sql, objects);
		    if(list.size() == 0){
		        return null;
		    }
		    result = list.get(0);
		    return result;
	}
	
	@SuppressWarnings("unchecked")
	public static <T>T queryForBean(String sql, Class classz, Object...objects) {
		T obj = null;
		Map<String, Object> map = null;
		Field field = null;
		try {
			obj = (T) classz.newInstance();
			map = queryForMap(sql, objects);
		} catch (InstantiationException | IllegalAccessException e) {
			// TODO: handle exception
			e.printStackTrace();
		} 
		if (map == null)
			return null;
		
		// 遍历Map
		for (String columnName : map.keySet()) {
			Method method = null;
			String propertyName = StringUtils.ColumnToProperty(columnName); // 属性名称
			
			try {
				field = classz.getDeclaredField(propertyName);
			} catch (NoSuchFieldException e) {
				// TODO: handle exception
				e.printStackTrace();
			} catch (SecurityException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			// 获取JavaBean中的字段
			String fieldType = field.toString().split(" ")[1]; // 获取字段的类型
			Object value = map.get(columnName);
			if (value == null)
				continue;
			// 获取set方法
			String setMethodName = "set" + StringUtils.upperCaseFirstCharacter(propertyName);
			try {
				// 获取值的类型
				String valueType = value.getClass().getName();
				
				// 查看类型是否匹配
				if (!fieldType.equalsIgnoreCase(valueType)) {
					//
					if (fieldType.equalsIgnoreCase("java.lang.Integer"))
						value = Integer.parseInt(String.valueOf(value));
					else if (fieldType.equalsIgnoreCase("java.lang.String"))
						value = String.valueOf(value);
					else if(fieldType.equalsIgnoreCase("java.util.Date")) {
						valueType = "java.util.Date";
						String dateStr = String.valueOf(value);
						Timestamp ts = Timestamp.valueOf(dateStr);
						Date date = new Date(ts.getTime());
						value = date;
					}
				}
				// 获取set方法
				method = classz.getDeclaredMethod(setMethodName, Class.forName(fieldType));
				// 执行set方法
				method.invoke(obj, value);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return obj;
	}
}
