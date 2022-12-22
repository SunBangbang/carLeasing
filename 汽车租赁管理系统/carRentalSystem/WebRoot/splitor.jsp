<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'splitor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/public.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/constants.js"></script>
<script language="javascript" src="js/pubUtil.js"></script>
<script language="javascript" src="js/splitor.js"></script>
  <script language="javascript">
    var splitor=new FrameSplitor("middle",1,1,1,25);
    function init()
    {      
      splitor.init();
      document.onmousedown=function(ev){splitor.mouseDown(ev)};
      document.onmouseup=function(ev){splitor.mouseUp(ev);}
      document.onmousemove=function(ev){splitor.mouseMove(ev)};
      window.onresize=function(ev){};
      splitor.hideCallback=function()
      {
        PubUtil.showHideElement("navTree",false,top.modNav.document);
        PubUtil.showHideElement("otherTools",false,top.modNavTop.document);
      }

      splitor.showCallback=function()
      {
        PubUtil.showHideElement("navTree",true,top.modNav.document);
        PubUtil.showHideElement("otherTools",true,top.modNavTop.document);
      }

      splitor.moveCallback=function()
      {
        PubUtil.showHideElement("navTree",true,top.modNav.document);
        PubUtil.showHideElement("otherTools",true,top.modNavTop.document);
      }
    }
  </script>
  </head>
  
 <body onLoad="javascript:init();" leftmargin="0" topmargin="0">
<table style="cursor:e-resize" class="pointer" width="100%" height="100%" background="images/splitor7.gif" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="middle"><img id="mover" class="pointer" src="images/leftMove.gif" width="7" height="54" onClick="javascript:splitor.showHide();" title="弹入/弹出" /></td>
  </tr>
</table>
</body>
</html>
