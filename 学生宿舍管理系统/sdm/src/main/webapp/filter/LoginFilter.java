package com.sdm.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    private String loginJsp = "";
    private String loginDo = "";

    @Override
    public void destroy() {
    }
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)resp;
        String servletPath = request.getServletPath();
        HttpSession session = request.getSession();
        System.out.println(session.getAttribute("user"));
        System.out.println("开始过滤");
        System.out.println("-------------------------");
        System.out.println(servletPath);
        System.out.println(loginJsp);
        System.out.println(loginDo);
        System.out.println("-------------------------");
        if(servletPath.equals(loginJsp) || servletPath.equals(loginDo)){
            //登陆界面和登陆方法不进行过滤
            chain.doFilter(req, resp);
        }else{
            if(session.getAttribute("user")!=null){
                // 已经登录，继续请求下一级资源（继续访问）
                chain.doFilter(req,resp);
            }else{
                // 没有登录
                response.sendRedirect(request.getContextPath()+"/login.jsp");
            }
        }


    }
    @Override
    public void init(FilterConfig config) throws ServletException {
        //初始化参数（从web.xml文件中获取）
        loginJsp = config.getInitParameter("loginJsp");
        loginDo = config.getInitParameter("loginDo");

    }

}
