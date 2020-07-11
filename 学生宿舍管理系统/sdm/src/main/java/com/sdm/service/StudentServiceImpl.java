package com.sdm.service;

import com.sdm.commons.beans.Student;
import com.sdm.dao.IStudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/24 0024
 */
@Service
public class StudentServiceImpl implements IStudentService{

    @Autowired
    private IStudentDao studentDao;

    @Override
    public List<Student> findAllStudent() {
        List<Student> students = studentDao.selectAllStudent();
        return students;
    }

    @Override
    public int deleteStudent(String sno) {
        return studentDao.deleteStudentById(sno);
    }

    @Override
    public int addStudent(Student student) {
        return studentDao.insertStudent(student);
    }

    @Override
    public int modifyBySno(Student student) {
        return studentDao.updateStudentBySno(student);
    }

    @Override
    public List<String> findAllSno() {
        return studentDao.findAllSno();
    }

    @Override
    public Student findStudentBySno(String sno) {
        return studentDao.findStudentBySno(sno);
    }

    @Override
    public String findRhouseBySno(String sno){
        return studentDao.findRhouseBySno(sno);
    }

    @Override
    public String findNameBySno(String sno) {
        return studentDao.findNameBySno(sno);
    }
}
