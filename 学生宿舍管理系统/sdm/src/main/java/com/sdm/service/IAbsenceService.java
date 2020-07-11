package com.sdm.service;

import com.sdm.commons.beans.Absence;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IAbsenceService {
    List<Absence> findAllAbsence();

    List<Absence> selectAbsenceBySno(String sno);

    int deleteAbsence(String ab_id);

    int addAbsence(Absence absence);

    int modifyBySno(Absence absence);

    List<String> findAllSno();

    Absence findAbsenceBySno(String ab_id);
}
