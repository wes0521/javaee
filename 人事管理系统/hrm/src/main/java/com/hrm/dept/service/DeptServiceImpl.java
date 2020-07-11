package com.hrm.dept.service;

import com.hrm.commons.beans.Dept;
import com.hrm.dept.dao.IDeptDao;
import com.hrm.utils.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl implements IDeptService {

    @Autowired(required = false)
    private IDeptDao deptDao;

    @Override
    public List<Dept> findDept(String name, PageModel pageModel) {
        return deptDao.selectDept(name,pageModel);
    }

    @Override
    public int findDeptCount(String name) {
        return deptDao.selectDeptCount(name);
    }

    @Override
    public Dept findDeptById(Integer id) {
        return deptDao.selectDeptById(id);
    }

    @Override
    public int modifyDept(Dept dept) {
        return deptDao.updateDept(dept);
    }

    @Override
    public int removeDept(Integer[] ids) {
        return deptDao.deleteDept(ids);
    }

    @Override
    public int addDept(Dept dept) {
        return deptDao.insertDept(dept);
    }
}
