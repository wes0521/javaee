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
    <%--<script>--%>
        <%--$(function(){--%>
            <%--$("#nameId").click(function(){--%>
                <%--//获得select选中的值，就是我们自己设定的id值--%>
                <%--var sno = $("#student").val();--%>
                <%--//通过id在去获得value值--%>
                <%--sno1 = $("#"+sno).html();--%>
            <%--});--%>
        <%--});--%>
    <%--</script>--%>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong><span class="icon-key"></span> 添加报修</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/repair/addRepair.do">
            <div class="form-group">
                <div class="label">
                    <label >学号：</label>
                </div>

                <div class="field">
                    <label style="line-height:33px;">
                        <select id="nameId" name="sno" class="input" style="width:25% ">
                            <option name="sno" value="${sno}" selected>${sno}</option>
                        </select>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >报修设备：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" name="rname" size="50" placeholder="请输入要报修的设备" data-validate="required:请输入要报修的设备" />
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >报修原因：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50"  name="rcase" size="50" placeholder="请输入报修原因" data-validate="required:请输入报修原因" />
                    </label>
                </div>
            </div>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>公告时间：</label>--%>
                <%--</div>--%>

                <%--<div class="field">--%>
                    <%--<input type="text" id="test1" class="laydate-icon input w50" name="anno_data" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">--%>
                    <%--<script src="${pageContext.request.contextPath }/layDate-v5.0.9/laydate/laydate.js"></script> <!-- 改成你的路径 -->--%>
                    <%--<script>--%>
                        <%--//执行一个laydate实例--%>
                        <%--laydate.render({--%>
                            <%--elem: '#test1' //指定元素--%>
                        <%--});--%>
                    <%--</script>--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>

            <%--</div>--%>

            <div class="form-group">
                <div class="label">
                    <label>报修时间：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" id="test1" class="input w50" name="rtime" size="50" placeholder="请输入报修时间" data-validate="required:请输入报修时间" />
                        <script src="${pageContext.request.contextPath }/layDate-v5.0.9/laydate/laydate.js"></script> <!-- 改成你的路径 -->
                        <script>
                            //执行一个laydate实例
                            laydate.render({
                                elem: '#test1' //指定元素
                            });
                        </script>
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >报修宿舍：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <select name="rhouse" class="input" style="width:25% ">
                            <option name="rhouse" value="${rhouse}" selected>${rhouse}</option>
                        </select>
<%--                        <input type="text" class="input w50" name="rhouse" size="50" placeholder="请输入报修的宿舍" data-validate="required:请输入bao修的宿舍" />--%>
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

