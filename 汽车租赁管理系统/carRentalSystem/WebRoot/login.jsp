<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" session="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		if(window.parent.length > 0){
			window.parent.location = "login.jsp";
		}
	</script>
	<style type="text/css">
<!--
a{ color:#008EE3}
a:link  { text-decoration: none;color:#008EE3}
A:visited {text-decoration: none;color:#666666}
A:active {text-decoration: underline}
A:hover {text-decoration: underline;color: #0066CC}
A.b:link {
	text-decoration: none;
	font-size:12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}
A.b:visited {
	text-decoration: none;
	font-size:12px;
	font-family: "Helvetica,微软雅黑,宋体";
	color: #FFFFFF;
}
A.b:active {
	text-decoration: underline;
	color: #FF0000;

}
A.b:hover {text-decoration: underline; color: #ffffff}

.table1 {
	border: 1px solid #CCCCCC;
}
.font {
	font-size: 12px;
	text-decoration: none;
	color: #999999;
	line-height: 20px;
	

}
.input {
	font-size: 12px;
	color: #999999;
	text-decoration: none;
	border: 0px none #999999;


}

td {
	font-size: 12px;
	color: #007AB5;
}
form {
	margin: 1px;
	padding: 1px;
}
input {
	border: 0px;
	height: 26px;
	color: #007AB5;

	.unnamed1 {
	border: thin none #FFFFFF;
}
.unnamed1 {
	border: thin none #FFFFFF;
}
select {
	border: 1px solid #cccccc;
	height: 18px;
	color: #666666;

	.unnamed1 {
	border: thin none #FFFFFF;
}
body {
	background-repeat: no-repeat;
	background-color: #9CDCF9;
	background-position: 0px 0px;

}
.tablelinenotop {
	border-top: 0px solid #CCCCCC;
	border-right: 1px solid #CCCCCC;
	border-bottom: 0px solid #CCCCCC;
	border-left: 1px solid #CCCCCC;
}
.tablelinenotopdown {

	border-top: 1px solid #eeeeee;
	border-right: 1px solid #eeeeee;
	border-bottom: 1px solid #eeeeee;
	border-left: 1px solid #eeeeee;
}
.style6 {FONT-SIZE: 9pt; color: #7b8ac3; }

-->
</style>
  </head>
  
  <body>
  <center><h3><font color="red">${requestScope.msg }</font></h3></center>
   <form method="post" action="Login.do" name="NETSJ_Login">
  	<table width="681" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:120px">
  <tr>
    <td width="353" height="259" align="center" valign="bottom" background="<%=basePath%>img/Images/login_1.gif"><table width="90%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td align="right" valign="bottom" style="color:#05B8E4"> <a href="http://www.865171.cn" target="_blank"></a> </td>
      </tr>
    </table></td>
    <td width="195" background="<%=basePath%>img/Images/login_2.gif"><table width="190" height="106" border="0" align="center" cellpadding="2" cellspacing="0">
            <tr>
              <td height="50" colspan="2" align="left">&nbsp;</td>
            </tr>
            <tr>
              <td width="60" height="30" align="left">用户名</td>
              <td><input name="userName" type="TEXT" style="background:url(<%=basePath%>img/Images/login_6.gif) repeat-x; border:solid 1px #27B3FE; height:20px; background-color:#FFFFFF" id="UserName"size="14"></td>
            </tr>
            <tr>
              <td height="30" align="left">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
              <td><input name="userPwd" TYPE="PASSWORD" style="background:url(<%=basePath%>img/Images/login_6.gif) repeat-x; border:solid 1px #27B3FE; height:20px; background-color:#FFFFFF" id="Password" size="16"></td>
            </tr>
   
              <td height="40" colspan="2" align="center"><img src="<%=basePath%>img/Images/tip.gif" width="16" height="16"> 请勿非法登陆！</td>
          <tr>
              <td colspan="2" align="center"><input type="submit" name="submit" style="background:url(<%=basePath%>img/Images/login_5.gif) no-repeat" value=" 登  陆 "> 
			  <input type="reset" name="Submit" style="background:url(<%=basePath%>img/Images/login_5.gif) no-repeat" value=" 取  消 "></td>
            <tr>
              <td height="5" colspan="2"></td>
        </tr>
    </table></td>
    <td width="133" background="<%=basePath%>img/Images/login_3.gif">&nbsp;</td>
  </tr>
  <tr>
    <td height="161" colspan="3" background="<%=basePath%>img/Images/login_4.gif"></td>
  </tr>
</table>
</form>
  </body>
</html>
