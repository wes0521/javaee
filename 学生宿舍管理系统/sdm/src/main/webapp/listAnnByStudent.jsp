<%--
  Created by IntelliJ IDEA.
  User: 枫桥夜泊
  Date: 2019/12/30
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
</head>
<body>
<form method="post" action="" id="listform">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 公告管理</strong></div>
        <table class="table table-hover text-center">
            <tr>
                <th width="5%">序号</th>
                <th width="10%">公告名称</th>
                <th width="55%">公告内容</th>
                <th width="15%">公告时间</th>
            </tr>

            <c:forEach var="announcement" items="${announcements }" varStatus="status">
                <tr>
                    <td>${status.index+1 }</td>
                    <td align="center">${announcement.anno_name }</td>
                    <td align="center">${announcement.anno_content }</td>
                    <td align="center">${announcement.anno_data }</td>

                </tr>
            </c:forEach>

            <tr>
                <td colspan="5">
                    <div class="pagelist">
                        <a href="${pageContext.request.contextPath}/anno/findAnnByStudent.do?pageNum=1">首页</a>
                        <a href="${pageContext.request.contextPath}/anno/findAnnByStudent.do?pageNum=${pageInfo.pageNum-1}">上一页</a>
                        <a href="${pageContext.request.contextPath}/anno/findAnnByStudent.do?pageNum=${pageInfo.pageNum+1}">下一页</a>
                        <a href="${pageContext.request.contextPath}/anno/findAnnByStudent.do?pageNum=${pageInfo.pages}">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
</body></html>
