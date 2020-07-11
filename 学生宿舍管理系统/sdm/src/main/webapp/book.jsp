<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/24 0024
  Time: 下午 4:02
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
<form method="post" action="">
    <div class="panel admin-panel">
        <div class="panel-head"><strong class="icon-reorder"> 公告管理</strong></div>
        <table class="table table-hover text-center">
            <tr>
                <th width="120">ID</th>
                <th>姓名</th>
                <th>学号</th>
                <th>电话</th>
                <th>宿舍号</th>
                <th width="25%">公告内容</th>
                <th width="120">公告时间</th>
                <th>操作</th>
            </tr>


            <c:forEach var="announcement" items="${announcements }" varStatus="status">
                <tr>
                    <td><input type="checkbox" name="id[]" value="1" />${status.index+1 }</td>
                    <td align="center">${announcement.anno_name }</td>
                    <td align="center">${announcement.anno_sid }</td>
                    <td align="center">${announcement.anno_phone }</td>
                    <td align="center">${announcement.anno_address }</td>
                    <td align="center">${announcement.anno_content }</td>
                    <td align="center">${announcement.anno_data }</td>
                    <td><div class="button-group"> <a class="button border-red" href="javascript:void(0)" onClick="del('${announcement.anno_id}')"><span class="icon-trash-o"></span> 删除</a> </div></td>

                </tr>
            </c:forEach>

            <tr>
                <td colspan="8">
                    <div class="pagelist">
                        <a href="${pageContext.request.contextPath}/sdm/findAnnouncement.do?pageNum=1">首页</a>
                        <a href="${pageContext.request.contextPath}/sdm/findAnnouncement.do?pageNum=${pageInfo.pageNum-1}">上一页</a>
                        <a href="${pageContext.request.contextPath}/sdm/findAnnouncement.do?pageNum=${pageInfo.pageNum+1}">下一页</a>
                        <a href="${pageContext.request.contextPath}/sdm/findAnnouncement.do?pageNum=${pageInfo.pages}">尾页</a>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</form>
<script type="text/javascript">

    function del(anno_id){
        if(confirm("您确定要删除吗?")){
            alert("删除成功！");
            window.self.location.href = "${pageContext.request.contextPath}/sdm/deleteAnnouncement.do?anno_id=" + anno_id;
        }
    }

    $("#checkall").click(function(){
        $("input[name='id[]']").each(function(){
            if (this.checked) {
                this.checked = false;
            }
            else {
                this.checked = true;
            }
        });
    })

    function DelSelect(){
        var Checkbox=false;
        $("input[name='id[]']").each(function(){
            if (this.checked==true) {
                Checkbox=true;
            }
        });
        if (Checkbox){
            var t=confirm("您确认要删除选中的内容吗？");
            if (t==false) return false;
        }
        else{
            alert("请选择您要删除的内容!");
            return false;
        }
    }

</script>
</body></html>