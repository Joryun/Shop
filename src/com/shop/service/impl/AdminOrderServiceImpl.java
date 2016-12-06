package com.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.OrderDao;
import com.shop.model.Order;
import com.shop.service.AdminOrderService;

@Transactional
@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{
	
	@Resource
	private OrderDao orderDao;
	
	public Integer countOrder() {
		Integer count = orderDao.findCount();
		return (count % 10 == 0 ? (count / 10) :( count / 10 + 1));
	}

	public Order findOrder(Integer oid) {
		return orderDao.findByOid(oid);
	}

	public List<Order> listOrder(Integer page,Integer rows) {
		return orderDao.findByPage(page, rows);
	}

	public void saveOrUpdateOrder(Order order) {
		orderDao.saveOrUpdate(order);
	}

	public void deleteOrder(Order order) {
		orderDao.delete(order);
	}

}
