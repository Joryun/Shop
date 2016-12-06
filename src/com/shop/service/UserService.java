package com.shop.service;


import com.shop.model.User;

public interface UserService {
	
	public User active(String code);
	
	public User findUserByUsernameAndPassword(User user);
	
	public User existUser(String userName);
	
	public void register(User user);
	
	public void update(User user);

	// 根据用户的uid的值查询用户
	public User findByUid(Integer uid);
}