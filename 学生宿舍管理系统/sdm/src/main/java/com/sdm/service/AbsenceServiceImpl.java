package com.sdm.service;

import com.sdm.commons.beans.Absence;
import com.sdm.dao.IAbsenceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
@Service
public class AbsenceServiceImpl implements IAbsenceService{

    @Autowired
    private IAbsenceDao absenceDao;

    @Override
    public List<Absence> findAllAbsence() {
        return absenceDao.selectAllAbsence();
    }

    @Override
    public List<Absence> selectAbsenceBySno(String sno) {
        return absenceDao.selectAbsenceBySno(sno);
    }

    @Override
    public int deleteAbsence(String ab_id) {
        return  absenceDao.deleteAbsenceById(ab_id);
    }

    @Override
    public int addAbsence(Absence absence) {
        return absenceDao.insertAbsence(absence);
    }

    @Override
    public int modifyBySno(Absence absence) {
        return absenceDao.updateAbsenceBySno(absence);
    }
    @Override
    public List<String> findAllSno() {
        return absenceDao.findAllSno();
    }

    @Override
    public Absence findAbsenceBySno(String ab_id) {
        return  absenceDao.findAbsenceBySno(ab_id);
    }

}
