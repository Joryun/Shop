package com.shop.service;

import com.shop.model.User;

public interface UserService {

    /**
     *
     * @param code
     * @return
     */
    public User active(String code);

    /**
     * 通过用户名、密码查找用户
     * @param user
     * @return
     */
    public User findUserByUsernameAndPassword(User user);

    /**
     * 根据用户名判断用户是否存在
     * @param userName
     * @return
     */
    public User existUser(String userName);

    /**
     * 注册用户
     *
     * @param user
     */
    public void register(User user);

    /**
     *
     * @param user
     */
    public void update(User user);

    /**
     * 根据用户uid的值查询用户
     *
     * @param uid
     * @return
     */
    public User findByUid(Integer uid);
}