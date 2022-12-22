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
    
    <title>My JSP 'viewRenttables.jsp' starting page</title>
    
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
	  function preUpdateRent(tableId){
	  	document.forms[0].action = 'PreUpdateRenttable.do';
	  	document.getElementById('tableId').value = tableId;
	  	document.forms[0].submit();
	  }
	  function deleteRenttable(){
	  	document.forms[0].action = 'DeleteRenttable.do';
	  	document.forms[0].submit();
	  }
	</script>
  </head>
  <table border="0" width="100%" cellspacing="0">
	<tr>
		<td background="<%=basePath%>images/topBarBg.gif" height="23">业务管理</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">出租单查询结果</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
    <form action="RentManagerSearch.do" method="post">
  <h5><font color="#FF0000">${requestScope.msg }</font></h5>
  <input type="hidden" name="tableId" value="${requestScope.tableId }" id="tableId">
  <input type="hidden" name="beginDate" value="${requestScope.beginDate }">
  <input type="hidden" name="shouldReturnDate" value="${requestScope.shouldReturnDate }">
  <input type="hidden" name="returnDate" value="${requestScope.returnDate }">
  <input type="hidden" name="rentFlag" value="${requestScope.rentFlag }">
   <input type="hidden" name="carNumber" value="${requestScope.carNumber }">
  <input type="hidden" name="identity" value="${requestScope.identity }">
  <input type="hidden" name="userName" value="${requestScope.userName }">
  <input type="hidden" name="pageIndex" value="" id="pageIndex">
    <table class="tablelistcontent" width="100%" border="1" cellspacing="1">
      <tr>
        <th width="29"><input type="checkbox" name="checkbox" id="all" value="checkbox" onClick="checkAll()"></th>
        <th width="100">序号</th>
        <th width="150">出租单编号</th>
        <th width="120">预付金</th>
        <th width="120">应付金</th>
        <th width="130">实际交付金额</th>
        <th width="195">起租日期</th>
         <th width="195">应归还日期</th>
        <th width="224">归还日期</th>
        <th width="195">客户姓名</th>
        <th width="195">车号</th>
         <th width="195">出租单状态</th>
        <th width="180">服务人员编号</th>
         <th width="195">编辑</th>
      </tr>
      	<c:forEach var="r" items="${requestScope.page.result}"  varStatus="s">
    		<tr class=Off onMouseOut="this.className='Off'" onMouseOver="this.className='Up'">
    		<td height="24"><div align="center">
              <input type="checkbox" name="dels" value="${r.tableId }">
          </div></td>
                <td>${s.count }</td>
    			<td>${r.tableId }</td>
    			<td><fmt:formatNumber type="currency" value="${r.imprest }"/></td>
    			<td><fmt:formatNumber type="currency" value="${r.shouldPayPrice }"/></td>
    			<td><fmt:formatNumber type="currency" value="${r.price }"/></td>
    			<td><fmt:formatDate value="${r.beginDate }" pattern="yyyy-MM-dd"/></td>
    			<td><fmt:formatDate value="${r.shouldReturnDate }" pattern="yyyy-MM-dd"/></td>
    			<td><fmt:formatDate value="${r.returnDate }" pattern="yyyy-MM-dd"/></td>
    			<td>${r.cust.custName }</td>
    			<td>${r.car.carNumber }</td>
    			<td>
    			<c:choose>
    				<c:when test="${r.rentFlag eq 0 }">
    				出租中
    				</c:when>
    				<c:otherwise>
    			     已入库/已生成检查单
    				</c:otherwise>
    			</c:choose>
    			</td>
    			<td>${r.user.userName }</td>
    			<td><div align="center"><a onclick="preUpdateRent('${r.tableId }')"><img src="<%=basePath%>images/edit.gif" width="16" height="19" border="0" style="cursor: hand;"></a> </div></td>
    		</tr>
    	</c:forEach>
    </table>
    <table width="100%">
    <tr>
      <td height="40" width="10"><div align="center"></div></td>
      <td width="50"><div align="center">
      <img  src="<%=basePath%>images/carimg/del.gif" onclick="deleteRenttable()" style="cursor: hand;">
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
