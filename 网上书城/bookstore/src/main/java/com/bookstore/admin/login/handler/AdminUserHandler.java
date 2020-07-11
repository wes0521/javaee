package com.bookstore.admin.login.handler;

import com.bookstore.admin.login.service.IAdminUserService;
import com.bookstore.commons.beans.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/login")
public class AdminUserHandler {

    @Autowired
    private IAdminUserService adminUserService;

    //管理员登录
    @RequestMapping("/login")
    public String login(User user, HttpSession session, Model model){
        System.out.println("管理员登录信息---->"+user);
        User login_user1 = adminUserService.findUserByLogin(user);
        if (login_user1 != null){
            //用户名和密码正确，并且是超级管理员
            if ("超级管理员".equals(login_user1.getRole())){
                session.setAttribute("login_user1",login_user1);
                return "/admin/login/home.jsp";
            }else {
                //用户名和密码正确，但是是普通用户
                //return "/client/error/privilege.jsp";
                model.addAttribute("fail","您当前属于普通用户，暂无法登录!");
                return "/admin/login/login.jsp";
            }
        }else {
            model.addAttribute("fail","用户名或密码错误，请重新输入!");
            return "/admin/login/login.jsp";
        }
    }

    //测试
    @RequestMapping("/test")
    public String test(){
        return "/admin/login/home.jsp";
    }

    //管理员退出
    @RequestMapping("/logout")
    public String logout(HttpSession session,Model model){
        session.removeAttribute("login_user1");
        model.addAttribute("fail","用户名退出成功，请重新登录!");
        return "/admin/login/login.jsp";
    }
}
