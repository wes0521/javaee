package com.hrm.filter;

import com.hrm.commons.beans.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {

    String[] IG_URI = {"/index.jsp","loginForm.jsp","/login","/",".css",".js",".jpg"};
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String requestURI = request.getRequestURI();
        for (String s:IG_URI){
            if (requestURI.endsWith(s)){
                filterChain.doFilter(request,response);
                return;
            }
        }
        User login_user = (User) request.getSession().getAttribute("login_user");
        if (login_user != null){
            filterChain.doFilter(request,response);
        }
        else{
            request.setAttribute("login_error","您还未登录，请登录后访问！");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }
}
