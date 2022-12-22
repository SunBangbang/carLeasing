<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'viewCheckTables.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/public.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function subForm(pageIndex){
				document.getElementById('pageIndex').value = pageIndex;	
				document.forms[0].submit();
		}
		function subGo(index){
		var obj = document.getElementById('goPage').value;
		if(obj > index){
		alert("超出页数，请重新填写");
		return ;
		}else if(obj <= 0){
			alert("输入页数有误请重新输入");
			return ;
		}else{
		document.getElementById('pageIndex').value = obj;	
				document.forms[0].submit();
		 }
	  }
	  function checkAll(){
		var obj = document.getElementById("all");
		var arr = document.getElementsByName("dels");
		for(var i = 0; i < arr.length; i++)
		{
			arr[i].checked = obj.checked;
			
		} 
	}
	  function preUpdateCheckTable(checkId){
	  	document.forms[0].action = 'PreUdateCheckTable.do';
	  	document.getElementById('checkId').value = checkId;
	  	document.forms[0].submit();
	  }
	  function deleteCheckTables(){
	  	document.forms[0].action = 'DeleteCheckTables.do';
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
		<div align="center">检查单查询结果</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
    <form action="FindCheckTable.do" method="post">
  <h5><font color="#FF0000">${requestScope.msg }</font></h5>
  <input type="hidden" name="checkId" value="${requestScope.checkId }" id="checkId">
  <input type="hidden" name="checkDate" value="${requestScope.checkDate }">
  <input type="hidden" name="userName" value="${requestScope.userName }">
  <input type="hidden" name="tableId" value="${requestScope.tableId }">
  <input type="hidden" name="pageIndex" value="" id="pageIndex">
    <table class="tablelistcontent" width="100%" border="1" cellspacing="1">
      <tr>
        <th width="29"><input type="checkbox" name="checkbox" id="all" value="checkbox" onClick="checkAll()"></th>
        <th width="150">序号</th>
        <th width="203">检查单号</th>
        <th width="203">检查时间</th>
        <th width="224">检查员</th>
        <th width="195">问题</th>
        <th width="195">陪费</th>
         <th width="195">出租单编号</th>
         <th width="195">编辑</th>
      </tr>
      	<c:forEach var="c" items="${requestScope.page.result}"  varStatus="s">
    		<tr class=Off onMouseOut="this.className='Off'" onMouseOver="this.className='Up'">
    		<td height="24"><div align="center">
              <input type="checkbox" name="dels" value="${c.checkId }">
          </div></td>
                <td>${s.count }</td>
    			<td>${c.checkId }</td>
    			<td><fmt:formatDate value="${c.checkDate }" pattern="yyyy-MM-dd"/></td>
    			<td>${c.user.userName }</td>
    			<td>${c.problem }</td>
    			<td><fmt:formatNumber type="currency" value="${car.paying }"/></td>
    			<td>${c.rentTable.tableId }</td>
    			<td><div align="center"><a onclick="preUpdateCheckTable('${c.checkId }')"><img src="<%=basePath%>images/edit.gif" width="16" height="19" border="0" style="cursor: hand;"></a> </div></td>
    		</tr>
    	</c:forEach>
    </table>
    <table width="100%">
    <tr>
      <td height="40" width="10"><div align="center"></div></td>
      <td width="50"><div align="center">
      <img  src="<%=basePath%>images/carimg/del.gif" onclick="deleteCheckTables()" style="cursor: hand;">
          </div></td>
      <td width="86"><div align="center">
      </div></td>
      <td width="69"><div align="center">
      </div></td>
      <td width="69"><div align="center">
      </div></td>
      <td width="69"><div align="center">
	  </div></td>
      <td width="17"><div align="center"></div></td>
      
      <c:if test="${requestScope.pageIndex > 1}">
      <td width="19"><div align="center"><a onclick="subForm('${1}')"><img src="<%=basePath%>/images/report/firstPage.gif" width="17" height="11" border="0"></div></td>
      <td width="19"><div align="center"><a onclick="subForm('${requestScope.pageIndex -1 }')"><img src="<%=basePath%>/images/report/prePage.gif" width="14" height="11" border="0"></a></div></td>
      </c:if>
     
      
      <c:if test="${requestScope.pageIndex < requestScope.page.totalPage}">
      <td width="19"><div align="center"><a onclick="subForm('${requestScope.pageIndex +1 }')"><img src="<%=basePath%>/images/report/nextPage.gif" width="14" height="11" border="0"></a></div></td>
      <td width="19"><div align="center"><a onclick="subForm('${requestScope.pageTotal}')"><img src="<%=basePath%>/images/report/endPage.gif" width="17" height="11" border="0"></div></td>
      </c:if>
      
      <td width="80"><div align="left">页次:${requestScope.pageIndex }&nbsp; &nbsp;共${requestScope.pageTotal}页</div></td>
      <td width="37">&nbsp;</td>
      <td width="36"><div align="right">转至</div></td>
      <td width="35" align="center"><input name="go" type="text" value="${requestScope.pageIndex }" size="2" id="goPage"></td>
      <td width="84" align="center"><a onclick="subGo('${requestScope.pageTotal}')"><img src="<%=basePath%>/images/report/go.gif" style="cursor: hand;"></a></td>
	  <td width="0"></td>
    </tr>
</table>
  </form>
  </body>
</html>
