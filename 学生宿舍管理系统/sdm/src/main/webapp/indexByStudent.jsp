<%--
  Created by IntelliJ IDEA.
  User: 枫桥夜泊
  Date: 2019/12/29
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>学生宿舍管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
    <div class="logo margin-big-left fadein-top">
        <h1><img src="${pageContext.request.contextPath}/images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />学生宿舍管理系统</h1>
    </div>
    <div class="head-l">
        <a class="button button-little bg-green" href="${pageContext.request.contextPath}/indexByStudent.jsp" target="_self">
            <span class="icon-home"></span> 前台首页
        </a> &nbsp;&nbsp;
        <a href="##" onclick="buffer()"  class="button button-little bg-blue">
            <span class="icon-wrench"></span> 清除缓存
        </a> &nbsp;&nbsp;
        <a class="button button-little bg-red" href="${pageContext.request.contextPath}/user/outLogin.do">
            <span class="icon-power-off"></span> 退出登录
        </a>
<%--        <c:forEach items="${user}" var="student" varStatus="status">--%>
<%--            <tr>--%>
<%--                <td>${status.index}</td>--%>
<%--                <td>${student.sno}</td>--%>
<%--                <td>${student.name}</td>--%>
<%--                <td>${student.sex}</td>--%>
<%--                <td>${student.college}</td>--%>
<%--                <td>${student.classes}</td>--%>
<%--                <td>${student.phone}</td>--%>
<%--                <td>${student.house}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
    </div>
</div>

<div class="leftnav">
    <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
    <h2><span class="icon-user"></span>信息查看</h2>
    <ul style="display:block" itemtype="${user}" var="user">
        <li><a href="${pageContext.request.contextPath}/student/findMyNewBySno.do?username=${sno}" target="right"><span class="icon-caret-right"></span>学生信息</a></li>
        <li><a href="${pageContext.request.contextPath }/anno/findAnnByStudent.do" target="right"><span class="icon-caret-right"></span>查看公告</a></li>
        <li><a href="${pageContext.request.contextPath}/repair/findRepairBySno.do?username=${sno}" target="right"><span class="icon-caret-right"></span>报修信息</a></li>
        <li><a href="${pageContext.request.contextPath}/absence/findAbsenceBySno.do?username=${sno}" target="right"><span class="icon-caret-right"></span>缺勤记录</a></li>

        <%--<li><a href="info.jsp" target="right"><span class="icon-caret-right"></span>网站设置</a></li>--%>
        <%--<li><a href="pass.jsp" target="right"><span class="icon-caret-right"></span>修改密码</a></li>--%>
        <%--<li><a href="page.jsp" target="right"><span class="icon-caret-right"></span>单页管理</a></li>--%>
        <%--<li><a href="adv.jsp" target="right"><span class="icon-caret-right"></span>首页轮播</a></li>--%>
        <%--<li><a href="book.jsp" target="right"><span class="icon-caret-right"></span>留言管理</a></li>--%>
        <%--<li><a href="column.jsp" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>--%>
    </ul>
</div>
<script type="text/javascript">
    $(function(){
        $(".leftnav h2").click(function(){
            $(this).next().slideToggle(200);
            $(this).toggleClass("on");
        })
        $(".leftnav ul li a").click(function(){
            $("#a_leader_txt").text($(this).text());
            $(".leftnav ul li a").removeClass("on");
            $(this).addClass("on");
        })
    });
    function buffer() {
        alert("已清空缓存！(可同时按住 Ctrl+Shift+Del进行清除缓存)");
    }
</script>
<ul class="bread">
    <li><a href="${pageContext.request.contextPath}/welcomestudent.jsp" target="right" class="icon-home"> 首页</a></li>
    <li><a href="#" id="a_leader_txt">网站信息</a></li>
    <li><b>当前语言：</b><span style="color:red;"><php>中文</php></span>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;切换语言：<a href="##">中文</a> &nbsp;&nbsp;<a href="##">英文</a> </li>
</ul>
<div class="admin">
    <iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath}/welcomestudent.jsp" name="right" width="100%" height="100%">
        <%--<c:forEach items="${user}" var="student" varStatus="status">--%>
            <%--<tr>--%>
                <%--<td>${status.index+1}</td>--%>
                <%--<td>${student.sno}</td>--%>
                <%--<td>${student.name}</td>--%>
                <%--<td>${student.sex}</td>--%>
                <%--<td>${student.college}</td>--%>
                <%--<td>${student.classes}</td>--%>
                <%--<td>${student.phone}</td>--%>
                <%--<td>${student.house}</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
    </iframe>

</div>
<div style="text-align:center;">
    <p>来源:<a href="http://wes0521.icoc.bz/" target="_blank">冷潇工作室</a></p>
</div>
</body>
</html>

