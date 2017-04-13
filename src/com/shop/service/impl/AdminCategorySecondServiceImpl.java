package com.shop.service.impl;

import com.shop.dao.CategorySecondDao;
import com.shop.model.CategorySecond;
import com.shop.service.AdminCategorySecondService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service("adminCategorySecondService")
public class AdminCategorySecondServiceImpl implements AdminCategorySecondService {

    @Resource
    private CategorySecondDao categorySecondDao;

    public void addCategorySecond(CategorySecond categorySecond) {
        categorySecondDao.save(categorySecond);
    }

    public void deleteCategorySecond(Integer csid) {
        categorySecondDao.delete(csid);
    }

    public void updateCategorySecond(CategorySecond categorySecond) {
        categorySecondDao.update(categorySecond);
    }

    public Integer countCategorySecond() {
        Integer count = categorySecondDao.countCategorySecond();
        return (count % 15 == 0 ? (count / 15) : (count / 15 + 1));
    }


    public CategorySecond findCategorySecond(Integer csid) {
        return categorySecondDao.findOne(csid);
    }

    public List<CategorySecond> listCategorySecond(Integer page) {
        return categorySecondDao.findAll(page);
    }

    public List<CategorySecond> listCategorySecond() {
        return categorySecondDao.findAll();
    }

}
