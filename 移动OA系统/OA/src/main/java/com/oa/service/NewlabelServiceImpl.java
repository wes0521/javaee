package com.oa.service;

import com.oa.commons.beans.Newlabel;
import com.oa.commons.vo.Page;
import com.oa.dao.INewlabelDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewlabelServiceImpl implements INewlabelService{

    @Autowired
    private INewlabelDao newlabelDao;


    @Override
    public Page<Newlabel> findCurrentPage(int pagenum) {
        Page<Newlabel> page = new Page<>();
        page.setPagenum(pagenum);
        int totalRows = newlabelDao.selectAllCount();
        page.setTotalRows(totalRows);
        List<Newlabel> data = newlabelDao.selectCurrentPageNewslabels(page);
        page.setDatas(data);
        return page;
    }

    @Override
    public Page<Newlabel> findCurrentPage01(int pid,int pagenum) {
        Page<Newlabel> page1 = new Page<>();
        page1.setPagenum(pagenum);
        int totalRows = newlabelDao.selectPartAll(pid);
        page1.setTotalRows(totalRows);
        List<Newlabel> data1 = newlabelDao.selectCurrentPageNewslabels1(pid,page1);
        page1.setDatas(data1);
        return page1;
    }

    @Override
    public int modifyNewLabel(Newlabel newlabel) {
//        Newlabel newlabel = newlabelDao.selectById(id);
//        newlabel.setId(id);
        System.out.println("modifynewlabel"+newlabel);
        return newlabelDao.updateNewLabel(newlabel);
    }

    @Override
    public int addNewLabel(Newlabel newlabel) {
        return newlabelDao.insertNewLabel(newlabel);
    }

    @Override
    public List<String> findlabels() {
        return newlabelDao.selectlabels();
    }

    @Override
    public int findParentId(String label_name) {
        return newlabelDao.selectfindParentId(label_name);
    }

    @Override
    public Newlabel findlabelInfo(String labelName) {
        return newlabelDao.selectlabelInfo(labelName);
    }

    @Override
    public Newlabel findById(int id) {
        return newlabelDao.selectLableById(id);
    }

    @Override
    public List<Newlabel> findlabelChildren(int id) {
        return newlabelDao.selectlabelChildren(id);
    }

    @Override
    public int removeNewLabel(int id) {
        return newlabelDao.deleteNewLabel(id);
    }

}
