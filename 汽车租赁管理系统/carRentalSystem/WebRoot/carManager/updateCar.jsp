<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateCar.jsp' starting page</title>
    
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
   					//判断车号
	var ity = new RegExp("[^\w]|[a-zA-Z_0-9]|[-]{4,10}");
	//判断车型
	var cte = new RegExp("[^\w]|[a-zA-Z_0-9]{1,10}");
	//判断颜色
	var clr = new RegExp("[^\w]{1,10}");
	//判断数字
	var num = new RegExp("[0-9]{1,10}.?[0-9]{0,2}");
  	
  	var carnumber = document.getElementById("carNumber");
  	var cartype = document.getElementById("carType");
  	var color = document.getElementById("color");
  	var price = document.getElementById("price");
  	var rentprice = document.getElementById("rentPrice");
  	var deposit = document.getElementById("deposit");
  	
  	//判断车号是否为空，是否匹配
  	if(carnumber.value == null || carnumber.value == ""){	
  		alert("车号不能为空。中文，大写字母，数字");
  		carnumber.select();
  		return false;
  	}else if(carnumber.value.match(ity) == null){
  		alert("车号有误。中文，大写字母，数字");
  		return false;
  	//判断车型是否为空，是否匹配
  	}else if(cartype.value == null || cartype.value == ""){
  		alert("车型不能为空。中文，数字，英文。长度1-10位");
  		cartype.select();
  		return false;
  	}else if(cartype.value.match(cte) == null){
  		alert("车型有误。中文，数字，英文。长度1-10位");
  		return false;
  	//判断颜色是否为空，是否匹配
  	}else if(color.value == null || color.value == ""){
  		alert("颜色不能为空。中文，数字，英文。长度1-10位");
  		color.select();
  		return false;
  	}else if(color.value.match(clr) == null){
  		alert("颜色错误。中文，数字，英文。长度1-10位");
  		color.select();
  		return false;
  	//判断价格是否为空，是否匹配
  	}else if(price.value == null || price.value == ""){
  		alert("价格不能为空。数字或小数，精确到后两位");
  		price.select();
  		return false;
  	}else if(price.value.match(num) == null){
  		alert("价格格式有误。数字或小数，精确到后两位");
  		price.select();
  		return false;
  	//判断租金是否为空，是否匹配
  	}else if(rentprice.value == null || rentprice.value == ""){
  		alert("租金不能为空。数字或小数，精确到后两位");
  		rentprice.select();
  		return false;
  	}else if(rentprice.value.match(num) == null){
  		alert("租金格式有误。数字或小数，精确到后两位");
  		rentprice.select();
  		return false;
  	//判断押金内容是否为空。是否匹配
    }else if(deposit.value == null || deposit.value == ""){
    	alert("押金内容不能为空。数字或小数，精确到后两位");
    	deposit.select();
    	return false;
    }else if(deposit.value.match(num) == null){
    	alert("押金格式有误。数字或小数，精确到后两位");
    	deposit.select();
    	return false;
    }else{
    	document.forms[0].submit();
    }
   	}
   </script>
  </head>
  <table class="maintable" border="0" width="100%" cellspacing="0">
  <tr>
    <td background="<%=basePath%>images/topBarBg.gif">汽车管理</td>
    <td width="20" height="23" background="images/topBarBg.gif"><div align="right"><a href="#"><img src="<%=basePath%>images/iHelp.gif" width="16" height="16" border="0"></a></div></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">更新汽车信息</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>

  <body>
    <form  action="UpdateCar.do" method="post" >
  <table class="maintable" width="97%" border="0" cellspacing="0">
    <tr>
      <td width="14%"><div align="center">车号</div></td>
      <td width="23%"><input type="text" name="carNumber" id="carNumber" value="${requestScope.car.carNumber }" readonly></td>
      <td width="15%"><div align="center">型号</div></td>
      <td width="48%"><input type="text" name="carType" id="carType" value="${requestScope.car.carType }"></td>
    </tr>
    <tr>
      <td><div align="center">颜色</div></td>
      <td><input type="text" name="color" id="color"  value="${requestScope.car.color }"></td>
       <td><div align="center">价值</div></td>
      <td><input type="text" name="price" id="price" value="${requestScope.car.price }"></td>
      
    </tr>
    <tr>
      <td><div align="center">租金</div></td>
      <td><input type="text" name="rentPrice" id="rentPrice" value="${requestScope.car.rentPrice }"></td>
     <td><div align="center">押金</div></td>
      <td><input type="text" name="deposit" id="deposit" value="${requestScope.car.deposit }"></td>
    </tr>
    <tr>
      <td><div align="center">租用情况 </div></td>
      <td>
     <select name="isRenting" id="isRenting" style="width: 80px;">
     <c:choose>
     	<c:when test="${requestScope.car.isRenting eq 0 }">
     	<option value="0" selected>未出租</option>
			<option value="1">已出租</option>
     	</c:when>
     	<c:otherwise>
     	<option value="0" >未出租</option>
			<option value="1" selected>已出租</option>
     	</c:otherwise>
     </c:choose>
			
	</select>
      </td>
    </tr>
     <tr>
		<td colspan="6">
		<hr color="#99CCFF"></td>
	</tr>
     <tr align="center" bgcolor="#99CCFF">
      <td height="26" colspan="4" class="titleLine"><div align="left"> 简介：<span class="style2"></span></div></td>
    </tr>
    <tr>
      <td height="121" colspan="4" align="center"><textarea name="cardesc" id="cardesc" cols="140" rows="5">${requestScope.car.cardesc }</textarea></td>
    </tr>
  </table>
<table align="left" width="100%">
	<tr>
		<td height="107">
		<div align="center">
		<img  src="<%=basePath%>images/carimg/ok.gif" onclick="subForm()" style="cursor: hand;">
		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <img  src="<%=basePath%>images/carimg/reset.gif" onclick="reset()" style="cursor: hand;">
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
