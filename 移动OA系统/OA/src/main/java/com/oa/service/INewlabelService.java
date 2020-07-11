package com.oa.service;

import com.oa.commons.beans.Newlabel;
import com.oa.commons.vo.Page;

import java.util.List;

public interface INewlabelService {
    Page<Newlabel> findCurrentPage(int pagenum);
    Page<Newlabel> findCurrentPage01(int pid,int pagenum);


    int modifyNewLabel(Newlabel newlabel);
    int removeNewLabel(int id);
    int addNewLabel(Newlabel newlabel);
    List<String> findlabels();
    int findParentId(String label_name);
    Newlabel findlabelInfo(String label_name);
    Newlabel findById(int id);
    List<Newlabel> findlabelChildren(int id);

}
