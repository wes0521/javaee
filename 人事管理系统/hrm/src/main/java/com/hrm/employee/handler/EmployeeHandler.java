package com.hrm.employee.handler;

import com.hrm.commons.beans.Dept;
import com.hrm.commons.beans.Employee;
import com.hrm.commons.beans.Job;
import com.hrm.employee.service.IEmployeeService;
import com.hrm.utils.PageModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeHandler {

    @Autowired
    IEmployeeService employeeService;

    //查询员工
    @RequestMapping("/findEmployee")
    public String findEmployee(@RequestParam(defaultValue = "1") int pageIndex,Integer job_id,Integer dept_id, Employee employee, Model model){
        if (job_id != null){
            Job job = new Job();
            job.setId(job_id);
            employee.setJob(job);
        }
        if (dept_id != null){
            Dept dept = new Dept();
            dept.setId(dept_id);
            employee.setDept(dept);
        }
        List<Job> jobs = employeeService.findAllJob();//职位下拉列表
        List<Dept> depts =employeeService.findAllDept();//部门下拉列表
        int recordCount = employeeService.findEmployeeCount(employee);
        PageModel pageModel = new PageModel();
        pageModel.setPageSize(2);
        pageModel.setPageIndex(pageIndex);
        pageModel.setRecordCount(recordCount);
        List<Employee> employees = employeeService.findEmployee(pageModel,employee);
        /*for (Employee e:employees){
            System.out.println(e);
        }*/
        model.addAttribute("jobs",jobs);
        model.addAttribute("depts",depts);
        model.addAttribute("employees",employees);
        model.addAttribute("employee",employee);
        model.addAttribute("pageModel",pageModel);
        return "/jsp/employee/employee.jsp";
    }

    //通过id查询员工
    @RequestMapping("/findEmployeeById")
    public String findEmployeeById(int id,Model model,int pageIndex){
        Employee employee = employeeService.findEmployeeById(id);
        List<Job> jobs = employeeService.findAllJob();//职位下拉列表
        List<Dept> depts =employeeService.findAllDept();//部门下拉列表
        if (employee != null){
            model.addAttribute("jobs",jobs);
            model.addAttribute("depts",depts);
            model.addAttribute("employee",employee);
            model.addAttribute("pageIndex",pageIndex);
            return "/jsp/employee/showUpdateEmployee.jsp";
        }
        else{
            model.addAttribute("fail","查询员工失败");
            return "/jsp/fail.jsp";
        }
    }

    //修改员工
    @RequestMapping("/modifyEmployee")
    @ResponseBody
    public String modifyEmployee(Employee employee){
       // System.out.println("ujjjjj"+employee);
        int rows = employeeService.modifyEmployee(employee);
        if (rows > 0){
            return "OK";
        }
        return "OK";
    }

    //员工删除
    @RequestMapping("/removeEmployee")
    @ResponseBody
    public String removeEmployee(Integer[] ids){
        int rows = employeeService.removeEmployee(ids);
        if (rows == ids.length){
            return "OK";
        }else{
            return "FAIL";
        }
    }

    //添加员工前先查询部门，职位的列表
    @RequestMapping("/toAddEmployee")
    public String toAddEmployee(Model model){
        List<Job> jobs = employeeService.findAllJob();//职位下拉列表
        List<Dept> depts =employeeService.findAllDept();//部门下拉列表
        model.addAttribute("jobs",jobs);
        model.addAttribute("depts",depts);
        return "/jsp/employee/showAddEmployee.jsp";
    }

    //添加员工
    @RequestMapping("/addEmployee")
    @ResponseBody
    public Object addEmployee(Employee employee){
        System.out.println("employee---->"+employee);
        int rows = employeeService.addEmployee(employee);
        if(rows > 0){
            PageModel pageModel = new PageModel();
            int recordCount = employeeService.findEmployeeCount(null);
            pageModel.setRecordCount(recordCount);
            pageModel.setPageSize(2);
            return pageModel.getTotalSize();
        }
        else{
            return "FAIL";
        }
    }
}
