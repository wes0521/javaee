package com.bookstore.client.products.handler;

import com.bookstore.client.products.service.IProductService;
import com.bookstore.commons.beans.Notice;
import com.bookstore.commons.beans.Product;
import com.bookstore.utils.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/client/product")
public class ProductHandler {

    @Autowired
    IProductService productService;

    //按类别查询商品
    @RequestMapping("/findProductByCategory")
    public String findProductByCategory(@RequestParam(defaultValue = "1") int pageIndex, String category, Model model){

        PageModel pageModel = new PageModel();
        pageModel.setPageIndex(pageIndex);
        int recordCount = productService.findProductCountByCategory(category);
        pageModel.setRecordCount(recordCount);
        List<Product> products = productService.findProductByCategory(category,pageModel);
        /*for (Product p:products){
            System.out.println(p);
        }*/
        model.addAttribute("products",products);
        model.addAttribute("category",category);
        model.addAttribute("pageModel",pageModel);
        return "/client/product_list.jsp";
    }

    //按书名查询商品
    @RequestMapping("/findProductByName")
    public String findProductByName(@RequestParam(defaultValue = "1") int pageIndex,String name,Model model){
        System.out.println("查询的书名是："+name);
        PageModel pageModel = new PageModel();
        pageModel.setPageIndex(pageIndex);
        int recordCount = productService.findProductCountByName(name);
        pageModel.setRecordCount(recordCount);
        List<Product> products = productService.findProductByName(name,pageModel);
        /*for (Product p:products){
            System.out.println(p);
        }*/
        model.addAttribute("pageModel",pageModel);
        model.addAttribute("products",products);
        model.addAttribute("name",name);
        return "/client/product_search_list.jsp";
    }

    //通过id查询图书的详细信息
    @RequestMapping("/findProductById")
    public String findProductById(String id,Model model){
        Product product = productService.findProductById(id);
        model.addAttribute("p",product);
        return "/client/info.jsp";
    }

    //首页查询公告，本周热卖
    @RequestMapping("/showIndex")
    public String showIndex(Model model){
        //System.out.println("--首页信息--");
        Notice notice = productService.findNoticeRecent();
        List<Product> products = productService.findWeekHotProduct();
        model.addAttribute("n",notice);
        model.addAttribute("products",products);
        return "/client/index.jsp";
    }
}
