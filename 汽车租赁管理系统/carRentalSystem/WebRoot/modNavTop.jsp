<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'modNavTop.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/public.css" rel="stylesheet" type="text/css" />
<script language="javascript">
    var showFlag=1;

    //显示/隐藏顶部及nav.
    function showHideHdNav()
    {
      var topFrameset=top.document.getElementById("top");
      if(showFlag==1)//当前显示,隐藏����
      {
        top.splitor.splitor.showHide(0);
        topFrameset.rows="0,*,0";
        showFlag=0;        
      }
      else
      {
        top.splitor.splitor.showHide(1);
        topFrameset.rows="101,*,23";
        showFlag=1;        
      }      
    }
  </script>
<title></title>
</head>
<body>
<div class="topBar">
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
    <tr>
      <td><span id="otherTools">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="100%"></td>
            <td width="20"><img class="pointer" src="images/iCollapseAll.gif" width="16" height="16" hspace="5" align="middle" alt="折叠" title="折叠" /></td>
            <td width="20"><img class="pointer" src="images/iRefresh.gif" width="16" height="16" hspace="5" align="middle" alt="刷新" title="刷新" />
            <td>
          </tr>
        </table>
        </span> </td>
      <td width="20"><img class="pointer" src="images/iShowHide.gif" width="16" height="16" hspace="5" align="middle" alt="隐藏/显示" title="隐藏/显示" onClick="javascript:showHideHdNav();" /></td>
    </tr>
  </table>
</div>
</body>
</html>