package com.bookstore.admin.orders.service;

import com.bookstore.admin.orders.dao.IOrdersDao;
import com.bookstore.commons.beans.Order;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrdersServiceImpl implements IOrdersService {

    @Resource
    IOrdersDao ordersDao;

    @Override
    public List<Order> findOrders() {
        return ordersDao.selectOrders();
    }

    @Override
    public List<Order> findOrderByManyCondition(Order order) {
        return ordersDao.selectOrderByManyCondition(order);
    }

    @Override
    public int delOrderById(String id) {
        return ordersDao.deleteOrderById(id);
    }
}
