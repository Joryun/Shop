package com.shop.service;

import com.shop.model.Admin;
import com.shop.model.User;

import java.util.List;

public interface AdminService {

    public void updateUser(User user);

    public Admin checkUser(Admin admin);

    public void deleteUser(Integer uid);

    // 查询所有的用户
    public List<User> findUser(Integer page);

    // 统计有多少页的用户
    public Integer countUser();

    // 根据用户的uid查询用户信息
    public User findUserByUid(Integer uid);

    //根据管理员id查询管理员的信息
    public Admin findAdminByAid(Integer aid);
}
