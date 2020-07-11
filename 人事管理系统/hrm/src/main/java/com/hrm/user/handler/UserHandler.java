package com.hrm.user.handler;

import com.hrm.commons.beans.User;
import com.hrm.utils.PageModel;
import com.hrm.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserHandler {

    @Autowired
    private IUserService userService;

    /*用户登录*/
    @RequestMapping("/login")
    public String login(User user, HttpSession session, Model model){
        User login_user = userService.findUserByLoginUser(user);
        //System.out.println(login_user);
        if (login_user != null){
            session.setAttribute("login_user",login_user);
            return "/jsp/main.jsp";
        }
        else{
            model.addAttribute("login_error","账户或密码错误，请重新输入");
            return "/index.jsp";
        }
    }

    /*用户退出*/
    @RequestMapping("/logout")
    public String logout(HttpSession session,Model model){
        session.removeAttribute("login_user");
        model.addAttribute("login_error","退出成功，请重新登录！");
        return "/index.jsp";
    }

    /*查询用户*/
    @RequestMapping("/findUser")
    public String findUser(@RequestParam(defaultValue = "1") Integer pageIndex, User user,Model model){
        PageModel pageModel = new PageModel();
        pageModel.setPageIndex(pageIndex);

        int recordCount = userService.findUserCount(user);
        pageModel.setRecordCount(recordCount);
        List<User> users = userService.findUser(user,pageModel);

        /*for (User s:users){
            System.out.println(s);
        }*/
        model.addAttribute("users",users);
        model.addAttribute("pageModel",pageModel);
        model.addAttribute("user",user);
        return "/jsp/user/user.jsp";
    }

    /*用户修改*/
    @RequestMapping("/modifyUser")
    public String modifyUser(User user,String flag,Model model,int pageIndex){
        if(flag == null){
            user = userService.findUserById(user.getId());
            model.addAttribute("pageIndex",pageIndex);
            model.addAttribute("user",user);
            return "/jsp/user/showUpdateUser.jsp";
        }
        else{
            int rows = userService.modifyUser(user);
            if (rows > 0){
                return "redirect:/user/findUser?pageIndex="+pageIndex;
            }
            else{
                model.addAttribute("fail","用户信息修改失败！");
                return "/jsp/fail.jsp";
            }
        }
    }

    /*用户添加*/
    @RequestMapping("/addUser")
    public String addUser(User user,Model model){
        int rows = userService.addUser(user);
        if (rows > 0){
            PageModel pageModel = new PageModel();
            int recordCount = userService.findUserCount(null);
            pageModel.setRecordCount(recordCount);
            return "redirect:/user/findUser?pageIndex="+pageModel.getTotalSize();
        }
        else{
            model.addAttribute("fail","用户信息添加失败！");
            return "/jsp/fail.jsp";
        }
    }

    /*用户删除*/
    @RequestMapping("/removeUser")
    public String removeUser(Integer[] ids,Model model,HttpSession session){
        //获取当前登录用户，防止被删除
        User login_user = (User) session.getAttribute("login_user");
        for (Integer id:ids){
            if (login_user.getId() == id){
                model.addAttribute("fail","不能删除当前登录用户自身！");
                return "/jsp/fail.jsp";
            }
        }
        try{
            int rows = userService.removeUser(ids);
            if (rows == ids.length){
                return "/user/findUser";
            }
            else{
                model.addAttribute("fail","用户信息删除失败！");
                return "/jsp/fail.jsp";
            }
        }catch (DataIntegrityViolationException e){
            model.addAttribute("fail","当前用户有发布公告或文档，请删除公告或文档后再删除用户！");
            return "/jsp/fail.jsp";
        }
    }

    /*检查登录名是否已存在*/
    @RequestMapping("/checkLoginname")
    @ResponseBody
    public String checkLoginname(String loginname){
        //System.out.println(loginname);
        User user = userService.findLoginname(loginname);
        if (user != null){
            return "EXIST";
        }
        else{
            return "OK";
        }
    }

}
