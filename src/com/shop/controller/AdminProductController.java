package com.shop.controller;

import com.shop.model.Admin;
import com.shop.model.CategorySecond;
import com.shop.model.Product;
import com.shop.service.AdminCategorySecondService;
import com.shop.service.AdminProductService;
import com.shop.service.AdminService;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class AdminProductController {

    @Resource
    private AdminProductService adminProductService;
    @Resource
    private AdminCategorySecondService adminCategorySecondService;
    @Resource
    private AdminService adminService;

    //更新商品
    @RequestMapping(value = "/updateProduct")
    public ModelAndView updateProduct(@ModelAttribute("product") Product product
            , @RequestParam("upload") CommonsMultipartFile upload, HttpServletRequest request, Integer csid) {
        ServletContext servletContext = request.getSession().getServletContext();
        //查询该商品
        Product oldProduct = adminProductService.findProduct(product.getPid());
        //从字符串截出该图片的名称
        int begin = oldProduct.getImage().lastIndexOf("/");
        String filename = oldProduct.getImage().substring(begin + 1, oldProduct.getImage().length());
        System.out.println(filename);
        //获取文件的名称
        String uploadFilename = upload.getOriginalFilename();
        //如果上传的图片的名称和旧的照片不一致
        if (filename != uploadFilename && !"".equals(uploadFilename)) {
            //获取文件保存目录
            String path = servletContext.getRealPath("/products/3");
            try {
                FileUtils.writeByteArrayToFile(new File(path, uploadFilename), upload.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
            //重新设置文件的路径
            product.setImage("products/3/" + uploadFilename);
            //更新商品的时间
            product.setPdate(new Date());
            //删除旧的商品图片
            path = request.getSession().getServletContext().getRealPath("/" + oldProduct.getImage());
            File file = new File(path);
            file.delete();
        } else {
            product.setPdate(new Date());
        }
        //更新商品
        if (csid != null) {
            //该商品所属的二级分类
            CategorySecond categorySecond = adminCategorySecondService.findCategorySecond(csid);
            product.setCategorySecond(categorySecond);
        }
        adminProductService.updateProduct(product);
        ModelAndView modelAndView = new ModelAndView("redirect:/listProduct/1");
        return modelAndView;
    }

    //修改商品
    @RequestMapping(value = "/editProduct/{pid}")
    public ModelAndView editProduct(@PathVariable("pid") Integer pid) {
        ModelAndView modelAndView = new ModelAndView("admin/product/edit");
        //获取管理员信息
        Admin admin = adminService.findAdminByAid(1);
        //查询所有二级分类的集合
        List<CategorySecond> categorySeconds = adminCategorySecondService.listCategorySecond();
        modelAndView.addObject("categorySeconds", categorySeconds);
        //查询商品
        Product product = adminProductService.findProduct(pid);
        modelAndView.addObject("admin", admin);
        modelAndView.addObject("product", product);
        return modelAndView;
    }

    //删除商品
    @RequestMapping(value = "/deleteProduct/{pid}")
    public ModelAndView deleteProduct(@PathVariable("pid") Integer pid, HttpServletRequest request) {
        //获取该商品的对象
        Product product = adminProductService.findProduct(pid);
        //获取文件保存目录
        String path = request.getSession().getServletContext().getRealPath("/" + product.getImage());
        File file = new File(path);
        // 删除商品服务器上的图片:
        file.delete();
        //删除商品在数据库中的记录
        adminProductService.deleteProduct(product);
        ModelAndView modelAndView = new ModelAndView("redirect:/listProduct/1");
        return modelAndView;
    }

    //上传商品
    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public ModelAndView addProduct(@ModelAttribute("product") Product product,
                                   @RequestParam("upload") CommonsMultipartFile upload, HttpServletRequest request,
                                   Integer csid) {
        //获取文件保存目录
        ServletContext servletContext = request.getSession().getServletContext();
        String path = servletContext.getRealPath("/products/3");
        //获取文件的名称
        String filename = upload.getOriginalFilename();
        try {
            FileUtils.writeByteArrayToFile(new File(path, filename), upload.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
        }
        //设置文件的路径
        product.setImage("products/3/" + filename);
        //设置上传的时间
        product.setPdate(new Date());
        //该商品所属的二级分类
        CategorySecond categorySecond = adminCategorySecondService.findCategorySecond(csid);
        product.setCategorySecond(categorySecond);
        //保存商品
        adminProductService.saveProduct(product);
        ModelAndView modelAndView = new ModelAndView("redirect:/listProduct/1");
        return modelAndView;
    }

    //跳转到添加商品
    @RequestMapping(value = "/gotoAddProduct")
    public ModelAndView gotoAddProduct() {
        ModelAndView modelAndView = new ModelAndView("admin/product/add");
        //查询所有二级分类的集合
        List<CategorySecond> categorySeconds = adminCategorySecondService.listCategorySecond();
        modelAndView.addObject("categorySeconds", categorySeconds);
        return modelAndView;
    }

    //分页查询所有的商品
    @RequestMapping(value = "/listProduct/{page}")
    public String listProduct(@PathVariable("page") Integer page, Map<String, Object> map) {
        //分页查询商品
        List<Product> products = adminProductService.listProduct(page);
        //查询商品的页数
        Integer count = adminProductService.countProduct();
        map.put("products", products);
        map.put("page", page);
        map.put("count", count);
        return "admin/product/list";
    }
}
