package com.shop.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.shop.dao.AdminDao;
import com.shop.model.Admin;

@Repository("adminDao")
@SuppressWarnings("all")
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao{

	public Admin findByAdminnameAndPassword(String username, String password) {
		String hql = "from Admin a where a.username = ? and a.password = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, password);
		return (Admin)query.uniqueResult(); 
	}
   public Admin findOne(Integer uid) {
		String hql="from Admin where uid=?";
		Query query=this.getCurrentSession().createQuery(hql);
		query.setParameter(0, uid);
		return (Admin)query.uniqueResult();
	}
}
