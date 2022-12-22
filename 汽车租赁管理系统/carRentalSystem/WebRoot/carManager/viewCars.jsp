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
    
    <title>My JSP 'viewCars.jsp' starting page</title>
    
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
	  function preUpdateCar(carNumber){
	  	document.forms[0].action = 'PreUpdateCar.do';
	  	document.getElementById('carNumber').value = carNumber;
	  	document.forms[0].submit();
	  }
	  function deleteCar(){
	  	document.forms[0].action = 'DeleteCar.do';
	  	document.forms[0].submit();
	  }
	</script>
  </head>
  <table border="0" width="100%" cellspacing="0">
	<tr>
		<td background="<%=basePath%>images/topBarBg.gif" height="23">汽车管理</td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">查询汽车信息</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>

  <body>
  <form action="FindCar.do" method="post">
  <h5><font color="#FF0000">${requestScope.msg }</font></h5>
  <input type="hidden" name="carNumber" value="${requestScope.carNumber }" id="carNumber">
  <input type="hidden" name="color" value="${requestScope.color }">
  <input type="hidden" name="carType" value="${requestScope.carType }">
  <input type="hidden" name="price" value="${requestScope.price }">
  <input type="hidden" name="rentPrice" value="${requestScope.rentPrice }">
   <input type="hidden" name="deposit" value="${requestScope.deposit }">
  <input type="hidden" name="isRenting" value="${requestScope.isRenting }">
  <input type="hidden" name="pageIndex" value="" id="pageIndex">
    <table class="tablelistcontent" width="100%" border="1" cellspacing="1">
      <tr>
        <th width="29"><input type="checkbox" name="checkbox" id="all" value="checkbox" onClick="checkAll()"></th>
        <th width="80">序号</th>
        <th width="100">车号</th>
        <th width="203">型号</th>
        <th width="100">颜色</th>
        <th width="100">价格</th>
        <th width="100">租金</th>
         <th width="100">押金</th>
        <th width="100">租用情况</th>
         <th width="100">编辑</th>
      </tr>
      	<c:forEach var="car" items="${requestScope.page.result}"  varStatus="s">
    		<tr class=Off onMouseOut="this.className='Off'" onMouseOver="this.className='Up'">
    		<td height="24"><div align="center">
              <input type="checkbox" name="dels" value="${car.carNumber }">
          </div></td>
                <td>${s.count }</td>
    			<td>${car.carNumber }</td>
    			<td>${car.carType }</td>
    			<td>${car.color }</td>
    			<td><fmt:formatNumber type="currency" value="${car.price }"/></td>
    			<td><fmt:formatNumber type="currency" value="${car.rentPrice }"/></td>
    			<td><fmt:formatNumber type="currency" value="${car.deposit }"/></td>
    			<td>
    			<c:choose>
    				<c:when test="${car.isRenting eq 0 }">
    				未出租
    				</c:when>
    				<c:otherwise>
    			     已出租
    				</c:otherwise>
    			</c:choose>
    			</td>
    			<td><div align="center"><a onclick="preUpdateCar('${car.carNumber }')"><img src="<%=basePath%>images/edit.gif" width="16" height="19" border="0" style="cursor: hand;"></a> </div></td>
    		</tr>
    	</c:forEach>
    </table>
    <table width="100%">
    <tr>
      <td height="40" width="10"><div align="center"></div></td>
      <td width="50"><div align="center">
      <img  src="<%=basePath%>images/carimg/del.gif" onclick="deleteCar()" style="cursor: hand;">
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
