package com.shop.controller;

import com.shop.model.Order;
import com.shop.model.OrderItem;
import com.shop.service.AdminOrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;


@Controller
public class AdminOrderController {

    @Resource
    private AdminOrderService adminOrderService;

    @RequestMapping(value = "/findOrderItem/{oid}/{time}")
    public String findOrderItem(@PathVariable("oid") Integer oid, Map<String, Object> map,
                                HttpServletResponse response) throws IOException {
        Order order = adminOrderService.findOrder(oid);
        Set<OrderItem> orderItem = order.getOrderItems();
        map.put("orderItem", orderItem);
        return "admin/order/orderItem";
    }

    //发货操作
    @RequestMapping(value = "/updateStateOrder/{oid}/{page}")
    public ModelAndView updateStateOrder(@PathVariable("oid") Integer oid, @PathVariable("page") Integer page) {
        ModelAndView modelAndView = new ModelAndView("redirect:/listOrder/" + page);
        Order order = adminOrderService.findOrder(oid);
        order.setState(3);
        adminOrderService.saveOrUpdateOrder(order);
        return modelAndView;
    }

    //查询订单
    @RequestMapping(value = "/listOrder/{page}")
    public ModelAndView listOrder(@PathVariable("page") Integer page) {
        ModelAndView modelAndView = new ModelAndView("admin/order/list");
        //分页查找所有的订单
        List<Order> orders = adminOrderService.listOrder(page, 5);
        modelAndView.addObject("orders", orders);
        //保存当前的页数
        modelAndView.addObject("page", page);
        //查询总共有多少页的数据
        Integer count = adminOrderService.countOrder();
        modelAndView.addObject("count", count);
        return modelAndView;
    }

    //删除商品
    @RequestMapping(value = "/deleteOrder/{oid}")
    public ModelAndView deleteProduct(@PathVariable("oid") Integer oid, HttpServletRequest request) {
        //获取该订单的对象
        Order order = adminOrderService.findOrder(oid);
        //获取文件保存目录
        //删除商品在数据库中的记录
        adminOrderService.deleteOrder(order);
        ModelAndView modelAndView = new ModelAndView("redirect:/listOrder/1");
        return modelAndView;
    }
}
