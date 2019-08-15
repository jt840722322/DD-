<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${u==null}">
<div>
	 <IMG src="image/logo.gif">
</div>
</c:if>
<c:if test="${u!=null}">
<div>
	 <IMG width="90" height="90" src="image/head/${u.head}">
</div>
</c:if>
<c:if test="${u==null}">
<DIV class="h">
	您尚未　<a href="login.jsp">登录</a>
	&nbsp;| &nbsp; <A href="reg.jsp">注册</A> |
</DIV>
</c:if>
<c:if test="${u!=null}">
<DIV class="h">		
	您好：　${u.uName }
	&nbsp;| &nbsp; <A href="user/logout">登出</A> |
</DIV>
</c:if>
</body>
</html>