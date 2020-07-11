package com.bookstore.admin.orders.handler;

import com.bookstore.admin.orders.service.IOrdersService;
import com.bookstore.client.user.service.IUserService;
import com.bookstore.commons.beans.Order;
import com.bookstore.commons.beans.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/orders")
public class OrdersHandler {

    @Autowired
    private IOrdersService ordersService;

    @Autowired
    IUserService userService;

    //查询全部订单
    @RequestMapping("/findOrders")
    public String findOrders(Model model){
        List<Order> orders = ordersService.findOrders();
        for (Order o:orders){
            System.out.println(o);
        }
        model.addAttribute("orders",orders);
        return "/admin/orders/list.jsp";
    }

    //查询订单详细信息
    @RequestMapping("/findOrderById")
    public String findOrderById(String id,Model model){
        List<OrderItem> items = userService.findOrderItemById(id);
        for (OrderItem oi:items){
            System.out.println(oi);
        }
        model.addAttribute("items",items);
        return "/admin/orders/view.jsp";
    }

    //按条件查询订单
    @RequestMapping("/findOrderByManyCondition")
    public String findOrderByManyCondition(Order order,Model model){
        System.out.println("订单编号："+order.getId() + "  ,收件人："+order.getReceiverName());
        List<Order> orders = ordersService.findOrderByManyCondition(order);
        for (Order oi:orders){
            System.out.println(oi);
        }
        model.addAttribute("id",order.getId());
        model.addAttribute("receiverName",order.getReceiverName());
        model.addAttribute("orders",orders);
        return "/admin/orders/list.jsp";
    }

    //删除已支付的订单
    @RequestMapping("/delOrderById")
    public String delOrderById(String id,Model model){
        int rows = ordersService.delOrderById(id);
        if (rows > 0){
            System.out.println("订单删除成功");
            return "redirect:/admin/orders/findOrders";
        }
        else {
            System.out.println("订单删除失败");
            model.addAttribute("error","订单删除失败,请稍后重试");
            return "/admin/orders/error.jsp";
        }
    }
}
