<%--
  Created by IntelliJ IDEA.
  User: 枫桥夜泊
  Date: 2019/12/30
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 信息如下</strong></div>
    <div class="body-content"  itemtype="${user}" var="user" style="font-size: 15px;">
        <form method="post" class="form-x">
            <div class="form-group">
                    <label >学号：&nbsp;&nbsp;&nbsp; ${user.sno}</label>
            </div>
            <div class="form-group">
                    <label>姓名：&nbsp;&nbsp;&nbsp;${user.name}</label>
            </div>
            <div class="form-group">
                    <label>性别：&nbsp;&nbsp;&nbsp;${user.sex}</label>
            </div>
            <div class="form-group">
                    <label>专业：&nbsp;&nbsp;&nbsp;${user.college}</label>
            </div>

            <div class="form-group">
                    <label>班级：&nbsp;&nbsp;&nbsp; ${user.classes}</label>
            </div>
            <div class="form-group">
                    <label>手机号：&nbsp;&nbsp;&nbsp;${user.phone}</label>
            </div>
            <div class="form-group">
                    <label >宿舍号：&nbsp;&nbsp;&nbsp; ${user.house}</label>
            </div>
        </form>
    </div>
</div>
</body></html>
