package com.shop.dao;

import com.shop.model.User;

import java.util.List;

public interface UserDao extends BaseDao<User> {

    /**
     * 根据用户名查询用户
     *
     * @param userName
     * @return
     */
    public User findByUsername(String userName);

    /**
     * 根据用户名和密码查询用户
     *
     * @param username
     * @param password
     * @return
     */
    public User findByUsernameAndPassword(String username, String password);

    /**
     * 根据激活码查询用户
     *
     * @param code
     * @return
     */
    public User findByCode(String code);

    /**
     * 查询有多少个用户
     *
     * @return
     */
    public Integer countUser();

    /**
     * 分页查找所有用户
     *
     * @param page
     * @return
     */
    public List<User> findAll(Integer page);

    /**
     * 查找单个用户
     *
     * @param uid
     * @return
     */
    public User findOne(Integer uid);

}
