package com.sdm.handler;

import com.sdm.commons.beans.User;
import com.sdm.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/27 0027
 */

@Controller
@RequestMapping("/admin")
public class AdminHandler {
    @Autowired
    private IAdminService adminService;
    @RequestMapping("/addManage.do")
    public String addManage(User user){
        System.out.println("addManage");
        System.out.println(user);
        int row = adminService.addAdmin(user);
        if (row > 0){
            System.out.println("插入成功");
        }else {
            System.out.println("插入失败");
        }
        return "/addManage.jsp";
    }

    /*
     * 修改学生信息
     * */
//    @RequestMapping("/updateManage1.do")
//    public String updateStudent1(int uid,HttpSession session){
//        System.out.println("updateManage1");
//        System.out.println(uid);
//        User user1 = adminService.findAdminById(uid);
//        session.setAttribute("user1",user1);
//        return "/updateAdmin.jsp";
//    }

    /*
     * 修改管理员密码
     * */
    @RequestMapping("/updateManage.do")
    public String updateManage(User user){
        System.out.println("updateManage");
        System.out.println(user);
        int row = adminService.modify(user);
        if (row > 0){
            System.out.println("修改成功");
        }else {
            System.out.println("修改失败");
        }
        return "/updateAdmin.jsp";
    }
    public User findAdminById(int id){
        return adminService.findAdminById(id);
    }
}
