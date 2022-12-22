<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'checkManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script> 
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
   <table class="maintable" border="0" width="100%" cellspacing="0">
  <tr>
    <td background="<%=basePath%>images/topBarBg.gif">业务管理</td>
    <td width="20" height="23" background="<%=basePath%>images/topBarBg.gif"><div align="right"><a href="#"><img src="<%=basePath%>images/iHelp.gif" width="16" height="16" border="0"></a></div></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">检查单管理</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
    <form  action="FindCheckTable.do" method="post" >
        <h5><font color="red">${requestScope.msg }</font></h5>
  <table class="maintable" width="97%" border="0" cellspacing="0">
    <tr>
      <td width="14%"><div align="center">检查单号</div></td>
      <td width="23%"><input type="text" name="checkId" id="checkId" ></td>
      <td width="15%"><div align="center">检查时间</div></td>
      <td width="48%"><input class="Wdate" type="text" name="checkDate" id="checkDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
    </tr>
    <tr>
      <td><div align="center">检查员</div></td>
      <td><input type="text" name="userName" id="userName" ></td>
       <td><div align="center">出租单号</div></td>
      <td><input type="text" name="tableId" id="tableId"></td>
      
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
