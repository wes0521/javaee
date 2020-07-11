<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/24 0024
  Time: 下午 4:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <script>
        function tianjia()
        {
            var str = confirm("是否确定添加此栏目？");
            if(str == true)
            {
                alert("确定添加！");
            }
            else
            {
                alert("取消添加！");
            }
        }
    </script>
</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>添加公告</strong></div>
    <div class="body-content">
        <form method="post" class="form-x" action="${pageContext.request.contextPath}/anno/addAnno.do">


            <div class="form-group">
                <div class="label">
                    <label>公告名：</label>
                </div>
                <div class="field">
                    <input type="text" class="input w50" value="" name="anno_name" data-validate="required:请输入姓名" />
                    <div class="tips"></div>
                </div>
            </div>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>学号：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<input type="text" class="input w50" value="" name="anno_sid" data-validate="required:请输入姓名" />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>电话：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<input type="text" class="input w50" value="" name="anno_phone" data-validate="required:请输入姓名" />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>宿舍号：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<input type="text" class="input w50" value="" name="anno_address" data-validate="required:请输入姓名" />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="form-group">
            <div class="label">
                <label>公告内容：</label>
            </div>
            <div class="field">
                <textarea cols="10" rows="10"  class="input w50" value="" name="anno_content"></textarea>

                <%--<input type="text" class="input w50" style="width: 500px;height: 100px;" value="" name="anno_content" data-validate="required:请输入公告内容" />--%>
                <div class="tips"></div>
            </div>
        </div>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>公告内容：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<input type="text" class="input w50" value="" name="anno_content" data-validate="required:请输入内容" />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="form-group">
                <div class="label">
                    <label>公告时间：</label>
                </div>
                <div class="field">
                    <input type="date" class="input w50" value="" name="anno_data" data-validate="required:请输入日期" />
                    <div class="tips"></div>
                </div>
            </div>



            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>内容：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<textarea name="content" class="input" style="height:450px; border:1px solid #ddd;"></textarea>--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>公告时间：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<label style="line-height:33px;">--%>
                        <%--<input type="text" id="test1" class="input w50" name="anno_data" size="50" placeholder="请输入时间" data-validate="required:请输入时间" />--%>
                        <%--<script src="${pageContext.request.contextPath }/layDate-v5.0.9/laydate/laydate.js"></script> <!-- 改成你的路径 -->--%>
                        <%--<script>--%>
                            <%--//执行一个laydate实例--%>
                            <%--laydate.render({--%>
                                <%--elem: '#test1' //指定元素--%>
                            <%--});--%>
                        <%--</script>--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--&lt;%&ndash;<div class="field">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<script src="${pageContext.request.contextPath }/js/laydate/laydate.js"></script>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<input type="text" class="laydate-icon input w50" name="anno_data" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value=""  data-validate="required:日期不能为空" style="padding:10px!important; height:auto!important;border:1px solid #ddd!important;" />&ndash;%&gt;--%>
                    <%--<div class="tips"></div>--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--</div>--%>

            <%--<div class="form-group">--%>
                <%--<div class="label">--%>
                    <%--<label>作者：</label>--%>
                <%--</div>--%>
                <%--<div class="field">--%>
                    <%--<input type="text" class="input w50" name="authour" value=""  />--%>
                    <%--<div class="tips"></div>--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="form-group">
                <div class="label">
                    <label></label>
                </div>
                <div class="field">
                    <button class="button bg-main icon-check-square-o" type="submit" > 提交</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button class="button bg-main icon-check-square-o" type="reset"> 重置</button>
                    <%--<input name="Submit" type="submit" class="button bg-main icon-check-square-o" value="  提 交  " onClick="tianjia()">--%>
                </div>

            </div>
        </form>
    </div>
</div>

</body>
</html>