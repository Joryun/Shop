package com.shop.dao;

import java.util.List;

import com.shop.model.CategorySecond;
import com.shop.model.Product;

public interface ProductDao extends BaseDao<Product>{
	
	
	public List<Product> findHot();
	
	public List<Product> findNew();
	//根据二级分类查询商品
	public List<Product> findByCategorySecondCsid(Integer csid,Integer page);
	
	//根据一级分类查询商品
	public List<Product> findByCategorySecondCategoryCid(Integer cid,Integer page);

	public Integer CountPageProductFromCategory(Integer cid);
	
	public Integer CountPageProductFromCategorySecond(Integer csid);
	
	public Integer CountProduct();
	
	public Product findOne(Integer pid);
	
	public CategorySecond findOneSecond(Integer csid);
	
	public List<Product> findAll(Integer page);
}