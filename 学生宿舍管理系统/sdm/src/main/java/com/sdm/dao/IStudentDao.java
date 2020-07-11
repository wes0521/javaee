package com.sdm.dao;

import com.sdm.commons.beans.Student;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IStudentDao {
    List<Student> selectAllStudent();

    int deleteStudentById(String sno);

    int insertStudent(Student student);

    int updateStudentBySno(Student student);

    List<String> findAllSno();

    Student findStudentBySno(@RequestParam("sno") String sno);
    String findRhouseBySno(@RequestParam("sno") String sno);
    String findNameBySno(String sno);
}
