<%--
  Created by IntelliJ IDEA.
  User: 枫桥夜泊
  Date: 2019/12/30
  Time: 22:28
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
    <title>缺勤信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform">
        <table class="table table-hover text-center">
            <tr>
                <th width="100" style="text-align:left; padding-left:20px;">序号</th>
                <th width="10%">学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>班级</th>
                <th>宿舍号</th>
                <th>缺勤时间</th>
                <th>记录人</th>
            </tr>
            <c:forEach items="${absences}" var="absence" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${absence.st_sno}</td>
                    <td>${absence.st_name}</td>
                    <td>${absence.st_sex}</td>
                    <td>${absence.st_class}</td>
                    <td>${absence.house_num}</td>
                    <td>${absence.ab_time}</td>
                    <td>${absence.wr_person}</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="8">
                    <div class="pagelist">
                        <a href="${pageContext.request.contextPath}/absence/findAbsenceBySno.do?pageNum=1&username=${sno}">首页</a>
                        <a href="${pageContext.request.contextPath}/absence/findAbsenceBySno.do?pageNum=${pageInfo.pageNum-1}&username=${sno}">上一页</a>
                        <a href="${pageContext.request.contextPath}/absence/findAbsenceBySno.do?pageNum=${pageInfo.pageNum+1}&username=${sno}">下一页</a>
                        <a href="${pageContext.request.contextPath}/absence/findAbsenceBySno.do?pageNum=${pageInfo.pages}&username=${sno}">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
