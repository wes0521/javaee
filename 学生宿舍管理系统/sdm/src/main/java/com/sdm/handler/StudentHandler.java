package com.sdm.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdm.commons.beans.Student;
import com.sdm.service.IStudentService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentHandler {

    @Autowired
    private IStudentService studentService;

    /*
    * 分页查询全部的学生
    * */

    @RequestMapping("/findAllStudent.do")
    public String findAllStudent(@RequestParam(defaultValue = "1") int pageNum, HttpSession session){
        System.out.println("findAllStudent");
        PageHelper.startPage(pageNum,6);
        List<Student> students =studentService.findAllStudent();
        PageInfo pageInfo = new PageInfo(students);
        session.setAttribute("pageInfo",pageInfo);
        session.setAttribute("students",students);
        return "/listStudent.jsp";
    }
    /*
    * 添加学生
    * */
    @RequestMapping("/addStudent.do")
    public String addStudent(Student student){
        System.out.println("addStudent");
        System.out.println(student);
        int row = studentService.addStudent(student);
        if (row > 0){
            System.out.println("插入成功");
        }else {
            System.out.println("插入失败");
        }
        return "/listStudent.jsp";
    }

    /*
    * 删除学生
    * */
    @RequestMapping("/deleteStudent.do")
    public String deleteStudent(String sno){
        System.out.println("deleteStudent");
        int row = studentService.deleteStudent(sno);
        if (row > 0){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        return "/student/findAllStudent.do";
    }


    public List<String> findAllSno(){
        return studentService.findAllSno();
    }

    /*
    * 修改学生信息
    * */
    @RequestMapping("/updateStudent1.do")
    public String updateStudent1(String sno,HttpSession session){
        System.out.println("updateStudent1");
        System.out.println(sno);
        List<String> snos = findAllSno();
        Student student = studentService.findStudentBySno(sno);
        session.setAttribute("student",student);
        session.setAttribute("snos",snos);
        return "/updateStudent.jsp";
    }
    //按学号查询学生信息
    @RequestMapping("/findMyNewBySno.do")
    public String findMyNewBySno(@RequestParam("username") String sno,HttpSession session){
        System.out.println("开始查询学号为"+sno+"的学生信息");
        Student stu= studentService.findStudentBySno(sno);
        System.out.println(stu.toString());
        session.setAttribute("user",stu);
        return "/sawMyNew.jsp";
    }
    /*
     * 修改学生信息
     * */
    @RequestMapping("/updateStudent.do")
    public String updateStudent(String sno ,Student student){
        System.out.println("updateStudent");
        System.out.println(sno);
        int row = studentService.modifyBySno(student);
        Student student1 = studentService.findStudentBySno(sno);
        System.out.println(student1);
        if (row > 0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        return "/student/findAllStudent.do";
    }

}
