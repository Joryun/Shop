package com.shop.service.impl;

import com.shop.dao.CategoryDao;
import com.shop.model.Category;
import com.shop.service.CategoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

    @Resource
    private CategoryDao categoryDao;

    public List<Category> getCategory() {
        return categoryDao.findAll();
    }
}
