package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.CategoryDao;
import com.shop.model.Category;
import com.shop.service.CategoryService;

@Transactional
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService{
	
	@Resource
	private CategoryDao categoryDao;
	
	public List<Category> getCategory() {
		return categoryDao.findAll();
	}
}
