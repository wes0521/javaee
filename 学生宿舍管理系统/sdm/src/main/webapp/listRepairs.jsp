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
<%--    <script>--%>
<%--        function del(rid) {--%>
<%--            if (confirm("您确定要删除吗?")) {--%>
<%--                alert("删除成功！");--%>
<%--                window.self.location.href = "${pageContext.request.contextPath}/repair/deleteRepair.do?rid="+rid;--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
</head>
<body>
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 报修信息</strong>
        <%--            <a--%>
        <%--                href="${pageContext.request.contextPath}/addRepair.jsp"--%>
        <%--                style="float:right; display:none;">添加报修</a>--%>
    </div>
<%--        <div class="padding border-bottom">--%>
<%--            <ul class="search" style="padding-left:10px;">--%>
<%--                <li><a class="button border-main icon-plus-square-o"--%>
<%--                       href="${pageContext.request.contextPath}/addRepair.jsp"> 添加报修</a></li>--%>
<%--            </ul>--%>
<%--        </div>--%>
        <table class="table table-hover text-center">
            <tr>
                <th width="5%" style="text-align:left; padding-left:20px;">序号</th>
                <th width="15%">学号</th>
                <th width="10%">姓名</th>
                <th width="15%">报修设备</th>
                <th width="30%">保修原因</th>
                <th width="15%">报修日期</th>
                <th width="10%">报修宿舍</th>
<%--                <th width="310">操作</th>--%>
            </tr>
            <c:forEach items="${repairs}" var="repair" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${repair.sno}</td>
                    <td>${repair.sname}</td>
                    <td>${repair.rname}</td>
                    <td>${repair.rcase}</td>
                    <td>${repair.rtime}</td>
                    <td>${repair.rhouse}</td>
<%--                    <td>--%>
<%--                        <div class="button-group">--%>
<%--                            <a class="button border-main" href="${pageContext.request.contextPath}/repair/updateRepair1.do?rid=${repair.rid}">--%>
<%--                                <span class="icon-edit"></span> 修改--%>
<%--                            </a>--%>
<%--                            <a class="button border-red" href="#" onclick="del('${repair.rid}')">--%>
<%--                                <span class="icon-trash-o"></span> 删除--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="9">
                    <div class="pagelist">
                        <a href="${pageContext.request.contextPath}/repair/findAllRepair.do?pageNum=1">首页</a>
                        <a href="${pageContext.request.contextPath}/repair/findAllRepair.do?pageNum=${pageInfo.pageNum-1}">上一页</a>
                        <a href="${pageContext.request.contextPath}/repair/findAllRepair.do?pageNum=${pageInfo.pageNum+1}">下一页</a>
                        <a href="${pageContext.request.contextPath}/repair/findAllRepair.do?pageNum=${pageInfo.pages}">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
