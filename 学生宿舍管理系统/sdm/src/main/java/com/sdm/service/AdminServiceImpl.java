package com.sdm.service;

import com.sdm.commons.beans.User;
import com.sdm.dao.IAdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
@Service
public class AdminServiceImpl implements IAdminService{

    @Autowired
    private IAdminDao adminDao;

    @Override
    public int addAdmin(User user) {
        return adminDao.insertAdmin(user);
    }
    @Override
    public int modify(User user) {
        return adminDao.update(user);
    }

    @Override
    public User findAdminById(int id) {
        return adminDao.findAdminById(id);
    }

}
