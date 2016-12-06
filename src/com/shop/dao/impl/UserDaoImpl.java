package com.shop.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.shop.dao.UserDao;
import com.shop.model.User;

@Repository("userDao")
@SuppressWarnings("all")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	public Integer countUser() {
		String hql = "select count(*) from User";
		return count(hql);
	}

	public User findByCode(String code) {
		String hql = "from User u where u.code = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, code);
		return (User)query.uniqueResult(); 
	}

	public User findByUsername(String userName) {
		String hql = "from User u where u.username = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, userName);
		return (User)query.uniqueResult(); 
	}

	public User findByUsernameAndPassword(String username, String password) {
		String hql = "from User u where u.username = ? and u.password = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, password);
		return (User)query.uniqueResult(); 
	}

	public List<User> findAll(Integer page) {
		String hql = "from User";
		int rows = 20;
		int page1 = page;
		return find(hql, page1, rows);
	}

	public User findOne(Integer uid) {
		String hql = "from User u where u.uid = ?";
		Query query = this.getCurrentSession().createQuery(hql);
		query.setParameter(0, uid);
		return (User)query.uniqueResult(); 
	}

}
