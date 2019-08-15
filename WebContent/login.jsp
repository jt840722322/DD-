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
<TITLE>钉钉社区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css"/>
<script language="javascript">
function check() {
 if(document.loginForm.uName.value==""){
    alert("用户名不能为空");
    return false;
 }
 if(document.loginForm.uPass.value==""){
    alert("密码不能为空");
    return false;
 }
}
</script>
</HEAD>

<BODY>
<%@include file="Top.jsp" %>

<!--      用户信息、登录、注册        -->


<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>
</DIV>
<!--      用户登录表单        -->
<DIV class="t" style="MARGIN-TOP: 15px" align="center">
	<FORM name="loginForm" onSubmit="return check()" action="user/login" method="post">
		<br/>用户名 &nbsp;<INPUT class="input" tabIndex="1"  type="text"      maxLength="20" size="35" name="uName">
		<br/>密　码 &nbsp;<INPUT class="input" tabIndex="2"  type="password"  maxLength="20" size="40" name="uPass">
		<br/><INPUT class="btn"  tabIndex="6"  type="submit" value="登 录">
	</FORM>
</DIV>
</BODY>
</HTML>
