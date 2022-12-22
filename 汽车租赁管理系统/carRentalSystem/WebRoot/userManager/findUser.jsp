<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/public.css">
	<script type="text/javascript">
		function subForm(){
			document.forms[0].submit();
		}
	</script>
  </head>
  
  <body>
<table border="0" width="100%" cellspacing="0">
	<tr>
		<td background="<%=basePath%>/images/topBarBg.gif" height="23">用户管理</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>/images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>/images/tab/middleSel.gif">
		<div align="center">查询用户信息</div>
		</td>
		<td width="50" background="<%=basePath%>/images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>/images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
<form  action="FindUser.do" method="post" >
  <table class="maintable" width="97%" border="0" cellspacing="0">
 
    <tr>
      <td width="14%"><div align="center">登录名</div></td>
      <td width="23%"><input type="text" name="userName" id="userName" >
      *<div id="test_names" style="display:none ">请填写身份证</div>      </td>
      <td width="15%"><div align="center">身份证</div></td>
      <td width="48%"><input type="text" name="identity" id="identity"></td>
    </tr>
    <tr>
      <td><div align="center">用户密码</div></td>
      <td><input type="text" name="userPwd" id="userPwd" ></td>
       <td><div align="center">联系电话</div></td>
      <td><input type="text" name="phone" id="phone"></td>
      
    </tr>
    <tr>
      <td><div align="center">地址</div></td>
      <td><input type="text" name="address" id="address"></td>
     <td><div align="center">性别</div></td>
      <td>
     <select NAME="sex" id="sex" style="width: 80px;">
			<option value="男">男</option>
			<option value="女">女</option>
		</select>

      </td>
     
    </tr>
    <tr>
      <td><div align="center">职位 </div></td>
      <td><input type="text" name="position" id="position"></td>
      <td><div align="center">用户类型</div></td>
      <td><label>
        <select name="userLevel">
        <c:if test="${requestScope.roles != null}">
        	<c:forEach var="role" items="${requestScope.roles}">
        	<option  value="${role.roleId }">${role.roleName }</option>
        	</c:forEach>
        </c:if>
        </select>
      </label></td>
    </tr>
    <tr>
    <td><div align="center">姓名</div></td>
      <td><input type="text" id="fullName" name="fullName"></td>
      
    </tr>
    
  </table>
<table align="left" width="100%">
	<tr>
		<td height="107">
		<div align="center"> <img  src="<%=basePath%>images/carimg/ok.gif" onclick="subForm()" style="cursor: hand;">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <img  src="<%=basePath%>images/carimg/reset.gif" onclick="reset()" style="cursor: hand;">
		</div>
	  </td>
	</tr>
	<tr>
		<td height="30" background="<%=basePath%>/images/tab/bg.gif"></td>
	</tr>
</table>
</form>
</body>

</html>
