package com.zxl.web.articles.bean;

import com.zxl.web.articles.annotation.Column;
import com.zxl.web.articles.annotation.Table;

@Table(tableName = "t_user")
public class User {

	@Column(type = "int", field = "id", primaryKey = true, defaultNull = false)
	private Integer id;
	@Column(type = "VARCHAR(20)", field = "username")
	private String username;
	@Column(type = "VARCHAR(20)", field = "password")
	private String password;
	@Column(type = "VARCHAR(60)", field = "headerPic")
	private String headerPic;
	@Column(type = "VARCHAR(60)", field = "email")
	private String email;
	@Column(type = "VARCHAR(2)", field = "sex")
	private String sex;
	@Column(type = "datetime", field = "create_time")
	private String createTime;
	@Column(type = "timestamp", field = "update_time")
	private String updateTime;
	@Column(type = "int(1)", field = "is_delete")
	private Integer isDelete;
	@Column(type = "VARCHAR(200)", field = "address")
	private String address;
	@Column(type = "VARCHAR(15)", field = "telephone")
	private String telephone;
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId() {
		return this.id;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return this.username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return this.password;
	}
	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}
	public String getHeaderPic() {
		return this.headerPic;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	public void setSex(String sex){
		this.sex = sex;
	}
	public String getSex() {
		return this.sex;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateTime() {
		return this.createTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getUpdateTime(String updateTime) {
		return this.updateTime;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getIsDelete() {
		return this.isDelete;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress() {
		return this.address;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getTelephone() {
		return this.telephone;
	}
}
