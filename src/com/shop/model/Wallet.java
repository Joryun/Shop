package com.shop.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Table(name = "wallet")
@Entity
public class Wallet {
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private Integer wid;
	private Float money;
	private Integer uid;

	// 用户的:外键
	@OneToOne(optional=false)
    @JoinColumn(name="uid", unique=true, nullable=false, updatable=false,insertable=false)
	private	User user;
	public Integer getWid() {
		return wid;
	}
	public void setWid(Integer wid) {
		this.wid = wid;
	}
	public Float getMoney() {
		return money;
	}
	public void setMoney(Float money) {
		this.money = money;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString(){
		return "Wallet [wid=" + wid + ", money=" + money + "]";
	}
}
