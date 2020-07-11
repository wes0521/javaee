package com.sdm.handler;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/27 0027
 */

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdm.commons.beans.Absence;
import com.sdm.commons.beans.Student;
import com.sdm.service.IAbsenceService;
import com.sdm.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/absence")
public class AbsenceHandler {
    @Autowired
    private IAbsenceService absenceService;
    @Autowired
    private IStudentService studentService;
    @RequestMapping("/findAllAbsence.do")
    public String findAllStudent(@RequestParam(defaultValue = "1") int pageNum, HttpSession session){
        System.out.println("findAllAbsence");
        PageHelper.startPage(pageNum,6);
        List<Absence> absences =absenceService.findAllAbsence();
        List<Student> students =studentService.findAllStudent();
        PageInfo pageInfo = new PageInfo(absences);
        session.setAttribute("pageInfo",pageInfo);
        session.setAttribute("students",students);
        session.setAttribute("absences",absences);
        return "/listAbsence.jsp";
    }

    /*
     * 添加信息
    //  * */
    @RequestMapping("/addAbsence.do")
    public String addAbsence(Absence absence){
        System.out.println("addAbsence");
        System.out.println("sno======"+absence.getSt_sno());

        String sno = absence.getSt_sno();
        String name = studentService.findNameBySno(sno);
        System.out.println("name----------"+name);
        absence.setSt_name(name);
        System.out.println(absence);
        int row = absenceService.addAbsence(absence);
        if (row > 0){
            System.out.println("插入成功");
        }else {
            System.out.println("插入失败");
        }
        return "/listAbsence.jsp";
    }

    /*
    * 查询学生界面的个人缺勤信息
    * */
    @RequestMapping("/findAbsenceBySno.do")
    public String findAbsenceBySno(@RequestParam(defaultValue = "1") int pageNum, @RequestParam("username") String sno, HttpSession session){
        System.out.println("查询"+sno+"的缺勤信息");
        PageHelper.startPage(pageNum,5);
        List<Absence> absences = absenceService.selectAbsenceBySno(sno);
//        List<Student> students =studentService.findAllStudent();
        PageInfo pageInfo = new PageInfo(absences);
        session.setAttribute("pageInfo",pageInfo);
        session.setAttribute("sno",sno);
//        session.setAttribute("students",students);
        for(Absence absence:absences){
            System.out.println(absence);
        }
        session.setAttribute("absences",absences);
        return "/listAbsenceBySno.jsp";
    }
    /*
     * 删除
     * */
    @RequestMapping("/deleteAbsence.do")
    public String deleteAbsence(String st_sno){
        System.out.println("deleteAbsence");
        System.out.println("sno------>"+st_sno);
        int row = absenceService.deleteAbsence(st_sno);
        if (row > 0){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        return "/listAbsence.jsp";
    }


    public List<String> findAllSno(){
        return absenceService.findAllSno();
    }


    @RequestMapping("/updateAbsence1.do")
    public String updateAbsence1(String ab_id,HttpSession session){
        System.out.println("updateAbsence1");
        System.out.println(ab_id);
        List<String> snos = findAllSno();
        Absence absence = absenceService.findAbsenceBySno(ab_id);
        session.setAttribute("absence",absence);
        session.setAttribute("snos",snos);
        return "/updateAbsence.jsp";
    }

    @RequestMapping("/updateAbsence.do")
    public String updateAbsence(Absence absence){
        System.out.println("updateAbsence");
        System.out.println("++++++++++++"+absence);
        // String sno = absence.getSt_sno();
        System.out.println(absence.getAb_id());
        // String name = studentService.findNameBySno(sno);
        // System.out.println(name);
        // System.out.println(sno);
        // absence.setSt_name(name);
        int row = absenceService.modifyBySno(absence);
        if (row > 0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        return "/absence/findAllAbsence.do";
    }

}
