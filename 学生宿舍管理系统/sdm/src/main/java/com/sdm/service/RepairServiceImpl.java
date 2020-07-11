package com.sdm.service;

import com.sdm.commons.beans.Repair;
import com.sdm.dao.IRepairDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
@Service
public class RepairServiceImpl implements IRepairService{

    @Autowired
    private IRepairDao repairDao;


    @Override
    public List<Repair> findAllRepair() {
        return repairDao.selectAllRepair();
    }

    @Override
    public List<Repair> findRepairBySno(String sno){
        return repairDao.selectRepairBySno(sno);
    }

    @Override
    public int deleteRepair(String rid) {
        return repairDao.deleteRepairByRid(rid);
    }

    @Override
    public int addRepair(Repair repair) {
        return repairDao.insertRepair(repair);
    }

    @Override
    public int modifyByRid(Repair repair) {
        return repairDao.updteByRid(repair);
    }

    @Override
    public List<String> findAllSname() {
        return repairDao.findAllSname();
    }

    @Override
    public Repair repairBySno(String sno) {
        return repairDao.repairBySno(sno);
    }

    @Override
    public String findSnoByName(String sname) {
        return repairDao.findSnoByName(sname);
    }
//    @Override
//    public String findRhouseBySno(String sno){
//        return repairDao.findRhouseBySno(sno);
//    }

    @Override
    public Repair findRepairByRid(String rid) {
        return repairDao.findRepairByRid(rid);
    }
}
