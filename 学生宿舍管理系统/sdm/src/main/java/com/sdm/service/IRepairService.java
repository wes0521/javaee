package com.sdm.service;

import com.sdm.commons.beans.Repair;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IRepairService {
    List<Repair> findAllRepair();

    List<Repair> findRepairBySno(String sno);

    int deleteRepair(String rid);

    int addRepair(Repair repair);

    int modifyByRid(Repair repair);

    List<String> findAllSname();

    Repair repairBySno(String sno);

    String findSnoByName(String sname);
//    String findRhouseBySno(String sno);

    Repair findRepairByRid(String rid);
}
