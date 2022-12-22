<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foot.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="css/public.css" rel="stylesheet" type="text/css" >
  </head>
  
  <body>
   <table class="footerBg" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="footerMsg"><p>网站首页  |  公司介绍  |  外包服务  |  解决方案  |  成功案例  |  诚聘英才  |  联系我们  |  网站地图<BR>
      </p></td>
  </tr>
</table>
  </body>
</html>
