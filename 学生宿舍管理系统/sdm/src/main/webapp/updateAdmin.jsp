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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css">
    <script src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
    <script language="javascript">

        <%--function update()--%>
        <%--{--%>
            <%--var passwordOld=document.getElementById("passwordOld").value;--%>
            <%--var password1=document.getElementById("password1").value;--%>
            <%--var password2=document.getElementById("password2").value;--%>
            <%--var username=document.getElementById("username").value;--%>

            <%--if(password1 != password2){--%>
                <%--alert("两次输入的密码不一致！");--%>
                <%--document.getElementById("password1").focus();--%>
                <%--return false;--%>
            <%--}--%>

            <%--else {--%>
                <%--alert("更改成功!");--%>
                <%--location.href="${pageContext.request.contextPath}/admin/updateManage.do?password="+password+"&username="+username;--%>
                <%--return true;--%>
            <%--}--%>
        <%--}--%>
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 修改管理员密码</strong></div>
    <div class="body-content">
        <form method="post" id="my-form" class="form-x" action="${pageContext.request.contextPath}/admin/updateManage.do">
            <div class="form-group">
                <div class="label">
                    <label >管理员帐号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        ${name}<input id="username" name="username" type="hidden" value="${name}" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >原始密码：</label>
                </div>
                <div class="field">${password}
                    <%--<input type="password" class="input w50" id="passwordOld" name="passwordOld" size="50" placeholder="请输入原始密码" data-validate="required:请输入原始密码" />--%>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="password1" name="password" size="50" placeholder="请输入新密码" data-validate="required:请输入新密码" />
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >确认新密码：</label>
                </div>
                <div class="field">
                    <input type="password" class="input w50" id="password2" name="repassword" size="50" placeholder="请再次输入新密码" data-validate="required:请再次输入新密码,repeat#password:两次输入的密码不一致" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" > 提交</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="button bg-main icon-check-square-o" type="reset"> 重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body></html>
