<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rentManager.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/public.css">
	 <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
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
		<td background="<%=basePath%>images/topBarBg.gif" height="23">业务管理</td>
		<td width="20" height="23" background="images/topBarBg.gif"><div align="right"><a href="#"><img src="<%=basePath%>images/iHelp.gif" width="16" height="16" border="0"></a></div></td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">出租单管理</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
      <form  action="RentManagerSearch.do" method="post" >
        <h5><font color="red">${requestScope.msg }</font></h5>
  <table class="maintable" width="97%" border="0" cellspacing="0">
    <tr>
      <td width="14%"><div align="center">出租单编号</div></td>
      <td width="23%"><input type="text" name="tableId" id="tableId" ></td>
      <td width="15%"><div align="center">起租日期</div></td>
      <td width="48%"><input class="Wdate" type="text" name="beginDate" id="beginDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
    </tr>
    <tr>
      <td><div align="center">应归还日期</div></td>
      <td><input class="Wdate" type="text" name="shouldReturnDate" id="shouldReturnDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
       <td><div align="center">归还日期</div></td>
      <td><input class="Wdate" type="text" name="returnDate" id="returnDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
      
    </tr>
    <tr>
      <td><div align="center">客户号</div></td>
      <td><input type="text" name="identity" id="identity"></td>
     <td><div align="center">车号</div></td>
     <td><input type="text" name="carNumber" id="carNumber"></td>
    </tr>
    <tr>
      <td><div align="center">出租单状态 </div></td>
       <td>
     <select name="rentFlag" id="rentFlag" style="width: 80px;">
			<option value="0">出租中</option>
			<option value="1">已入库</option>
	</select>
      </td>
      <td><div align="center">服务人员编号</div></td>
      <td><input type="text" name="userName" id="userName"></td>
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
