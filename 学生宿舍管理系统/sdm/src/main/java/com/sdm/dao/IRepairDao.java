package com.sdm.dao;

import com.sdm.commons.beans.Repair;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IRepairDao {
    List<Repair> selectAllRepair();

    List<Repair> selectRepairBySno(@RequestParam("sno") String sno);

    int deleteRepairByRid(String rid);

    int insertRepair(Repair repair);

    int updteByRid(Repair repair);

    List<String> findAllSname();

    Repair repairBySno(@RequestParam("sno") String sno);

    String findSnoByName(String sname);

//    String findRhouseBySno(@RequestParam("sno") String sno);

    Repair findRepairByRid(String rid);
}
