package com.shop.dao;

import java.util.Date;
import java.util.List;

import com.shop.model.Category;

public interface CategoryDao extends BaseDao<Category> {
	// 查询一级分类的总的个数
	public Integer countCategory();

	// 分页查找所有用户
	public List<Category> findAll(Integer page);

	public List<Category> findAll();

	public Category findOne(Integer cid);
	
	//查询优惠时间
	public Date queryPrivilegeTime(Integer cid);
}
