<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>栏目管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script language="javascript" src="${pageContext.request.contextPath}/js/util.js"></script>
    <script>
        function shanchu(id) {
            alert("删除成功！");
            window.self.location.href = "${pageContext.request.contextPath}/newlabel/delete.do?id=" + id;
        }

        function show(label) {
            alert(label);
            alert("${label}");
            window.self.location.href = "${pageContext.request.contextPath}/newlabel/findOne.do?label_name=" + label;
        }
    </script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<center>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td height="25" align="center" valign="bottom" class="td06">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">&nbsp;</td>
                        <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                            <img src="${pageContext.request.contextPath}/images/main_28.gif" width="9" height="9" align="absmiddle"></td>
                        <td height="30" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                            <div align="left"><font color="#FFFFFF">栏目管理</font></div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form name="form1" method="post" action="">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
            <tr>
                <td colspan="2" class="td_02"><SPAN class=td_title>根据栏目名称查询</SPAN></td>
            </tr>
            <tr>
                <td width="14%" class="td_02">栏目名称</td>
                <td width="86%" class="td_02">
                    <%--<%--%>
                    <%--List<String> labels = (List<String>) session.getAttribute("labels");--%>
                    <%--//                        List<String> labels = newlabelService.findlabels();--%>
                    <%--// session.setAttribute("labels",labels);--%>

                    <%--%>--%>
                    <select name="parentLabel_name" class="input" style="width:99% "
                            onchange="window.location.href='${pageContext.request.contextPath}/newlabel/findAll01.do?label_name=' + options[selectedIndex].value">
                        <option name="parentLabel_name" value="parent_name" selected>--请选择--</option>
                        <c:forEach items="${labels}" var="label" varStatus="status">
                            <option name="parentLabel_name" value="${label}">${label}</option>
                        </c:forEach>
                    </select>
                </td>
                <%--<option value="${k.key }" ${KPIThis.parent.parent.thisId == k.key ? "selected" : ""}>${k.value}</option--%>
            </tr>
            <!--  <tr>
               <td class="td_02">二级栏目名称</td>
               <td class="td_02">
                 <select name="select" class="input" style="width:99% ">
                   <option value="1" selected>--请选择--</option>
                   <option value="2">天下足球</option>
                   <option value="3">我猜</option>
                 </select>
               </td>
             </tr> -->
        </table>
        <br>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_page" align="left">
                    <div align="right">
                        <input name="Submit" type="submit" class="buttonface02" value="添加栏目"
                               onClick="javascript:windowOpen('${pageContext.request.contextPath}/newlabel/findlabels.do','','',700,300,'','','')">
                    </div>
                </td>
            </tr>
        </table>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">

            <tr>
                <td colspan="5" align="right" class="td07">
                    <img src="${pageContext.request.contextPath}/images/1.gif" width="4" height="5" align="absmiddle">

                    <%--首頁--%>
                    <c:choose>
                        <c:when test="${page.pagenum == 1}">
                            <img src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">首页
                            <img src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">上一页
                        </c:when>
                        <c:otherwise>
                            <a href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=1">首页</a>
                            <%--<c:choose>--%>
                            <%--<c:when test="${page.pagenum == 1}">--%>
                            <%--<img src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">--%>
                            <%--<a href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.pagenum}">上一页</a>--%>
                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                            <img src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle">
                            <a href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.pagenum - 1}">上一页</a>
                            <%--</c:otherwise>--%>
                            <%--</c:choose>--%>
                        </c:otherwise>
                    </c:choose>



                    <%--<a--%>
                        <%--href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=1">首页</a>--%>
                    <%--<c:choose>--%>
                        <%--<c:when test="${page.pagenum == 1}">--%>
                            <%--<img src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle"> <a--%>
                                <%--href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.pagenum}">上一页</a>--%>
                        <%--</c:when>--%>
                        <%--<c:otherwise>--%>
                            <%--<img src="${pageContext.request.contextPath}/images/2.gif" width="3" height="5" align="absmiddle"> <a--%>
                                <%--href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.pagenum - 1}">上一页</a>--%>
                        <%--</c:otherwise>--%>
                    <%--</c:choose>--%>




                    <%--末页--%>
                    <c:choose>
                        <c:when test="${page.pagenum == page.totalPages}">
                            <img src="${pageContext.request.contextPath}/images/2-2.gif" width="3" height="5" align="absmiddle">下一页
                            <img src="${pageContext.request.contextPath}/images/3.gif" width="4" height="5" align="absmiddle">末页
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/images/2-2.gif" width="3" height="5" align="absmiddle">
                            <a href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.pagenum + 1}">下一页</a>
                            <img src="${pageContext.request.contextPath}/images/3.gif" width="4" height="5" align="absmiddle">
                            <a href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.totalPages}">末页</a>
                        </c:otherwise>
                    </c:choose>

                    <%--<c:choose>--%>
                        <%--<c:when test="${page.pagenum == page.totalPages}">--%>
                            <%--<img src="${pageContext.request.contextPath}/images/2-2.gif" width="3" height="5" align="absmiddle"> <a--%>
                                <%--href="${pageContext.request.contextPath}/newlabel/findAll.do?pagenum=${page.pagenum}">下一页</a>--%>
                        <%--</c:when>--%>
                       <%----%>
                    <%--</c:choose>--%>
                   　　共 ${page.totalPages}
                    页 ${page.totalRows} 条记录
                </td>
            </tr>
            <tr>
                <td width="17%" class="td_top">栏目名称</td>
                <td width="15%" class="td_top">上级栏目名称</td>
                <td width="44%" class="td_top">栏目描述</td>
                <td width="12%" class="td_top">删除</td>
                <td width="12%" class="td_top">修改</td>
            </tr>
            <tr>
                <td class="td07"></td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
            </tr>

            <c:forEach items="${page.datas}" var="data" varStatus="status">
                <tr>
                    <td class="td07">${data.label_name}</td>
                    <td class="td07">${data.parent.label_name}</td>
                    <td class="td07">${data.label_content}</td>
                    <td class="td07"><a href="#" onClick="shanchu('${data.id}')">删除</a></td>
                    <td class="td07"><a href="#"
                                        onClick="javascript:windowOpen('${pageContext.request.contextPath}/newlabel/update01.do?label_name=${data.label_name}&id=${data.id}','','',670,260,'no','yes','100','100')">修改</a>
                    </td>
                </tr>
            </c:forEach>
            <tr>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
            </tr>
            <tr>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
                <td class="td07">&nbsp;</td>
            </tr>
        </table>
        <p>&nbsp;</p>
    </form>
</center>
</body>
</html>

