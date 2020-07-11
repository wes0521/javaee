package com.bookstore.client.order.service;

import com.bookstore.client.order.dao.IOrderDao;
import com.bookstore.commons.beans.Order;
import com.bookstore.commons.beans.OrderItem;
import com.bookstore.commons.beans.Product;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service
public class OrderServiceImpl implements IOrderService{

    @Resource
    private IOrderDao orderDao;

    @Override
    public void createOrder(Order order, Map<Product, Integer> cart) {
        //循环插入该订单对应的订单项信息,并修改商品的库存
        for (Product p:cart.keySet()){
            OrderItem item = new OrderItem();
            item.setOrder(order);
            item.setProduct(p);
            item.setBuynum(cart.get(p));
            //插入订单项
            orderDao.insertOrderItem(item);
            //修改商品的库存
            orderDao.updateProductnum(item);
        }

        /*if (1==1){
            int a = 1/0;
        }*/

        //插入订单orders对应的信息
        orderDao.insertOrder(order);
    }

    @Override
    public void paySuccess(String order_id) {
        orderDao.updatePaystate(order_id);
    }

}
