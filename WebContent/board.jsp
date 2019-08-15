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
 if(document.regForm.boardName.value==""){
    alert("版块名称不能为空");
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
	<FORM name="regForm" onSubmit="return check()" action="board/update" method="post">
	<input type="text" name="boardId" value="${param.boardId}">
		<br/>版&nbsp;块&nbsp;名 &nbsp;
			<INPUT class="input" tabIndex="1" tryp="text" maxLength="20" size="35" name="boardName" value="${boardson.boardName}">
		<br/>父&nbsp;版&nbsp;块 &nbsp;
            <select id="parentId" name="parentId">
            
                 <option value="" selected="selected">--请选择--</option>
               <c:forEach items="${father}" var="f">
                  <option value="${f.boardId}" ${f.boardId==boardson.parentId?selected:"" }>${f.boardName}</option>
            	</c:forEach>
            </select>
		<br/>
			<INPUT class="btn" tabIndex="4" type="submit" value="增加版块">
	</FORM>
</DIV>
</BODY>
</HTML>
