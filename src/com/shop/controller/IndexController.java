package com.shop.controller;

import com.shop.service.CategoryService;
import com.shop.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class IndexController {
	@Resource
	private CategoryService categoryService;
	
	@Resource
	private ProductService productService;
	
	//商品首页的action
	@RequestMapping(value="/index")
	public String showIndex(Map<String,Object> map,HttpSession session){
		//把所有的一级分类都存入到session中
		session.setAttribute("cList", categoryService.getCategory());
		//把最新的10条商品存放到map集合中
		map.put("nList", productService.findNew());
		//把最热的10条商品添加到map集合中
		map.put("hList", productService.findHot());
		
		return "index"; 
	}
}
