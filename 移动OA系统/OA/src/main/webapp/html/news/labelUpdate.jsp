<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019-12-5
  Time: 21:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>栏目管理</title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <script>
        function xiugai2(id) {
            alert("修改成功！");
           // window.self.location.href = "${pageContext.request.contextPath}/newlabel/update.do?id=" + id;
            // window.close();
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
                        <td width="2%" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif"><img
                                src="${pageContext.request.contextPath}/images/main_28.gif" width="9" height="9" align="absmiddle"></td>
                        <td height="30" valign="middle" background="${pageContext.request.contextPath}/images/bg_03.gif">
                            <div align="left"><font color="#FFFFFF">栏目修改</font></div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <form name="form1" method="post" action="${pageContext.request.contextPath}/newlabel/update.do?id=${newlabel01.id}">
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="table01">
            <tr>
                <td class="td_02">栏目名称</td>
                <td class="td_02"><input name="label_name" type="text" class="input" value="${newlabel01.label_name}"
                                         style="width:99% "></td>
            </tr>
            <tr>
                <td class="td_02">上级栏目名称</td>
                <td class="td_02">
                    <select name="parentLabel_name" class="input" style="width:99% ">
                        <option name="parentLabel_name" value="${newlabel01.parent.label_name}" selected>${newlabel01.parent.label_name}</option>
                        <c:forEach items="${labels}" var="label" varStatus="status">
                            <c:if test="${label != newlabel01.label_name}">
                                <option name="parentLabel_name" value="${label}">${label}</option>
                            </c:if>
                            <%--<c:if test="${label} == ${newlabel01.label_name}">--%>
                            <%--</c:if>--%>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td width="14%" class="td_02">栏目描述</td>
                <td width="86%" class="td_02">
                    <textarea name="label_content" rows="5" style="width:99% ">${newlabel01.label_content}</textarea>
                </td>
            </tr>
        </table>
        <br>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td_page">
                    <div align="center">
                        <input name="Submit" type="submit" class="buttonface02" value="  修 改  " onClick="xiugai2()">
                        &nbsp;&nbsp;
                        <input name="Submit" type="reset" class="buttonface02" value="  重 置  ">
                        &nbsp;
                        <input name="Submit" type="submit" class="buttonface02" value="  关 闭  "
                               onClick="window.close()">
                    </div>
                </td>
            </tr>
        </table>
        <p>&nbsp;</p>
    </form>
</center>
</body>
</html>


