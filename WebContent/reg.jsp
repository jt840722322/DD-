<%@ page language="java" pageEncoding="utf-8" 
	import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css"/>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script language="javascript">
function checkuname(){
	//var u=document.getElementById("uname").value;
	//vat u1=${"#uname"}.val();
	var u1=$("#uname").val();
	if(u1==""){
		$("#spanuname").html("账号不能为空");
		return;
	}
	$.post("user/check",{uname:$("#uname").val()},function(data){
		//alert(date.length);
		if(data.length>0){//data那边带过来的是个list,date只是个形式参数
			$("#spanuname").html("用户名已存在");
		}else{
			$("#spanuname").html("用户名存可以使用");
		}                     
	},"json");
}

function check() {
 if(document.regForm.uname.value==""){
    alert("用户名不能为空");
    return false;
 }
 if(document.regForm.upass.value==""){
    alert("密码不能为空");
    return false;
 }
 if(document.regForm.upass.value != document.regForm.uPass1.value){
    alert("2次密码不一样");
    return false;
 }
 if($("#spanuname").html()=="用户名已存在" ||$("#spanuname").html==""){
	alert("用户名已存在")
	return false;
 }
 }
</script>
</HEAD>
<BODY>

<%@include file="Top.jsp" %>

<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
</DIV>
<!--      用户注册表单        -->
<DIV  class="t" style="MARGIN-TOP: 15px" align="center">
	<FORM name="regForm" enctype="multipart/form-data" onSubmit="return check()" action="user/insert" method="post">
		<br/>用&nbsp;户&nbsp;名 &nbsp;
			<INPUT class="input" tabIndex="1" type="text" maxLength="20" size="35" name="uName" id="uname" onblur="checkuname()">
			<span id="spanuname"></span>
		<br/>密&nbsp;&nbsp;&nbsp;&nbsp;码 &nbsp;
			<INPUT class="input" tabIndex="2" type="password" maxLength="20" size="40" name="uPass">
		<br/>重复密码 &nbsp;
			<INPUT class="input" tabIndex="3" type="password" maxLength="20" size="40" name="uPass1">
		<br/>性别 &nbsp;
			女<input type="radio" name="gender" value="女">
			男<input type="radio" name="gender" value="男" checked="checked" />
		<br/>请选择头像 <br/>
		<input type="file" name="up">
<!-- 	<img src="image/head/1.gif"/><input type="radio" name="head" value="1.gif" checked="checked">
		<img src="image/head/2.gif"/><input type="radio" name="head" value="2.gif">
		<img src="image/head/3.gif"/><input type="radio" name="head" value="3.gif">
		<img src="image/head/4.gif"/><input type="radio" name="head" value="4.gif">
		<img src="image/head/5.gif"/><input type="radio" name="head" value="5.gif">
		<BR/>
		<img src="image/head/6.gif"/><input type="radio" name="head" value="6.gif">
		<img src="image/head/7.gif"/><input type="radio" name="head" value="7.gif">
		<img src="image/head/8.gif"/><input type="radio" name="head" value="8.gif">
		<img src="image/head/9.gif"/><input type="radio" name="head" value="9.gif">
		<img src="image/head/10.gif"/><input type="radio" name="head" value="10.gif">
		<BR/>
		<img src="image/head/11.gif"/><input type="radio" name="head" value="11.gif">
		<img src="image/head/12.gif"/><input type="radio" name="head" value="12.gif">
		<img src="image/head/13.gif"/><input type="radio" name="head" value="13.gif">
		<img src="image/head/14.gif"/><input type="radio" name="head" value="14.gif">
		<img src="image/head/15.gif"/><input type="radio" name="head" value="15.gif">  -->	
		<br/>
			<INPUT class="btn" tabIndex="4" type="submit" value="注 册">
	</FORM>
</DIV>
</BODY>
</HTML>
