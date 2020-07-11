package com.sdm.dao;

import com.sdm.commons.beans.Absence;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IAbsenceDao {
    List<Absence> selectAllAbsence();

    List<Absence> selectAbsenceBySno(@RequestParam("sno") String sno);

    int deleteAbsenceById(String ab_id);

    int insertAbsence(Absence absence);

    int updateAbsenceBySno(Absence absence);

    List<String> findAllSno();

    Absence findAbsenceBySno(String ab_id);
}
