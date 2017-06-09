package com.shop.dao;

import com.shop.model.CategorySecond;
import com.shop.model.Product;

import java.util.List;

public interface ProductDao extends BaseDao<Product> {

    /**
     * 查找最热的十个商品
     *
     * @return
     */
    public List<Product> findHot();

    /**
     * 查找最新的十个商品
     *
     * @return
     */
    public List<Product> findNew();

    /**
     * 根据二级分类查询商品
     *
     * @param csid
     * @param page
     * @return
     */
    public List<Product> findByCategorySecondCsid(Integer csid, Integer page);

    /**
     * 根据一级分类查询商品
     *
     * @param cid
     * @param page
     * @return
     */
    public List<Product> findByCategorySecondCategoryCid(Integer cid, Integer page);

    public Integer CountPageProductFromCategory(Integer cid);

    public Integer CountPageProductFromCategorySecond(Integer csid);

    public Integer CountProduct();

    public Product findOne(Integer pid);

    public CategorySecond findOneSecond(Integer csid);

    public List<Product> findAll(Integer page);
}