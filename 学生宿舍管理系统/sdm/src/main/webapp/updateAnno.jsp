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
    <div class="panel-head"><strong><span class="icon-key"></span> 修改公告</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/anno/updateAnno.do?">

            <div class="form-group">
                <div class="label">
                    <label >序号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        ${announcement.anno_id}<input name="anno_id" type="hidden" value="${announcement.anno_id}" />
                    </label>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >公告名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="anno_name" size="50" value="${announcement.anno_name}" data-validate="required:请输入学生姓名" />
                    </label>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label>公告内容：</label>
                </div>
                <div class="field">
                    <%--<textarea cols="10" rows="10"  class="input w50" value="${announcement.anno_content}" name="anno_content"></textarea>--%>

                    <input type="text" class="input w50" type="hidden" style="width: 500px;height: 100px;" value="${announcement.anno_content}" name="anno_content" data-validate="required:请输入公告内容" />
                    <div class="tips"></div>
                </div>
            </div>


            <div class="form-group">
                    <div class="label">
                        <label>公告时间：</label>
                    </div>
                    <div class="field">
                        <input type="date" class="input w50" value="${announcement.anno_data}" name="anno_data" data-validate="required:请输入日期" />
                        <div class="tips"></div>
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

