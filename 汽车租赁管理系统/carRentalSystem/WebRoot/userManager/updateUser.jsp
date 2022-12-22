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
    
    <title>My JSP 'updateUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">
   <script type="text/javascript">
   	function subForm(){
   		//判断登陆名
		var bound = new RegExp("\\w{4,10}");
		//判断身份证
		var ity = new RegExp("[0-9a-zA-Z]{18}");
		//判断用户名
		var unm = new RegExp("[^\w]|[a-zA-Z_0-9]{1,10}");
		//判断地址
		var add = new RegExp("[^\w]|[a-zA-Z_0-9]{1,20}");
		//判断职位
		var psn = new RegExp("[^\w]|[a-zA-Z_0-9]{1,10}");
		var pho = new RegExp("[0-9]{7,11}");
		//取到输入的字符
	var username = document.getElementById("userName");
	var identity = document.getElementById("identity");
	var fullname = document.getElementById("fullName");
	var address = document.getElementById("address");
	var phone = document.getElementById("phone");
	var position = document.getElementById("position");
		  //判断登陆名是否空，是否匹配
	if(username.value == null || username.value==""){
		alert("登陆名不能为空.英文或数字，长度为4-20");
		username.select();
		return false;
	}else if(username.value.match(bound)==null){
		alert("登录名格式有误，英文或数字，长度为4-20位");
		username.select();
		return false;
	//判断身份证是否为空，是否匹配
	}else if(identity.value == null || identity.value  == ""){
		alert("身份证不能为空。英文或数字，长度18位");
		identity.select();
		return false;
	}else if(identity.value.match(ity) == null){
		alert("身份证格式有误。英文或数字，长度18位");
		identity.select();
		return false;
	}else if(fullname.value == null || fullname.value == ""){
		alert("姓名不能为空。中文，英文，数字，长度1-10位");
		fullname.select();
		return false;
	}else if(fullname.value.match(unm)== null){
		alert("姓名格式有误。中文，英文，数字，长度1-10位");
		fullname.select();
		return false;
	//判断地址是否为空，是否匹配
	}else if(address == null || address == ""){
		alert("地址不能为空。，中文，英文，数字，长度1-10位");
		address.select();
		return false;
	}else if(address.value.match(add)== null){
		alert("地址格式有误。中文，英文，数字，长度1-20位");
		address.select();
		return false;
	//判断职位是否为空，是否匹配
	}else if(position.value == null || position.value == ""){
		alert("职位不能为空。中文，英文，数字，长度1-10位");
		position.select();
		return false;
	}else if(position.value.match(psn) == null){
		alert("职位格式有误。中文，英文，数字，长度1-10位");
		return false;
	//判断密码是否为空，是否匹配
	}else if(phone.value == null || phone.value == ""){
	//document.f.submit();
		alert("电话号码不能为空。数字，长度7-11位");
		phone.select();
		return false;
	}else if(phone.value.match(pho) == null){
		alert("电话号码格式有误。数字，长度7-11位");
		phone.select();
		return false;
	}else{
		document.forms[0].submit();
	}
   	}
   	function changeUserPwd(){
   		document.forms[0].action = 'PreChangeUserPwd.do';
   		document.forms[0].submit();
   	}
   </script>
  </head>
  <table class="maintable" border="0" width="100%" cellspacing="0">
  <tr>
    <td background="<%=basePath%>images/topBarBg.gif">用户管理</td>
    <td width="20" height="23" background="images/topBarBg.gif"><div align="right"><a href="#"><img src="<%=basePath%>images/iHelp.gif" width="16" height="16" border="0"></a></div></td>
  </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	bordercolor="#6490C2">
	<tr>
		<td width="25" height="24" background="<%=basePath%>images/tab/firstLeftSel.gif">&nbsp;</td>
		<td width="100" background="<%=basePath%>images/tab/middleSel.gif">
		<div align="center">更新用户信息</div>
		</td>
		<td width="50" background="<%=basePath%>images/tab/lastRightSel.gif">&nbsp;</td>
		<td background="<%=basePath%>images/tab/bg.gif">&nbsp;</td>
	</tr>
</table>
  <body>
    <form  action="UpdateUser.do" method="post" >
  <table class="maintable" width="97%" border="0" cellspacing="0">
    <tr>
      <td width="14%"><div align="center">登录名</div></td>
      <td width="23%"><input type="text" name="userName" id="userName" value="${requestScope.user.userName }" readonly></td>
      <td width="15%"><div align="center">身份证</div></td>
      <td width="48%"><input type="text" name="identity" id="identity" value="${requestScope.user.identity }"></td>
    </tr>
    <tr>
       <td><div align="center">姓名</div></td>
      <td><input type="text" id="fullName" name="fullName" value="${requestScope.user.fullName }"></td>
       <td><div align="center">联系电话</div></td>
      <td><input type="text" name="phone" id="phone" value="${requestScope.user.phone }"></td>
      
    </tr>
    <tr>
      <td><div align="center">地址</div></td>
      <td><input type="text" name="address" id="address" value="${requestScope.user.address }"></td>
     <td><div align="center">性别</div></td>
      <td>
     <select name="sex" id="sex"  style="width: 80px;">
     <c:choose>
     	<c:when test="${requestScope.user.sex eq '男'}">
     	    <option value="男" selected>男</option>
			<option value="女">女</option>
     	</c:when>
     	<c:otherwise>
     	    <option value="男">男</option>
			<option value="女" selected>女</option>
     	</c:otherwise>
     </c:choose>
			
		</select>

      </td>
     
    <tr>
      <td><div align="center">职位 </div></td>
      <td><input type="text" name="position" id="position" value="${requestScope.user.position }"></td>
      <td><div align="center">用户类型</div></td>
      <td><label>
        <select name="userLevel">
        <c:forEach items="${requestScope.roles}" var="r">
        ${r.roleId }
        	<c:choose>
        		<c:when test="${requestScope.user.role.roleId == r.roleId}">
        		<option  value="${r.roleId }" selected>${r.roleName }</option>
        		</c:when>
        		<c:otherwise>
        		<option  value="${r.roleId }">${r.roleName }</option>
        		</c:otherwise>
        	</c:choose>
        </c:forEach>
        </select>
      </label></td>
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
			<input type="button" value="修改密码" onclick="changeUserPwd()" style="cursor: hand;">
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
