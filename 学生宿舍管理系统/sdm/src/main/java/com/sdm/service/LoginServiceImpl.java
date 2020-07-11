/**
 * Created by IntelliJ IDEA.
 * User: 枫桥夜泊
 * Date: 2019/12/26
 * Time: 18:13
 */
package com.sdm.service;

import com.sdm.commons.beans.Student;
import com.sdm.commons.beans.User;
import com.sdm.dao.ILoginDao;
import com.sdm.dao.IStudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService{
    @Autowired
    private ILoginDao loginDao;
    //检验管理员用户登录
    public User checkLogin(String username,String password){
        User user=loginDao.findByUsername(username);
        if(user!=null&&(user.getPassword().equals(password))){
            return user;
        }
        return null;
    }
    @Autowired
    private IStudentDao studentDao;
    //检验学生用户登录
    public Student checkSnoLogin(String sno,String password){
        System.out.println(sno);
        System.out.println(sno+" "+password);
        Student student=studentDao.findStudentBySno(sno);
        if(student!=null&&(student.getPassword().equals(password))){
            return student;
        }

        return null;
    }

}
