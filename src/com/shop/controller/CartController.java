package com.shop.controller;

import com.shop.model.*;
import com.shop.service.PacketService;
import com.shop.service.ProductService;
import com.shop.service.TicketService;
import com.shop.service.UserService;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Date;
import java.util.Map;

@Controller
public class CartController {
    @Resource
    private ProductService productService;
    private UserService userService;
    private PacketService packetService;
    private TicketService ticketService;

    //首页上跳转至购物车
    @RequestMapping("/myCart")
    public String myCart() {
        return "cart";
    }

    //清空购物车
    @RequestMapping(value = "/clearCart")
    public String clearCart(HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        cart.clearCart();
        return "cart";
    }

    //删除购物车中的商品
    @RequestMapping(value = "/removeCart/{pid}")
    public String removeCart(@PathVariable("pid") Integer pid, HttpSession session) {
        //获得购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        //根据商品的pid从购物车中移除商品
        cart.removeCart(pid);
        return "cart";
    }
    
    //修改购物车优惠后的价格
 	@RequestMapping(value="/ChangeTotal/{total}",method=RequestMethod.POST)
 	@ResponseBody
 	public String changeCart(@PathVariable("total") float total, HttpSession session) {
 	//	System.out.println(total);
 		 //获得购物车对象
        Cart cart = (Cart) session.getAttribute("cart");
        cart.setTotal(total);
        session.setAttribute("cart", cart);
 		return null;
 	}
 	
    //添加到购物车
    @RequestMapping(value = "/addCart")
    public String addCart(Integer pid, Integer count, HttpSession session, Map<String, Object> map) {


//		System.out.println("pid:"+ pid);
        Product product = productService.findByPid(pid);
//        System.out.println(product.getShop_price());

        CategorySecond categorySecond = product.getCategorySecond();
        Category category = categorySecond.getCategory();

        Date privilege = category.getPrivilegeTime();
        String privilegeTime = privilege.toString().substring(0, 10);	//截取category表中privilegeTime字段的年月日
        map.put("privilegeTime", privilegeTime);    //put privilegeTime

//        System.out.println(category.getCid());


//        Ticket ticket = ticketService.findTicketByCid(1);
        Ticket ticket = category.getTicket();

        map.put("ticket", ticket);  //put ticket对象

        map.put("count", count);    //put count

        Float finalPrice = Float.valueOf(((String) session.getAttribute("price")).replace(",", ""));

//        System.out.println(finalPrice);


//        User user = (User) session.getAttribute("user");

        CartItem cartItem = new CartItem();
        cartItem.setCount(count);
        cartItem.setProduct(product);

        cartItem.setPrice(finalPrice);

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        // 将购物项添加到购物车.
        cart.addCart(cartItem);
        return "cart";
    }

}
