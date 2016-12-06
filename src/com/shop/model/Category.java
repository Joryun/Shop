package com.shop.model;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

@Table(name = "category")
@Entity
public class Category implements Serializable {

	private static final long serialVersionUID = 1L;

	@GeneratedValue(strategy = GenerationType.AUTO)
	@Id
	private Integer cid;
	private String cname;
	private float discount;
	private Date privilegeTime; // 优惠时间

	// 一级分类中存放二级分类的集合:
	@OrderBy(value = "csid")
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "category")
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();

	// ticket 外键
	@OneToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER, mappedBy = "category")
	private Ticket ticket;


	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}

	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}

	public Date getPrivilegeTime() {
		return privilegeTime;
	}

	public void setPrivilegeTime(Date privilegeTime) {
		this.privilegeTime = privilegeTime;
	}


	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}
}