package com.sdm.service;

import com.sdm.commons.beans.Student;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
public interface IStudentService {
    List<Student> findAllStudent();

    int deleteStudent(String sno);

    int addStudent(Student student);

    int modifyBySno(Student student);

    List<String> findAllSno();

    Student findStudentBySno(String sno);

    String findRhouseBySno(String sno);
    String findNameBySno(String sno);
}
