package com.zxl.web.articles.utils;

import java.lang.reflect.Field;

import com.zxl.web.articles.annotation.Column;
import com.zxl.web.articles.annotation.Table;

public class TableUtils {

	public static String getCreateTableSQL(Class<?> clazz) {
		StringBuilder sb = new StringBuilder();
		sb.append("create tablle ");
		// 获取表名
		Table table = (Table) clazz.getAnnotation(Table.class);
		String tableName = table.tableName();
		sb.append(tableName).append("(\n");
		
		Field[] fields = clazz.getDeclaredFields();
		String primaryKey = "";
		// 遍历所有字段
		for (int i = 0; i < fields.length; i++) {
			Column column = (Column) fields[i].getAnnotations()[0];
			String field = column.field();
			String type = column.type();
			boolean defaultNull = column.defaultNull();
			
			sb.append("\t" + field).append(" ").append(type);
            if(defaultNull){
                if(type.toUpperCase().equals("TIMESTAMP")){
                    sb.append(",\n");
                }else{
                    sb.append(" DEFAULT NULL,\n");
                }
            }else{
                sb.append(" NOT NULL,\n");
                if(column.primaryKey()){
                    primaryKey = "PRIMARY KEY ("+field+")";
                }
            }
		}
		
		if (!StringUtils.isEmpty(primaryKey)) {
			sb.append("\t").append(primaryKey);
		}
		sb.append("\n) DEFAULT CHARSET=utf8");
		
		return sb.toString();
	}
}
