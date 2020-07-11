package com.bookstore.admin.orders.dao;

import com.bookstore.commons.beans.Order;

import java.util.List;

public interface IOrdersDao {
    List<Order> selectOrders();

    List<Order> selectOrderByManyCondition(Order order);

    int deleteOrderById(String id);
}
