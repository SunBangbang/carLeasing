<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findCustomers.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/public.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function subForm(){
			document.forms[0].submit();
		}
	</script>
  </head>
  <table border="0" width="100%" cellspacing="0">
	<tr>
		<td background="<%=basePath%>images/topBarBg.gif" height="23">客户管理</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">查询客户信息</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>

  <body>
    <form  action="FindCustomers.do" method="post" >
  <table class="maintable" width="97%" border="0" cellspacing="0">
    <tr>
      <td width="14%"><div align="center">身份证</div></td>
      <td width="23%"><input type="text" name="identity" id="identity" ></td>
      <td width="15%"><div align="center">姓名</div></td>
      <td width="48%"><input type="text" name="custName" id="custName"></td>
    </tr>
    <tr>
      <td><div align="center">地址</div></td>
      <td><input type="text" name="address" id="address" ></td>
       <td><div align="center">电话</div></td>
      <td><input type="text" name="phone" id="phone"></td>
      
    </tr>
    <tr>
      <td><div align="center">职业</div></td>
      <td><input type="text" name="career" id="career"></td>
     <td><div align="center">性别</div></td>
      <td>
     <select NAME="sex" id="sex" style="width: 80px;">
			<option value="男">男</option>
			<option value="女">女</option>
	</select>
      </td>
    </tr>
    <tr>
      <td><div align="center">密码 </div></td>
      <td><input type="password" name="custPwd" id="custPwd" size="21"></td>
    </tr>
    
  </table>
<table align="left" width="100%">
	<tr>
		<td height="107">
		<div align="center">
		<img  src="<%=basePath%>images/carimg/ok.gif" onclick="subForm()" style="cursor: hand;">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <img  src="<%=basePath%>images/carimg/reset.gif" onclick="reset()" style="cursor: hand;">
		</div>
	  </td>
	</tr>
	<tr>
		<td height="30" background="<%=basePath%>images/tab/bg.gif"></td>
	</tr>
</table>
</form>
  </body>
</html>
