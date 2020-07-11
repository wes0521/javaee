package com.bookstore.client.user.handler;

import com.bookstore.client.user.service.IUserService;
import com.bookstore.commons.beans.Order;
import com.bookstore.commons.beans.OrderItem;
import com.bookstore.commons.beans.User;
import com.bookstore.utils.IdUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/client/user")
public class UserHandler {

    @Autowired
    private IUserService userService;

    //注册用户
    @RequestMapping("/register")
    public String register(User user, String checkCode, HttpSession session, HttpServletRequest request){
        //System.out.println(user+"----"+checkCode);
        user.setActiveCode(IdUtils.getUUID());
        String checkcode_session = (String) session.getAttribute("checkcode_session");
        if (checkCode.equals(checkcode_session)){
            int rows = userService.addUser(user,request);
            if (rows > 0){
                return "redirect:/client/registersuccess.jsp";
            }
            else{
                request.setAttribute("fail","新用户注册失败，请重试！");
                return "/client/register.jsp";
            }
        }else {//校验码不正确
            request.setAttribute("check_error","校验码错误，请重新输入！");
            return "/client/register.jsp";
        }
    }

    //激活用户
    @RequestMapping("/activeUser")
    public String activeUser(String activeCode){
        //System.out.println("激活码"+activeCode);
        int rows = userService.activeUser(activeCode);
        if (rows > 0){
            return "redirect:/client/activeSuccess.jsp";
        }
        else {
            return "redirect:/client/activeFail.jsp";
        }
    }

    //查询邮箱是否已被占用
    @RequestMapping("/findEmail")
    @ResponseBody
    public String findEmail(String email){
        System.out.println("email是---->"+email);
        User user = userService.findEmail(email);
        if (user != null){
            return "EXIST";
        }
        else{
            return "OK";
        }
    }

    //查询会员名是否已被占用
    @RequestMapping("/findUsername")
    @ResponseBody
    public String findUsername(String username){
        System.out.println("username是---->"+username);
        User user = userService.findUsername(username);
        if (user != null){
            return "EXIST";
        }
        else{
            return "OK";
        }
    }

    //我的账户
    @RequestMapping("/myAccount")
    public String myAccount(HttpSession session,HttpServletRequest request){

        //获取session中的登录信息
        User login_user = (User) session.getAttribute("login_user");
        if (login_user == null){//未登录
            //是否能自动登录
            login_user = autologin(request);
            if (login_user != null){
                session.setAttribute("user_login",login_user);
                return "/client/myAccount.jsp";//到显示我的账户信息
            }
            return "/client/login.jsp";//到我的账户登录界面
        }
        else {                  //已登录
            return "/client/myAccount.jsp";//到显示我的账户信息
        }
    }

    //用户登录
    @RequestMapping("/login")
    public String login(User user, HttpSession session, String autologin, HttpServletRequest request, HttpServletResponse response, String remember){
        //System.out.println("会员名："+user.getUsername()+'\n'+"密码"+user.getPassword());
        //System.out.println("记住用户名："+remember);
        //System.out.println("自动登录："+autologin);

        User login_user = userService.findUserByLogin(user);
        if (login_user == null){//用户名和密码不正确
            request.setAttribute("login_error","会员名与密码错误，请重新登录！");
            return "/client/login.jsp";
        }
        else {   //用户名和密码正确
            if (login_user.getState() == 1){//用户已激活
                if ("1".equals(autologin)){//自动登录，保存用户名和密码到cookie
                    addCookie(autologin,user,request,response);
                } else if ("1".equals(remember)){//记住用户名，保存到cookie
                    addCookie(autologin,user,request,response);
                }
                session.setAttribute("login_user",login_user);
                return "/client/myAccount.jsp";
            }
            else{           //用户已未活
                request.setAttribute("login_error","该会员尚未激活，请先激活再进行登录！");
                return "/client/login.jsp";
            }
        }
    }

