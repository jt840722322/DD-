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
<Link rel="stylesheet" type="text/css" href="style/style.css" />
</HEAD>

<BODY>

<%@include file="Top.jsp" %>


<!--      主体        -->
	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr2" align="center">
				<TD colSpan="2">论坛</TD>
				<TD style="WIDTH: 5%;">主题</TD>
				<TD style="WIDTH: 25%">最后发表</TD>
			</TR>
		<!--       主版块       -->
		
		<c:forEach items="${boards}" var="main">
		<c:if test="${main.parentId==0}">
			<TR class="tr3">
				<TD colspan="4">${main.boardName}
				
						
				
			</TR>
		<!--       子版块       -->
		<c:forEach items="${boards}" var="son">
		<c:if test="${son.parentId!=0 and son.parentId==main.boardId}">
			<TR class="tr3">
				<TD width="5%">&nbsp;</TD>
				<TH align="left">
					<IMG src="image/board.gif">
					<A href="/topic/select?boardId=${son.boardId}&boardName=${son.boardName}">${son.boardName}
					
						<A href="/board/edit?boardId=${son.boardId}">[修改]</A>
						</A>
				</TH>
				<TD align="center">${son.count}</TD>
				<TH>
					<SPAN>
						<A href="">${son.topic.title}</A>
					</SPAN>
					<BR/>
					<SPAN>${son.topic.publishTime}</SPAN>
					<SPAN class="gray">${son.topic.uname}</SPAN>
				</TH>
			</TR>
			</c:if>
			</c:forEach>
			</c:if>
		</c:forEach>
					
		</TABLE>
	</DIV>

<BR/>
</BODY>
</HTML>