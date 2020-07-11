<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/24 0024
  Time: 下午 4:01
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改学生</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/student/updateStudent.do">
            <div class="form-group">
                <div class="label">
                    <label >学号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        ${student.sno}<input name="sno" type="hidden" value="${student.sno}" />
                    </label>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >姓名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="name" size="50" value="${student.name}" data-validate="required:请输入学生姓名" />
                    </label>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >密码：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="password" size="50" value="${student.password}" data-validate="required:请输入学生登录密码" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >性别：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50"  name="sex" size="50" value="${student.sex}" data-validate="required:请输入学生性别" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >专业：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="college" size="50" value="${student.college}" data-validate="required:请输入学生手机号" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >班级：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="classes" size="50" value="${student.classes}" data-validate="required:请输入学生班级" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >手机号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50"  name="phone" size="50" value="${student.phone}" data-validate="required:请输入管理员姓名" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >宿舍：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50"  name="house" size="50" value="${student.house}" data-validate="required:请输入学生要住的宿舍" />
                    </label>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="button bg-main icon-check-square-o" type="reset"> 重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body></html>

