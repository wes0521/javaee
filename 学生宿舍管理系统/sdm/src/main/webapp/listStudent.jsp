<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-12-25
  Time: 14:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="renderer" content="webkit">
    <title>学生信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
    <script>
        function del(sno){
            if(confirm("您确定要删除吗?")){
                alert("删除成功！");
                window.self.location.href = "${pageContext.request.contextPath}/student/deleteStudent.do?sno=" + sno;
            }
        }
    </script>
</head>
<body>
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 学生管理</strong> <a href=""
                                                                               style="float:right; display:none;">添加字段</a>
        </div>
        <div class="padding border-bottom">
            <ul class="search" style="padding-left:10px;">
                <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath}/addStudent.jsp"> 添加学生</a></li>
            </ul>
        </div>
        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">序号</th>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>专业</th>
                <th>班级</th>
                <th>手机号</th>
                <th>宿舍号</th>
                <th width="310">操作</th>
            </tr>
            <c:forEach items="${students}" var="student" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${student.sno}</td>
                    <td>${student.name}</td>
                    <td>${student.sex}</td>
                    <td>${student.college}</td>
                    <td>${student.classes}</td>
                    <td>${student.phone}</td>
                    <td>${student.house}</td>
                    <td>
                        <div class="button-group"><a class="button border-main" href="${pageContext.request.contextPath}/student/updateStudent1.do?sno=${student.sno}"><span
                                class="icon-edit"></span> 修改</a>
                            <a class="button border-red"
                               href="#" onclick="del('${student.sno}')">
                                <span class="icon-trash-o"></span> 删除</a></div>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="9">
                    <div class="pagelist">
                        <a href="${pageContext.request.contextPath}/student/findAllStudent.do?pageNum=1">首页</a>
                        <a href="${pageContext.request.contextPath}/student/findAllStudent.do?pageNum=${pageInfo.pageNum-1}">上一页</a>
                        <a href="${pageContext.request.contextPath}/student/findAllStudent.do?pageNum=${pageInfo.pageNum+1}">下一页</a>
                        <a href="${pageContext.request.contextPath}/student/findAllStudent.do?pageNum=${pageInfo.pages}">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
