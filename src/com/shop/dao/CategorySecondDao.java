package com.shop.dao;

import java.util.List;

import com.shop.model.CategorySecond;

public interface CategorySecondDao extends BaseDao<CategorySecond>{
	
	//查询二级分类的总的个数
	public Integer countCategorySecond();
	//分页查找所有用户
	public List<CategorySecond> findAll(Integer page);
	
	public List<CategorySecond> findAll();
	
	public CategorySecond findOne(Integer cid);
	
}
