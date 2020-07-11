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
    <div class="panel-head"><strong><span class="icon-key"></span> 查看公告</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="">

            <div class="form-group">
                <div class="label">
                    <label >公告名称：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">

                        <input type="" class="input w50" type="hidden" name="anno_name" size="50" value="${announcement.anno_name}" data-validate="required:请输入学生姓名" />
                    </label>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>公告内容：</label>
                </div>
                <div class="field">
                    <%--${announcement.anno_content}--%>
                    <%--<textarea cols="100" rows="300"  class="input w50" value="${announcement.anno_content}" name="anno_content"></textarea>--%>

                    <input type="" class="input w50" type="hidden" style="width: 500px;height: 100px;" value="${announcement.anno_content}" name="anno_content" data-validate="required:请输入公告内容" />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>公告时间：</label>
                </div>
                <div class="field">
                    <%--${announcement.anno_data}--%>
                    <input type="" class="input w50" type="hidden" value="${announcement.anno_data}" name="anno_data" data-validate="required:请输入日期" />
                    <div class="tips"></div>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <a class="button border-main" href="${pageContext.request.contextPath}/listAnnouncement.jsp"> 返回</a>
                </div>
            </div>

    </form>
</div>
</div>
</body></html>

