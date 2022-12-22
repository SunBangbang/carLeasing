<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chengeUserPwd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 <link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <script type="text/javascript">
   		function subForm(){
   			var newPwd = document.getElementById('newUserPwd');
   			var okNewPwd = document.getElementById('okNewPwd');
   			if(newPwd.value == okNewPwd.value){
   				document.forms[0].submit();
   			}else{
   				alert("您输入的密码不一致，请重新输入。");
   				newPwd.value = "";
   				okNewPwd.value = "";
   				return ;
   			}
   		}
   </script>
  </head>
  <table class="maintable" border="0" width="100%" cellspacing="0">
  <tr>
    <td background="<%=basePath%>images/topBarBg.gif">用户管理</td>
    <td width="20" height="23" background="images/topBarBg.gif"><div align="right"><a href="#"><img src="<%=basePath%>images/iHelp.gif" width="16" height="16" border="0"></a></div></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">修改用户密码</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>

  <body>
    <form action="ChangeUserPwd.do" method="post" >
     <h5><font color="#FF0000">${requestScope.msg }</font></h5>
    <input type="hidden" name="userName" id="userPwd" value="${requestScope.user.userName }"/>
			<table class="maintable" width="100%" border="0" cellspacing="0">
				<tr>
					<td width="104"><div align="right">旧密码：</div>	</td>
				  <td width="201" height="24">
				  <input name="oldPwd" type="password" class="inputcontent" id="oldPwd" size="20"maxlength="16" /></td>
				 <td width="473" height="24">
				<font color="#FF0000">密码不能小于4位</font></td>
				</tr>
			
				<tr>
					<td width="104">
						<div align="right">
							新密码：</div></td>
				  <td height="24"><label></label><label>
				    <input	name="newUserPwd" type="password" class="inputcontent"id="newUserPwd" size="20"maxlength="16" />
				  </label></td>
					<td height="24">
						<div id="test_password" style="display:none">
						<font color="#FF0000">密码不能小于4位</font></div>	</td>
				</tr>
				
				<tr>
					<td width="104">
						<div align="right">
							确认密码：</div></td>
				  <td height="24">
						<input name="okNewPwd" type="password" class="inputcontent"id="okNewPwd"  size="20" maxlength="16" /></td>
					<td height="24">
						<div id="test_password" style="display:none">
						<font color="#FF0000">密码不能小于4位</font></div></td>
				</tr>
			</table>
			<table align="right" width="100%">
				<tr>
					<td height="30" width="70"></td>
					<td width="65">
					<img  src="<%=basePath%>images/carimg/ok.gif" onclick="subForm()" style="cursor: hand;">
					</td>
					<td width="96">
						<div align="center">
							<label>
								 <img  src="<%=basePath%>images/carimg/return.gif" onclick="history.back()" style="cursor: hand;">
							</label>
						</div>
					</td>
					<td width="60">&nbsp;
				  </td>
					<td width="486"></td>
				</tr>
				<tr>
					<td height="30" colspan="5" background="<%=basePath%>images/tab/bg.gif"></td>
				</tr>
			</table>
		</form>
  </body>
</html>
