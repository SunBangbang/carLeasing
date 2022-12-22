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
    
    <title>My JSP 'updateRenttable.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/public.css">
	<script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function subForm(){
			//判断数字
	     var num = new RegExp("[0-9]{1,10}.?[0-9]{0,2}");
	    
	     var imprest = document.getElementById('imprest');
	      var shouldPayPrice = document.getElementById('shouldPayPrice');
	      var price = document.getElementById('price');
	      var beginDate = document.getElementById('beginDate');
	      var shouldReturnDate = document.getElementById('shouldReturnDate');
	      if(imprest.value == null || imprest.value == ""){
	      	alert("预付金不能为空。数字或小数，精确到后两位");
	      	imprest.select();
	      	return false;
	      }else if(imprest.value.match(num) == null){
	        alert("预付金格式有误。数字或小数，精确到后两位");
	      	imprest.select();
	      	return false;
	      }else if(shouldPayPrice.value == null || shouldPayPrice.value == ""){
	        alert("应付金不能为空。数字或小数，精确到后两位");
	      	shouldPayPrice.select();
	      	return false;
	      }else if(shouldPayPrice.value.match(num) == null){
	        alert("应付金格式有误。数字或小数，精确到后两位");
	      	shouldPayPrice.select();
	      	return false;
	      }else if(price.value == null || price.value == ""){
	        alert("实际交付金额不能为空。数字或小数，精确到后两位");
	      	price.select();
	      	return false;
	      }else if(price.value.match(num) == null ){
	        alert("实际交付金额格式有误。数字或小数，精确到后两位");
	      	price.select();
	      	return false;
	      }else if(beginDate.value == null || beginDate.value == ""){
			alert("起租日期不能为空");
			return false;
		  }else if(shouldReturnDate.value == null || shouldReturnDate.value == ""){
		  	alert("应归还日期不能为空");
		  	return false;
		  }else {
		    document.forms[0].submit();
	   }
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
		<div align="center">出租单管理</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
   <form  action="UpdateRenttable.do" method="post">
    <input type="hidden" name="rentId" id="rentId" value="${requestScope.rent.tableId }"/>
    <input type="hidden" name="carNumber" id="carNumber" value="${requestScope.rent.car.carNumber }"/>
<table class="maintable" width="100%" border="0" cellspacing="0">
	<tr>
		<td width="12%" height="27">
	    <div align="center">出租单编号：</div></td>
		<td width="13%"><input type="text" name="tableId" id="tableId" value="${requestScope.rent.tableId }" readonly></td>
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">预付金：</div></td>
		<td width="27%"><input type="text" name="imprest" id="imprest" value="${requestScope.rent.imprest }"></td>
	</tr>
	<tr>
		<td width="12%" height="27">
	    <div align="center">应付金：</div></td>
		<td width="13%"><input type="text" name="shouldPayPrice" id="shouldPayPrice" value="${requestScope.rent.shouldPayPrice }"></td>
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">实际交付金额：</div></td>
		<td width="27%"><input type="text" name="price" id="price" value="${requestScope.rent.price }"></td>
	</tr>
	<tr>
		<td width="12%" height="27">
	    <div align="center">起租日期：</div>		</td>
		<td width="13%"><input class="Wdate" type="text" name="beginDate" id="beginDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="<fmt:formatDate value='${requestScope.rent.beginDate }' pattern='yyyy-MM-dd'/>"/></td>
		
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">应归还日期：</div></td>
		<td width="27%"><input class="Wdate" type="text" name="shouldReturnDate" id="shouldReturnDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="<fmt:formatDate value='${requestScope.rent.shouldReturnDate }' pattern='yyyy-MM-dd'/>"/></td>
	</tr>
	<tr>
		<td width="12%" height="27">
	    <div align="center">归还日期：</div>		</td>
		<td width="13%"><input class="Wdate" type="text" name="returnDate" id="returnDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})" value="<fmt:formatDate value='${requestScope.rent.returnDate }' pattern='yyyy-MM-dd'/>"/></td>
		<td width="14%">&nbsp;</td>
		<td width="14%">&nbsp;</td>
		<td width="20%">
		  <div align="center">出租单状态：</div></td>
		<td width="27%">
		<select name="rentFlag">
		<c:choose>
	  	<c:when test="${requestScope.rent.rentFlag eq 1}">
	  	<option value="1" selected>已入库/已生成检查单</option>
	  	<option value="0">出租中</option>
	  	</c:when>
	  	<c:otherwise>
	  	<option value="1">已入库/已生成检查单</option>
	  	<option value="0" selected>出租中</option>
	  	</c:otherwise>
	  </c:choose>
		</select>
		</td>
	</tr>
	<tr>
		<td width="12%" height="27">
	    <div align="center">服务人员编号：</div>		</td>
		<td width="13%">
		<select name="userName">
		<c:forEach items="${requestScope.list}" var="u">
		
		<c:choose>
			<c:when test="${u.userName == requestScope.rent.user.userName}">
			<option value="${u.userName }" selected>${u.userName }</option>
			</c:when>
			<c:otherwise>
			<option value="${u.userName }">${u.userName }</option>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		</select>
		</td>
	</tr>
	<tr>
		<td colspan="6" align="center">
		 <img  src="<%=basePath%>images/carimg/ok.gif" onclick="subForm()" style="cursor: hand;">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <img  src="<%=basePath%>images/carimg/reset.gif" onclick="reset()" style="cursor: hand;">
		</td>
	</tr>
	
	<tr>
		<td colspan="6"><hr color="#99CCFF"></td>
    </tr>
	<tr align="center" bgcolor="#FFFFFF">
		<td height="19" colspan="6" class="titleLine" bgcolor="#99CCFF">
		<div align="left">
		  <p>&nbsp;</p>
		  <p>&nbsp;</p>
		</div>		</td>
	</tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF"></td>
    </tr>
	<tr>
      <td height="23" colspan="6"><div align="center">客户信息</div></td>
    </tr>
	<tr>
      <td colspan="6"><hr color="#99CCFF"></td>
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