    //用户退出
    @RequestMapping("/logout")
    public String logout(HttpSession session,HttpServletRequest request,HttpServletResponse response){
        //从session中移除登录用户信息
        session.removeAttribute("login_user");
        //session.invalidate();//设置为过期也行

        //从cookie中移除保存的用户名
        Cookie cookie1 = new Cookie("bookstore_username",null);
        cookie1.setMaxAge(0);
        cookie1.setPath(request.getContextPath()+"/");
        response.addCookie(cookie1);
        //从cookie中移除保存的密码
        Cookie cookie2 = new Cookie("bookstore_password",null);
        cookie1.setMaxAge(0);
        cookie1.setPath(request.getContextPath()+"/");
        response.addCookie(cookie2);

        request.setAttribute("login_error","用户退出成功，请重新登录！");
        return "/client/login.jsp";
    }

    //修改用户信息
    @RequestMapping("/modifyUser")
    public String modifyUser(HttpSession session, User user, Model model){
        System.out.println(user);
        //获取当前登录用户信息
        User login_user = (User) session.getAttribute("login_user");
        user.setId(login_user.getId());
        int rows = userService.modifyUser(user);
        if (rows > 0){
            model.addAttribute("login_error","用户信息修改成功，请重新登录！");
            return "/client/login.jsp";
        }
        else {
            model.addAttribute("fail","用户信息修改失败，请重试！");
            return "/client/modifyuserinfo.jsp";
        }
    }

    //保存用户名与密码
    private void addCookie(String autologin, User user, HttpServletRequest request, HttpServletResponse response) {

        //定义cookie对象:记住用户名到cookie（记住用户名）
        Cookie cookie1 = new Cookie("bookstore_username",user.getUsername());
        cookie1.setMaxAge(60*60*24*3);//保存时间3天
        cookie1.setPath(request.getContextPath()+"/");//cookie的作用路径:当前项目下
        //把定义好的cookie响应回客户端
        response.addCookie(cookie1);

        //定义cookie对象:记住密码到cookie（自动登录）
        if ("1".equals(autologin)){
            Cookie cookie2 = new Cookie("bookstore_password",user.getPassword());
            cookie2.setMaxAge(60*60*34*3);
            cookie2.setPath(request.getContextPath()+"/");
            response.addCookie(cookie2);
        }
    }

    //自动登录
    private User autologin(HttpServletRequest request) {
        //定义字符串用户名和密码为null
        String username = null;
        String password = null;
        //获取全部的cookie信息到数组cookies中
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie:cookies){//循环cookies数组

            if ("bookstore_username".equals(cookie.getName())){//对比找到cookies中保存的bookstore_username的名称
                username = cookie.getValue();//赋值给username
                System.out.println(username);
            }
            if ("bookstore_password".equals(cookie.getName())){//对比找到cookies中保存的bookstore_password的名称
                password = cookie.getValue();//赋值给password
                System.out.println(password);
            }
        }
        //定义一个需要返回的User对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        //根据cookie中获取的用户名与密码去数据库查询，把结果返回
        System.out.println(user+"-------------");
        return userService.findUserByLogin(user);
    }

    //通过用户查询订单
    @RequestMapping("/findOrderByUser")
    public String findOrderByUser(HttpSession session,Model model){
        User login_user = (User) session.getAttribute("login_user");
        List<Order> orders = userService.findOrderByUser(login_user.getId());
        for (Order o:orders){
            System.out.println(o);
        }
        model.addAttribute("orders",orders);
        return "/client/orderlist.jsp";
    }

    //通过id号查看订单的详细信息
    @RequestMapping("/findOrderById")
    public String findOrderById(String id,Model model){
        List<OrderItem> items = userService.findOrderItemById(id);
        model.addAttribute("items",items);
        return "/client/orderInfo.jsp";
    }

    //删除订单信息
    @RequestMapping("/removeOrderById")
    public String removeOrderById(String id,String flag){
        userService.removeOrderById(id,flag);
        return "redirect:/client/user/findOrderByUser";
    }

}
