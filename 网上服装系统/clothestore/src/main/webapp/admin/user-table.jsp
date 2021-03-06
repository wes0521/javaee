﻿<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
  <meta name="description" content=""/>
  <meta name="author" content=""/>
  <title>商品列表</title>
  <style>
    td{
      line-height: 40px;
      text-align: center;
    }
    tr th{
      text-align: center;
    }
  </style>
  <!--favicon-->
  <link rel="icon" href="${pageContext.request.contextPath}/admin/assets/images/favicon.ico" type="image/x-icon">
  <!-- simplebar CSS-->
  <link href="${pageContext.request.contextPath}/admin/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet"/>
  <!-- Bootstrap core CSS-->
  <link href="${pageContext.request.contextPath}/admin/assets/css/bootstrap.min.css" rel="stylesheet"/>
  <!-- animate CSS-->
  <link href="${pageContext.request.contextPath}/admin/assets/css/animate.css" rel="stylesheet" type="text/css"/>
  <!-- Icons CSS-->
  <link href="${pageContext.request.contextPath}/admin/assets/css/icons.css" rel="stylesheet" type="text/css"/>
  <!-- Sidebar CSS-->
  <link href="${pageContext.request.contextPath}/admin/assets/css/sidebar-menu.css" rel="stylesheet"/>
  <!-- Custom Style-->
  <link href="${pageContext.request.contextPath}/admin/assets/css/app-style.css" rel="stylesheet"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/assets/layui/css/layui.css">
  <script src="${pageContext.request.contextPath}/admin/assets/layui/layui.js"></script>
  <script>
    function queryUserByIDA(userID) {
      $.post("${pageContext.request.contextPath}/admin/member/findUserByIDA?userID="+userID,function (data) {
        var str1="";
        // alert(data);
        // data=JSON.parse(data);
        if (data.userSex=="男"){
          str1+=' <option value="男" selected>男</option>\n' +
                  '<option value="女">女</option>'
        }else{
          str1 +=' <option value="男" >男</option>\n' +
                  '<option value="女" selected>女</option>'
        }
        $("#studentSex").html(str1);
        $("#input-1").val(data.userName);
        $("#input-2").val(data.userPassword);
        $("#input-3").val(data.userID);
        // alert($("#studentSex"));
        // alert($("#input-1"));
        // alert($("#input-2"));
        // alert($("#input-3"));
      })
    }
    function deleteUserByIDA(userID) {
      if (confirm("您确定要删除吗")){
        location.href="${pageContext.request.contextPath}/admin/member/removeUserByIDA?userID="+userID
      }
    }
  </script>

</head>

<body>

