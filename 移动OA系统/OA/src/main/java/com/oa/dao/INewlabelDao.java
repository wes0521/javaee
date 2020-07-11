package com.oa.dao;

import com.oa.commons.beans.Newlabel;
import com.oa.commons.vo.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface INewlabelDao {
    int selectAllCount();
    int selectPartAll(int id);
    List<Newlabel> selectCurrentPageNewslabels(Page<Newlabel> page);
    List<Newlabel> selectCurrentPageNewslabels1(@Param("pid") int pid,@Param("page") Page<Newlabel> page);
    int updateNewLabel(Newlabel newlabel);
    Newlabel selectById(int id);
    int deleteNewLabel(int id);
    int insertNewLabel(Newlabel newlabel);
    List<String> selectlabels();
    int selectfindParentId(String label_name);
    Newlabel selectlabelInfo(String label_name);
    Newlabel selectLableById(int id);
    List<Newlabel> selectlabelChildren(int id);
}
