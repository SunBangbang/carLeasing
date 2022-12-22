<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="JavaScript">

 today=new Date();
 function initArray(){
   this.length=initArray.arguments.length
   for(var i=0;i<this.length;i++)
   this[i+1]=initArray.arguments[i]  }
   var d=new initArray(
     "星期日",
     "星期一",
     "星期二",
     "星期三",
     "星期四",
     "星期五",
     "星期六");

</script>

<script language="JavaScript">
function tick() {
var hours, minutes, seconds, xfile;
var intHours, intMinutes, intSeconds;
var today;
today = new Date();
intHours = today.getHours();
intMinutes = today.getMinutes();
intSeconds = today.getSeconds();
if (intHours == 0) {
hours = "12:";
xfile = "午夜";
} else if (intHours < 12) {
hours = intHours+":";
xfile = "上午";
} else if (intHours == 12) {
hours = "12:";
xfile = "正午";
} else {
intHours = intHours - 12
hours = intHours + ":";
xfile = "下午";
}
if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
}
timeString = xfile+hours+minutes+seconds;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 100);
}
window.onload = tick;
</script>
<script type="text/javascript">
	function exitSystem(){
	if(!confirm('您真的要退出吗？')){
	
	}else{
		document.location = "ExitSystem.do";
	}
	}
</script>
</head>
<body>
<table width="100%" border="0" height="21" bgcolor="#0E5281"cellpadding="0" cellspacing="0">
  <tr>
  <td width="5%" class="hdMsg">
    <td width="25%" class="hdMsg"><font color="#ffffff" style='font-size:14px'>用户：${sessionScope.user.userName }&nbsp;您好！您当前登录的角色是：${sessionScope.user.role.roleName }</font></td>
    <td width="45%" class="hdMsg">
	<table height="20" align="center">
   <tr>
     <td class="hdMsg" ><font color=#ffffff style='font-size:14px'> 今天是：</font></td>
     <td align="center" valign="middle" class="hdMsg">
	<script language=JavaScript>
	document.write(
     "<font color=#ffffff style='font-size:12px'> ",
     today.getFullYear(),"年",
     today.getMonth()+1,"月",
     today.getDate(),"日",
     d[today.getDay()+1],
     "</font>" );
	</script></td>
	 <td align="center" valign="middle">
       <div id="Clock" align="center" style="font-size: 12px; color:#ffffff"></div> 
	 </td>
   </tr>
</table>
	</td>
    <td width="7%"></td>
    <td width="23%"><table bgcolor="black" bgheight="20" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="bottom"><img src="images/left_bottom.gif" width="4" height="4" /></td>
          <td><img src="images/home.gif" width="54" height="21" /></td>
          <td><img src="images/help.gif" width="54" height="21" onClick="javascript:alert('请参考使用说明!');"/></td>
          <td><a href="" onFocus="this.blur();" target="_top" onClick="exitSystem()"><img src="images/exit.gif" width="52" height="21" border="0"  /></a></td>
          <td valign="bottom"><img src="images/right_bottom.gif" width="4" height="4" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/top.jpg" width="100%" height="76" /></td>
  </tr>
  <tr height="4px" bgcolor="#0E5281"><td></td></tr>
</table>
</body>
</html>
