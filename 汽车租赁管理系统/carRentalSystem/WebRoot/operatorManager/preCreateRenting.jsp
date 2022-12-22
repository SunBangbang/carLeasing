<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'preCreateRenting.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
	 <link type="text/css" rel="stylesheet" href="<%=basePath%>css/public.css">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript" src="<%=basePath%>My97DatePicker/WdatePicker.js"></script> 
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
		<div align="center">生成出租单</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
      <form  action="CreateRentCarTable.do" method="post" >
        <h5><font color="red">${requestScope.msg }</font></h5>
  <table class="maintable" width="97%" border="0" cellspacing="0">
    <tr>
      <td width="14%"><div align="center">出租单编号</div></td>
      <td width="23%"><input type="text" name="tableId" id="tableId" value="${requestScope.tableId }" readonly></td>
      <td width="15%"><div align="center">预付金</div></td>
      <td width="48%"><input type="text" name="imprest" id="imprest"></td>
    </tr>
    <tr>
      <td><div align="center">应付金</div></td>
      <td><input type="text" name="shouldPayPrice" id="shouldPayPrice" ></td>
       <td><div align="center">实际交付金额</div></td>
      <td><input type="text" name="price" id="price"></td>
      
    </tr>
    <tr>
      <td><div align="center">起租日期</div></td>
      <td><input class="Wdate" type="text" name="beginDate" id="beginDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"/></td>
     <td><div align="center">应归还日期</div></td>
     <td><input class="Wdate" type="text" name="shouldReturnDate" id="shouldReturnDate" onFocus="WdatePicker({isShowClear:false,readOnly:true})"></td>
    </tr>
     <tr>
      <td><div align="center">出租单状态</div></td>
      <td>
      <select name="rentFlag" id="rentFlag">
      	<option value="0">出租中</option>
      	<option value="1">已入库</option>
      </select>
     <td><div align="center">车号</div></td>
     <td>
    <c:choose>
    	<c:when test="${fn:length(list) > 0}">
    	<select name="carNumber">
    		<c:forEach items="${requestScope.list}" var="car">
    			<option value="${car.carNumber }">${car.carNumber }</option>
    		</c:forEach>
    	</select>
    	</c:when>
    	<c:otherwise>
    		车已租完
    	</c:otherwise>
    </c:choose>
    </tr>
     <tr>
      <td><div align="center">客户编号</div></td>
      <td><input type="text" name="identity" id="identity" value="${requestScope.cust.identity }" readonly></td>
     <td><div align="center">服务人员编号</div></td>
     <td><input type="text" name="userName" id="userName" value="${sessionScope.user.userName }" readonly></td>
    </tr>
    
  </table>
<table align="left" width="100%">
	<tr>
		<td height="107">
		<div align="center">
		<img  src="<%=basePath%>images/carimg/ok.gif" onclick="subForm()" style="cursor: hand;">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <img  src="<%=basePath%>images/carimg/reset.gif" onclick="reset()" style="cursor: hand;">
		  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<img  src="<%=basePath%>images/carimg/return.gif" onclick="history.back()">
		</div>
	  </td>
	</tr>
	<tr>
		<td height="30" background="<%=basePath%>images/tab/bg.gif"></td>
	</tr>
</table>
</form>
  </body>
</html>
