package com.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="adminuser")
@Entity
public class Admin {
	
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Id
	private Integer uid;
	private String username;
	private String password;
	private Integer minventory;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getMinventory() {
		return minventory;
	}
	public void setMinventory(Integer minventory) {
		this.minventory = minventory;
	}
	
}
