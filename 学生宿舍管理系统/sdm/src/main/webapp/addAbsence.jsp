<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/24 0024
  Time: 下午 4:01
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
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 添加缺勤</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/absence/addAbsence.do">

            <div class="form-group">
                <div class="label">
                    <label >学号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <select name="st_sno" class="input" style="width:50% ">
                            <option name="st_sno" value="" selected>--请选择--</option>
                            <c:forEach items="${students}" var="student" varStatus="status">
                                <option name="st_sno" value="${student.sno}">${student.sno}</option>
                            </c:forEach>
                        </select>
                    </label>
                </div>
            </div>


            <div class="form-group">
                <div class="label">
                    <label >性别：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="st_sex" size="50" placeholder="请输入学生性别" data-validate="required:请输入学生性别" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >班级</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50"  name="st_class" size="50" placeholder="请输入学生班级" data-validate="required:请输入学生班级" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >宿舍号</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="house_num" size="50" placeholder="请输入学生宿舍号" data-validate="required:请输入学生宿舍号" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >缺勤时间</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" id="test1" class="laydate-icon input w50" name="ab_time" data-validate="required:请输入缺勤时间"  data-validate="required:请输入缺勤时间" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                        <script src="${pageContext.request.contextPath }/layDate-v5.0.9/laydate/laydate.js"></script> <!-- 改成你的路径 -->
                        <script>
                            //执行一个laydate实例
                            laydate.render({
                                elem: '#test1' //指定元素
                            });
                        </script>
                    </label>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >记录人</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        ${name}<input type="hidden" class="input w50" name="wr_person" value="${name}" size="50"/>
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

