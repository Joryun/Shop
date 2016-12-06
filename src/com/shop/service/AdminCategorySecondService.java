package com.shop.service;

import java.util.List;

import com.shop.model.CategorySecond;


public interface AdminCategorySecondService {
	
	public List<CategorySecond> listCategorySecond(Integer page);

	//统计二级分类的个数
	public Integer countCategorySecond();
	
	//保存二级分类
	public void addCategorySecond(CategorySecond categorySecond); 

	//删除二级分类
	public void deleteCategorySecond(Integer csid); 

	//查找具体某个二级分类
	public CategorySecond findCategorySecond(Integer csid); 

	//更新二级分类
	public void updateCategorySecond(CategorySecond categorySecond);
	
	//查找所有的二级分类
	public List<CategorySecond> listCategorySecond();
}
