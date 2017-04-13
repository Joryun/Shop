package com.shop.service;

import com.shop.model.Order;

import java.util.List;

public interface AdminOrderService {

    //查询某个具体的订单
    public Order findOrder(Integer oid);

    //保存和更新订单
    public void saveOrUpdateOrder(Order order);

    //删除该订单
    public void deleteOrder(Order order);

    //分页查询所有的订单
    public List<Order> listOrder(Integer page, Integer rows);

    //查询总共有多少页的订单
    public Integer countOrder();

}
