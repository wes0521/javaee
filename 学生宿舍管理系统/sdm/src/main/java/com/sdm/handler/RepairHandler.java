package com.sdm.handler;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sdm.commons.beans.Repair;
import com.sdm.commons.beans.Student;
import com.sdm.service.IRepairService;
import com.sdm.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/repair")
public class RepairHandler {

    @Autowired
    private IRepairService repairService;
    @Autowired
    private IStudentService studentService;

    @RequestMapping("/findAllRepair.do")
    public String findAllRepair(@RequestParam(defaultValue = "1") int pageNum, HttpSession session){
        System.out.println("findAllRepair");
        PageHelper.startPage(pageNum,6);
        List<Repair> repairs =repairService.findAllRepair();
        List<Student> students =studentService.findAllStudent();
        List<String> snames = findAllSname();
        PageInfo pageInfo = new PageInfo(repairs);
        session.setAttribute("pageInfo",pageInfo);
        session.setAttribute("repairs",repairs);
        session.setAttribute("studentss",students);
        session.setAttribute("snames",snames);
        return "/listRepairs.jsp";
    }
    //按照学号查询报修信息
    @RequestMapping("/findRepairBySno.do")
    public String findRepairBySno(@RequestParam(defaultValue = "1") int pageNum,@RequestParam("username") String sno,HttpSession session){
        System.out.println("按学号查询报修");
        PageHelper.startPage(pageNum,3);
        List<Repair> repairs=repairService.findRepairBySno(sno);
        PageInfo pageInfo=new PageInfo(repairs);
        String rhouse=studentService.findRhouseBySno(sno);
        System.out.println("学号为"+sno+"的房子"+rhouse);
        session.setAttribute("pageInfo",pageInfo);
        session.setAttribute("repairs",repairs);
        session.setAttribute("sno",sno);
        session.setAttribute("rhouse",rhouse);
        return "/listRepairsBySno.jsp";
    }

//    /*
//    * 按照学号查询报修信息
//    * */
//    @RequestMapping("/findRepairBySno1.do")
//    public String findRepairBySno1(String sno,HttpSession session){
//        System.out.println("按学号查询报修1");
//        System.out.println(sno);
//        Student student1 = studentService.findStudentBySno(sno);
//
//        System.out.println(student1);
//
//        session.setAttribute("student1",student1);
//        return "/addRepair.jsp";
//    }
    /*
     * 添加报修信息
     * */
    @RequestMapping("/addRepair.do")
    public String addRepair(Repair repair){
        System.out.println("addRepair");
        System.out.println(repair);
        String sno = repair.getSno();
        System.out.println("sno----->"+sno);
        Student studentBySno = studentService.findStudentBySno(sno);
        repair.setSname(studentBySno.getName());
        int row = repairService.addRepair(repair);
        if (row > 0){
            System.out.println("插入成功");
        }else {
            System.out.println("插入失败");
        }
        return "/listRepairsBySno.jsp";
    }
    /*
     * 删除报修信息
     * */
    @RequestMapping("/deleteRepair.do")
    public String deleteRepair(String rid){
        System.out.println("deleteRepair");
        System.out.println("sno------>"+rid);
        int row = repairService.deleteRepair(rid);
        if (row > 0){
            System.out.println("删除成功");
        }else {
            System.out.println("删除失败");
        }
        return "/listRepairsBySno.jsp";
    }
    /*
     * 学生删除报修信息
     * */
//    @RequestMapping("/deleteRepair1.do")
//    public String deleteRepair1(String rid){
//        System.out.println("deleteRepair");
//        System.out.println("sno------>"+rid);
//        int row1 = repairService.deleteRepair(rid);
//        if (row1 > 0){
//            System.out.println("删除成功");
//        }else {
//            System.out.println("删除失败");
//        }
//        return "/listRepairsBySno.jsp";
//    }

    /*
     * 修改报修信息
     * */
    @RequestMapping("/updateRepair1.do")
    public String updateRepair1(String rid,HttpSession session){
        System.out.println("updateRepair1");
        System.out.println(rid);
        // List<String> snos = findAllSno();
        Repair repairRid = repairService.findRepairByRid(rid);
        System.out.println(repairRid);
        session.setAttribute("repairRid",repairRid);
        // session.setAttribute("snos",snos);
        return "/updateRepair.jsp";
    }
    /*
     * 修改报修信息
     * */
    @RequestMapping("/updateRepair.do")
    public String updateRepair(String rid ,Repair repair){
        System.out.println("updateRepair");
        System.out.println(rid);
        System.out.println("repair----->"+repair);
        int row = repairService.modifyByRid(repair);
        if (row > 0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        return "/listRepairsBySno.jsp";
    }




    public List<String> findAllSname(){
        return repairService.findAllSname();
    }
    public String findSnoByName(String sname){
        return repairService.findSnoByName(sname);
    }

    public Repair repairBySno(String sno){
        return repairService.repairBySno(sno);
    }

}
