package com.bookstore.client.user.dao;

import com.bookstore.commons.beans.Order;
import com.bookstore.commons.beans.OrderItem;
import com.bookstore.commons.beans.User;

import java.util.List;

public interface IUserDao {

    int insertUser(User user);

    int activeUser(String activeCode);

    User selectEmail(String email);

    User selectUsername(String username);

    User selectUserByLogin(User user);

    int updateUser(User user);

    List<Order> selectOrderByUser(Integer id);

    List<OrderItem> selectOrderItemById(String id);

    void deleteOrderById(String id);

    void deleteOrderItemById(String id);

    void updateProdoctnum(OrderItem item);
}
