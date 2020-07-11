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
    <div class="panel-head"><strong><span class="icon-key"></span> 修改报修信息</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/repair/updateRepair.do?rid=${repairRid.rid}">
            <div class="form-group">
                <div class="label">
                    <label >学号：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        ${repairRid.sno}<input name="sno" type="hidden" value="${repairRid.sno}" />
                    </label>
                </div>
            </div>

            <div class="form-group">
                <div class="label">
                    <label >姓名：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        ${repairRid.sname}<input type="hidden" name="sname" value="${repairRid.sname}" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >报修设备：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="rname" size="50" value="${repairRid.rname}" data-validate="required:请输入报修设备" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >报修原因：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50" name="rcase" size="50" value="${repairRid.rcase}" data-validate="required:请输入报修原因" />
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >报修日期：</label>
                </div>
                <%--<div class="field">--%>
                    <%--<label style="line-height:33px;">--%>
                        <%--<input type="text" class="input w50"  name="rtime" size="50" value="${repairRid.rtime}" data-validate="required:请输入要报修的日期" />--%>
                    <%--</label>--%>
                <%--</div>--%>
                <div class="field">
                    <input type="text" id="test1" value="${repairRid.rtime}}" class="laydate-icon input w50" name="rtime" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                    <script src="${pageContext.request.contextPath }/layDate-v5.0.9/laydate/laydate.js"></script> <!-- 改成你的路径 -->
                    <script>
                        // 执行一个laydate实例
                        laydate.render({
                            elem: '#test1' //指定元素
                        });
                    </script>
                    <div class="tips"></div>
                </div>
            </div>
            <div class="form-group">
                <div class="label">
                    <label >报修宿舍：</label>
                </div>
                <div class="field">
                    <label style="line-height:33px;">
                        <input type="text" class="input w50"  name="rhouse" size="50" value="${repairRid.rhouse}" data-validate="required:请输入要报修的宿舍" />
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

