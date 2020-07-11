package com.bookstore.admin.orders.service;

import com.bookstore.commons.beans.Order;

import java.util.List;

public interface IOrdersService {
    List<Order> findOrders();

    List<Order> findOrderByManyCondition(Order order);

    int delOrderById(String id);
}
