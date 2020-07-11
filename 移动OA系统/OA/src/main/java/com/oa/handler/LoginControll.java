package com.oa.handler;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * company: www.abc.com
 * Author: Administrator
 * Create Data: 2019/12/16 0016
 */
@Controller
@RequestMapping("/login")
public class LoginControll {
    @RequestMapping("/clientLogin.do")
    public String clientLogin(HttpSession httpSession, String username) {
        //登陆成功
        httpSession.setAttribute("username", username);
        return "/html/index.jsp";
    }

    @RequestMapping("/clientLoginOut.do")
    public String clientLoginOut(HttpSession httpSession) {
        httpSession.invalidate();
        return "/html/login.jsp";
    }
}
