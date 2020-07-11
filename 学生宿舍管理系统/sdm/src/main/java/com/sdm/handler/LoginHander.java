/**
 * Created by IntelliJ IDEA.
 * User: 枫桥夜泊
 * Date: 2019/12/26
 * Time: 18:06
 */
package com.sdm.handler;

import com.sdm.commons.beans.Student;
import com.sdm.commons.beans.User;
import com.sdm.service.ILoginService;
import com.sdm.service.IRepairService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value ={ "/user","/student"})
@SessionAttributes(value = {"user","student"})
public class LoginHander {

    @Autowired
    private ILoginService loginService;
    @Autowired
    private IRepairService repairService;
    //表单提交过来的路径
    @RequestMapping("/checkLogin.do")
    public String checkLogin(@Param("sel_type") String sel_type, @Param("username") String username, @Param("password") String password, HttpSession session){
        //调用service方法
        System.out.println("开始验证账号合法性！");
        System.out.println(sel_type+" "+username+" "+password);
        if(sel_type.equals("sys")){
            User user=null;
            user=loginService.checkLogin(username,password);
            System.out.println(user);
            if(user!=null){
                session.setAttribute("user",user);
                session.setAttribute("name",user.getUsername());
                session.setAttribute("password",user.getPassword());
                System.out.println(user.toString());
                return "/index.jsp";
            }
        } else if (sel_type.equals("stu")){
            Student stu=null;
            stu=loginService.checkSnoLogin(username,password);
            if(stu!=null){
                session.setAttribute("user",stu);
                session.setAttribute("name",stu.getName());
                session.setAttribute("sno",username);
                System.out.println(stu.toString());
                System.out.println("查找结束");
                return "/indexByStudent.jsp";
            }
        }
        session.setAttribute("error","账号或密码错误");
        return "/login.jsp";
    }
    @RequestMapping("/outLogin.do")
    public String outLogin( HttpSession session){
        System.out.println(
                session.getAttribute("user")
        );
        session.invalidate();
        return "/login.jsp";
    }
}
