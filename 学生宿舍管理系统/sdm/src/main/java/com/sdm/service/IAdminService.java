package com.sdm.service;

import com.sdm.commons.beans.User;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IAdminService {

    int addAdmin(User user);

    int modify(User user);

    User findAdminById(int id);
}
