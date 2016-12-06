package com.shop.dao;

import com.shop.model.Admin;

public interface AdminDao extends BaseDao<Admin>{
	public Admin findByAdminnameAndPassword(String username,String password);
        public Admin findOne(Integer aid);
}
