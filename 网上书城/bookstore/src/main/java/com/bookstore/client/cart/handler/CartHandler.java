package com.bookstore.client.cart.handler;


import com.bookstore.client.products.service.IProductService;
import com.bookstore.commons.beans.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/client/cart")
public class CartHandler {

    @Autowired
    IProductService productService;

    //添加购物车
    @RequestMapping("/addCart")
    public String addCart(String id, HttpSession session){
        //商品id为传入 参数的商品加入购物车
        //购物车保存到session，购物车使用的数据类型为map
        //map中商品为关键字，购买的数量为值
        Product product = productService.findProductById(id);
        //System.out.println(productService);
        //从session中获取购物车cart
        Map<Product,Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        if (cart == null){//如果session不存在cart,则新建购物车
            //创建购物车
            cart = new HashMap<Product,Integer>();
        }
        //map.put方法是有返回值的：当key重复时，put方法返回的是原来value的值
        //这里的count就是原来商品的数量
        Integer count = cart.put(product,1);
        //如果count为null说明购物车中没有该商品，if不执行，购物车中的商品数量就为1
        //如果count不为null说明购物车中原来就有该商品，数量在原来的基础上加1
        if (count != null){
            cart.put(product,count+1);
            //如果加1后大于商品库存，那么商品数量设置为商品库存
            if ((count + 1) > product.getPnum()){
                cart.put(product,count);
            }
        }
        session.setAttribute("cart",cart);
        return "/client/cart.jsp";
    }

    //改变购物车商品数量
    @RequestMapping("/changeCart")
    public String changeCart(String id,Integer count,HttpSession session){
        //获取改变数量的商品信息
        Product product = productService.findProductById(id);
        //从session中获取购物车的原始数据
        Map<Product,Integer> cart = (Map<Product, Integer>) session.getAttribute("cart");
        //如果改变后的商品数量为0，从购物车商品删除该商品信息
        if (count == 0){
            cart.remove(product);
        }else {
            cart.put(product,count);
        }
        return "/client/cart.jsp";
    }

}
