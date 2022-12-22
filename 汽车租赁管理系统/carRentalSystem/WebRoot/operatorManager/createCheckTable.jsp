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
    
    <title>My JSP 'createCheckTable.jsp' starting page</title>
    
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
		function subForm(){
			//判断数字
	        var num = new RegExp("[0-9]{1,10}.?[0-9]{0,2}");
	        var paying = document.getElementById('paying');
	        if(paying.value != null && paying.value != ""){
		         if(paying.value.match(num) == null){
		        	alert("陪费格式有误。数字或小数，精确到后两位");
		        	paying.select();
		        	return false;
		        }
	       }
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
		<div align="center">汽车入库</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
    <form  action="CreateCheckTable.do" method="post">
    <input type="hidden" name="rentId" id="rentId" value="${requestScope.rent.tableId }"/>
    <input type="hidden" name="carNumber" id="carNumber" value="${requestScope.rent.car.carNumber }"/>
<table class="maintable" width="100%" border="0" cellspacing="0">
	<tr>
		<td width="12%" height="27">
	    <div align="center">检查单号：</div></td>
		<td width="13%"><input type="text" name="checkId" id="checkId" value="${requestScope.checkId}"></td>
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">检查时间：</div></td>
		<td width="27%"><input type="text" name="checkDate" id="checkDate" value="${requestScope.checkDate}"></td>
	</tr>
	<tr>
		<td width="12%" height="27">
	    <div align="center">检查员：</div>		</td>
		<td width="13%"><input type="text" name="checkUserId" id="checkUserId" value="${sessionScope.user.userName }" readonly></td>
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">属性：</div></td>
		<td width="27%"><input type="text" name="field" id="field" ></td>
	</tr>
	<tr>
		<td width="12%" height="27">
	    <div align="center">问题：</div>		</td>
		<td width="13%"><input type="text" name="problem" id="problem" ></td>
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">赔费：</div></td>
		<td width="27%"><input type="text" name="paying" id="paying" ></td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		<c:if test="${requestScope.rent.rentFlag != 1}">
		 <img  src="<%=basePath%>images/carimg/car.gif" onclick="subForm()">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
			<img  src="<%=basePath%>images/carimg/return.gif" onclick="history.back()">
		</td>
	</tr>
	
	<tr>
		<td colspan="6">
		<hr color="#99CCFF">		</td>
	</tr>
	 <tr align="center" bgcolor="#FFFFFF">
		<td height="19" colspan="6" class="titleLine" bgcolor="#99CCFF">
		<div align="left">
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		</div>		</td>
	</tr>
	<tr>
		<td colspan="6">
		<hr color="#99CCFF">		</td>
	</tr>
	<tr>
		<td height="23" colspan="6" align="center">
	  <div align="center">出租单信息</div>		</td>
	</tr>
	<tr>
		<td colspan="6">
		<hr color="#99CCFF">		</td>
	</tr>
	<tr>
      <td><div align="center">出租单编号：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.tableId }</font></div></td>
	  <td><div align="center">预付金：</div></td>
	  <td><div align="center"><font color="red"><fmt:formatNumber type="currency" value="${requestScope.rent.imprest }"/></font></div></td>
	  <td><div align="center">应付金：</div></td>
	  <td><div align="center"><font color="red"><fmt:formatNumber type="currency" value="${requestScope.rent.shouldPayPrice }"/></font></div></td>
    </tr>
	<tr>
		<td colspan="6">
		<hr color="#99CCFF"></td>
	</tr>
	<tr>
      <td><div align="center">实际交付金额：</div></td>
	  <td><div align="center"><font color="red"><fmt:formatNumber type="currency" value="${requestScope.rent.price }"/></font></div></td>
	  <td><div align="center">起租日期：</div></td>
	  <td><div align="center"><font color="red"><fmt:formatDate value="${requestScope.rent.beginDate }" pattern="yyyy-MM-dd"/></font></div></td>
	  <td><div align="center">应归还日期：</div></td>
	  <td><div align="center"><font color="red"><fmt:formatDate value="${requestScope.rent.shouldReturnDate }" pattern="yyyy-MM-dd"/></font></div></td>
    </tr>
	<tr>
		<td colspan="6">
		<hr color="#99CCFF">		</td>
	</tr>
	<tr>
      <td><div align="center">归还日期：</div></td>
	  <td><div align="center"><font color="red">
	  	<fmt:formatDate value="${requestScope.rent.returnDate }" pattern="yyyy-MM-dd"/>
	  	</font>
	  </div></td>
	  <td><div align="center">出租单状态：</div></td>
	  <td><div align="center"><font color="red">
	   <c:choose>
	  	<c:when test="${requestScope.rent.rentFlag eq 1}">
	  	已入库/已生成检查单
	  	</c:when>
	  	<c:otherwise>
	  		出租中
	  	</c:otherwise>
	  </c:choose>
	  </div></td>
	  <td><div align="center">服务人员编号：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.user.userName }</font></div></td>
    </tr>
	<tr>
		<td colspan="6">
		<hr color="#99CCFF"></td>
	</tr>

	<tr align="center" bgcolor="#FFFFFF">
		<td height="19" colspan="6" class="titleLine" bgcolor="#99CCFF">
		<div align="left">
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		</div>		</td>
	</tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
	<tr>
      <td height="23" colspan="6"><div align="center">客户信息</div></td>
    </tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
	<tr>
      <td><div align="center">身份证：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.cust.identity }</font></div></td>
	  <td><div align="center">姓名：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.cust.custName }</font></div></td>
	  <td><div align="center">性别：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.cust.sex }</font></div></td>
    </tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
	<tr>
      <td><div align="center">地址：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.cust.address }</font></div></td>
	  <td><div align="center">电话：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.cust.phone }</font></div></td>
	  <td><div align="center">职业：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.cust.career }</font></div></td>
    </tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
     <tr align="center" bgcolor="#FFFFFF">
		<td height="19" colspan="6" class="titleLine" bgcolor="#99CCFF">
		<div align="left">
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		</div>		</td>
	</tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
	<tr>
     <td height="23" colspan="6"><div align="center">车信息</div></td>
	 
    </tr>
    <tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
    <tr>
      <td><div align="center">车号：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.car.carNumber }</font></div></td>
	  <td><div align="center">型号：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.car.carType }</font></div></td>
	  <td><div align="center">颜色：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.car.color }</font></div></td>
    </tr>
    <tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
    <tr>
      <td><div align="center">价值：</div></td>
	  <td><div align="center"> <font color="red"><fmt:formatNumber type="currency" value="${requestScope.rent.car.price }"/></font></div></td>
	  <td><div align="center">租金：</div></td>
	  <td><div align="center"> <font color="red"><fmt:formatNumber type="currency" value="${requestScope.rent.car.rentPrice }"/></font></div></td>
	  <td><div align="center">押金：</div></td>
	  <td><div align="center"> <font color="red"><fmt:formatNumber type="currency" value="${requestScope.rent.car.deposit }"/></font></div></td>
    </tr>
    <tr>
      <td colspan="6"><hr color="#99CCFF">      </td>
    </tr>
    <tr>
      <td><div align="center">租用情况：</div></td>
	  <td><div align="center"><font color="red">
	   <c:choose>
	  	<c:when test="${requestScope.rent.car.isRenting eq 1 }">
	  		已出租
	  	</c:when>
	  	<c:otherwise>
	  		未出租
	  	</c:otherwise>
	  </c:choose>
	  </font>
	  </div></td>
	  <td><div align="center">简介：</div></td>
	  <td><div align="center"><font color="red">${requestScope.rent.car.cardesc }</font></div></td>
	 
    </tr>
    <tr>
		<td colspan="6">
		<hr color="#99CCFF"></td>
	</tr>
</table>
<table align="center" width="100%">
	<tr>
		<td height="30">
		  <div align="center"></div></td>
	</tr>
	<tr>
		<td height="30" background="<%=basePath%>images/tab/bg.gif"></td>
	</tr>
</table>
</form>
  </body>
</html>
