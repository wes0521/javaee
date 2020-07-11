package com.sdm.dao;

import com.sdm.commons.beans.User;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IAdminDao {

    int insertAdmin(User user);

    int update(User user);

    User findAdminById(int id);

}