<!-- Start wrapper-->
<div id="wrapper">

  <!--Start sidebar-wrapper-->
  <jsp:include page="admin-menu.jsp"/>
  <!--End sidebar-wrapper-->

  <!--Start topbar header-->
  <header class="topbar-nav">
    <nav class="navbar navbar-expand fixed-top bg-white">
      <ul class="navbar-nav mr-auto align-items-center">
        <li class="nav-item">
          <a class="nav-link toggle-menu" href="javascript:void(0);">
            <i class="icon-menu menu-icon"></i>
          </a>
        </li>
      </ul>
    </nav>
  </header>
  <!--End topbar header-->

  <div class="clearfix"></div>

  <div class="content-wrapper">
    <div class="container-fluid">



      <!--Start Dashboard Content-->
      <div class="col-lg-12">
        <div style="float: left">
          <form class="form-inline" action="${pageContext.request.contextPath}/admin/member/AdminFindUserList" method="post">
            <div class="form-group">
              <label for="name">用户名</label>
              <input type="text" class="form-control" value="${userRname}" id="name" name="userRname" >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
          </form>
        </div>
        <table class="table table-info table-striped shadow-info gradient-influenza">
          <thead>
          <tr>
            <th scope="col">id</th>
            <th scope="col">用户名</th>
            <th scope="col">密码</th>
            <th scope="col">真实姓名</th>
            <th scope="col">性别</th>
            <th scope="col">消费金额</th>
            <th scope="col" style="text-align: center">操作</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${users}" var="user" varStatus="s">
            <tr>
              <td scope="row">${s.count}</td>
              <td>${user.userName}</td>
              <td>${user.userPassword}</td>
              <td>${user.userRname}</td>
              <td>${user.userSex}</td>
              <td><span style="color: red">${user.userConsume}</span>元</td>
              <td>
                <button type="button" onclick="queryUserByIDA(${user.userID})" class="btn btn-success btn-sm waves-effect waves-light m-1" data-toggle="modal" data-target="#modal-animation-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">修改</font></font></button>
                <a type="button" onclick="deleteUserByIDA(${user.userID})" class="btn btn-danger btn-sm waves-effect waves-light m-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">删除</font></font></a>
              </td>
              <div class="modal fade" id="modal-animation-1">
                <div class="modal-dialog">
                  <div class="modal-content animated flipInX">
                    <div class="modal-header">
                      <h5 class="modal-title">修改用户</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <form action="${pageContext.request.contextPath}/admin/member/modifyUserA" method="post">
                        <div class="form-group">
                          <label for="input-1"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">账号</font></font></label>
                          <input type="text" class="form-control" id="input-1" name="userName" readonly="readonly" >
                        </div>
                        <div class="form-group">
                          <label for="input-2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">密码</font></font></label>
                          <input type="text" class="form-control" id="input-2" name="userPassword" required="required">
                        </div>
                        <div class="form-group">
                          <label>性别</label>
                          <select class="form-control" name="userSex" id="studentSex" required="required">
                            <option value="男">男</option>
                            <option value="女">女</option>
                          </select>
                        </div>
                        <input id="input-3" name="userID" type="hidden">
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary shadow-primary px-5"><i class="icon-lock"></i><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">确认修改</font></font></button>
                        </div>
                      </form>

                    </div>
                  </div>
                </div>
              </div>
            </tr>
          </c:forEach>

          </tbody>
        </table>
        <div id="test1" align="center"></div>
      </div>
      <!--End Dashboard Content-->

    </div>
    <!-- End container-fluid-->

  </div><!--End content-wrapper-->
  <!--Start Back To Top Button-->
  <a href="javaScript:void(0);" class="back-to-top"><i class="fa fa-angle-double-up"></i> </a>
  <!--End Back To Top Button-->


</div>

<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath}/admin/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/assets/js/bootstrap.min.js"></script>

<!-- simplebar js -->
<script src="${pageContext.request.contextPath}/admin/assets/plugins/simplebar/js/simplebar.js"></script>
<!-- waves effect js -->
<script src="${pageContext.request.contextPath}/admin/assets/js/waves.js"></script>
<!-- sidebar-menu js -->
<script src="${pageContext.request.contextPath}/admin/assets/js/sidebar-menu.js"></script>
<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/admin/assets/js/app-script.js"></script>
<!-- Chart js -->
<script src="${pageContext.request.contextPath}/admin/assets/plugins/Chart.js/Chart.min.js"></script>
<!--Peity Chart -->
<script src="${pageContext.request.contextPath}/admin/assets/plugins/peity/jquery.peity.min.js"></script>
<!-- Index js -->
<script src="${pageContext.request.contextPath}/admin/assets/js/index.js"></script>
<script>
  layui.use('laypage', function(){
    var laypage = layui.laypage;

    //执行一个laypage实例
    laypage.render({
      elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
      ,count: ${pageModel.recordCount} //数据总数，从服务端得到
      ,limit: ${pageModel.pageSize}
      ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
      ,curr: ${pageModel.pageIndex}
      ,jump: function(obj, first){
        //obj包含了当前分页的所有参数，比如：
        console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
        console.log(obj.limit); //得到每页显示的条数

        //首次不执行
        if(!first){
          //改变切换页面的时候，再次查找数据
          window.location.href="${pageContext.request.contextPath}/admin/member/AdminFindUserList?pageSize="+obj.limit+"&pageIndex="+obj.curr+"&userRname=${userRname}";
        }
      }
    });
  });

</script>
</body>
</html>
