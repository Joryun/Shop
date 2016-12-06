package com.shop.dao.impl;


import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.dao.BaseDao;

@Repository("baseDao")
@SuppressWarnings("all")
public class BaseDaoImpl<T> implements BaseDao<T> {
	
	
	private SessionFactory sessionFactory;
	private Class<T> clz;
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}
	
	private Class<T> getClz() {
		if(clz==null) {
			//获取泛型的Class对象
			clz = ((Class<T>)
					(((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0]));
		}
		return clz;
	}
	
	public Serializable save(T o) {
		
		return this.getCurrentSession().save(o);
	}

	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);	
	}

	public void update(T o) {
		this.getCurrentSession().update(o);
	}
	
	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}
	
	public void delete(Serializable id) {
		T o = this.get(id);
		this.getCurrentSession().delete(o);
	}
	
	public T get(Serializable id) {
		return (T) this.getCurrentSession().get(getClz(), id);
	}
	
	public List<T> find(String hql) {
		Query q = this.getCurrentSession().createQuery(hql);
		return q.list();
	}

	public List<T> find(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, Map<String, Object> params, int page, int rows) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public List<T> find(String hql, int page, int rows) {
		Query q = this.getCurrentSession().createQuery(hql);
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public Integer count(String hql) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		List cc = q.list();
		Long a = (Long) cc.get(0);
		return a.intValue();
	}
	
	public Integer count(String hql,Integer id) {
		Query q = sessionFactory.getCurrentSession().createQuery(hql);
		q.setParameter(0, id);
		List cc = q.list();
		Long a = (Long) cc.get(0);
		return a.intValue();
	}
	
	public Integer count(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return (Integer) q.uniqueResult();
	}

	public int executeHql(String hql) {
		Query q = this.getCurrentSession().createQuery(hql);
		return q.executeUpdate();
	}

	public int executeHql(String hql, Map<String, Object> params) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				q.setParameter(key, params.get(key));
			}
		}
		return q.executeUpdate();
	}

	public Integer findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return null;
	}

	public Integer findTicketByCid(Integer cid) {
		// TODO Auto-generated method stub
		return null;
	}
}