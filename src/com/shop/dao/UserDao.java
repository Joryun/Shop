package com.shop.dao;

import com.shop.model.User;

import java.util.List;

public interface UserDao extends BaseDao<User> {

	// 根据用户名查询用户
	public User findByUsername(String userName);

	// 根据用户名和密码查询用户
	public User findByUsernameAndPassword(String username, String password);

	// 根据激活码查询用户
	public User findByCode(String code);

	// 查询有多少个用户
	public Integer countUser();

	// 分页查找所有用户
	public List<User> findAll(Integer page);

	// 查找单个用户
	public User findOne(Integer uid);

}
