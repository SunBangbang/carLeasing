<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.bluedot.domain.User"%>
<%@page import="com.bluedot.common.Constants"%>
<%@page import="com.bluedot.domain.Menu"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
	html {
		overflow: hidden;
	}
	body {
		position: absolute;
		margin: 0px;
		padding: 0px;
		background: #EDF3FF;
		width: 100%;
		height: 100%;
	}
	#screen {
		position: absolute;
		left: 10%;
		top: 10%;
		width: 80%;
		height: 80%;
		background: #EDF3FF;
	}
	#screen img {
		position: absolute;
		cursor: pointer;
		visibility: hidden;
		width: 0px;
		height: 0px;
	}
	#screen .tvover {
		border: solid #876;
		opacity: 1;
		filter: alpha(opacity=100);
	}
	#screen .tvout {
		border: solid #fff;
		opacity: 0.7;
	}
	#bankImages {
		display: none;
	}
</style>
<SCRIPT language=javascript src="<%=basePath%>tree/js/dtree/dtree.js"></SCRIPT>
    <script type="text/javascript" src="<%=basePath%>tree/js/java-like.util.js"></script>
    <link rel="stylesheet" href="<%=basePath%>tree/js/dtree/dtree.css" type="text/css">

  </head>
  
  <body>
    <form action="" name="form1" method=POST>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="5" width="1" bgcolor="CCCCCC"></td>
            <td bgcolor="CCCCCC" height="1"></td>
            <td rowspan="4" bgcolor="CCCCCC" width="1"></td>
        </tr>
 
        <tr>
            <td bgcolor="E3E7FF" align="center" height="5"></td>
        </tr>
 
        <tr>
            <td bgcolor="CCCCCC" height="1"></td>
        </tr>
 
        <tr>
            <td bgcolor="F9F9F9" align="center" valign="top">
                <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="F5F5F5">
                    <tr bgcolor="F3F9FF">
                        <td bgcolor="F5F5F5">
                            <SCRIPT LANGUAGE="JavaScript">
                                d = new dTree('d');
                                d.config.target = "Main";
                                d.config.imageDir = 'tree/js/dtree/img';
                                d.reSetImagePath();
                                d.config.folderLinks = false;
                                d.config.closeSameLevel = true;
                                var isOpen ;
                                //根节点
                                <%
                                	User user = (User)session.getAttribute(Constants.USER_LOGIN_SESSION_KEY);
                                	if(user != null ){
                                	List list = user.getMenus();
                                	for(int i=0;i<list.size();i++){
                                	Menu m = (Menu)list.get(i);
                                	
                                %>
                                d.add(<%=m.getMenuId() %>, <%=m.getFatherId() %>, '<%=m.getMenuName() %>', '<%=m.getConnUrl() %>', '', 'Main');
                                
                                <%
                                	}
                                	}
                                %>
                               
                                document.write(d);
                            </script>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
 
        <tr>
            <td background="tree/images/jao1.gif" colspan="2" align="right"><img
                    src="tree/images/jao.gif" width="8" height="8"></td>
        </tr>
 
    </table>
</form>

  </body>
</html>
