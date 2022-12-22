<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>汽车租赁系统 V1.0</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <frameset id="top" rows="101,*,23" border="0" frameborder="0">
  <frame name="header" frameborder="0" src="head.jsp" noresize="noresize" scrolling="no" marginheight="0" marginwidth="0" />
  <frameset id="middle" cols="190,7,*" border="0" frameborder="0">
    <frameset rows="23,*" border="0" frameborder="0">
      <frame name="modNavTop" frameborder="0" src="modNavTop.jsp" noresize="noresize" scrolling="no" marginheight="0" marginwidth="0" />
      <frame name="modNav" frameborder="0" src="menu.jsp" noresize="noresize" scrolling="auto" marginheight="0" marginwidth="0" />
    </frameset>
    <frame name="splitor" frameborder="0" src="splitor.jsp" noresize="noresize" scrolling="no" marginheight="0" marginwidth="0" />
    <frame name="Main" frameborder="0" src="welcome.jsp" scrolling="yes" marginheight="0" marginwidth="0" />
  </frameset>
  <frame name="footer" frameborder="0" src="foot.jsp" noresize="noresize" scrolling="no" marginheight="0" marginwidth="0" />
</frameset>
<noframes></noframes>  
</html>
