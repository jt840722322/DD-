<%@ page language="java" pageEncoding="utf-8" 
	import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>钉钉社区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="<%=path%>/style/style.css"/>
</HEAD>

<BODY>

<%@include file="Top.jsp" %>


<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">社区首页</a></B>
</DIV><BR/>
<!--      错误信息        -->
<DIV class="t" align="center">
	<BR/>
	<font color="red"></font>
	<BR/><BR/>
	<input type="button" value="返 回" onclick="window.history.back();" class="btn"/>
	<BR/><BR/>
</DIV>
</BODY>
</HTML>
