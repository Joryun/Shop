package com.shop.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.UserDao;
import com.shop.model.User;
import com.shop.service.UserService;
import com.shop.utils.MailUitls;
import com.shop.utils.UUIDUtils;
@Transactional
@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao userDao;
	
	public User active(String code) {
		return userDao.findByCode(code);
	}
	
	public User findUserByUsernameAndPassword(User user) {
		return userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
	}
	
	public User existUser(String userName) {
		return userDao.findByUsername(userName);
	}

	public void register(User user) {
		user.setState(1);
		String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
		//发送激活邮件
		MailUitls.sendMail(user.getEmail(), code);
	}

	public void update(User user) {
		userDao.update(user);
		
	}

	public User findByUid(Integer uid) {
		return userDao.findOne(uid);
	}

}