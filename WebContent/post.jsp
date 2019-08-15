<%@ page language="java"  pageEncoding="utf-8" import="java.util.*"%>
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
<script type="text/javascript">
function check(){
	if(document.postForm.title.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.postForm.content.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.postForm.content.value.length>1000) {
		alert("长度不能大于1000");
		return false;
	}
}
</script>
</HEAD>

<BODY>
<%@include file="Top.jsp" %>

<!--      主体        -->
<DIV><BR/>
	<!--      导航        -->
	<DIV>
		&gt;&gt;<B><a href="/board/select">论坛首页</a></B>&gt;&gt;
		<B><a href="/topic/select?boardId=${param.boardId}$boardName=${param.boardName}">${param.boardName}</a></B>
	</DIV><BR/>
	<DIV>
		<FORM name="postForm" onSubmit="return check()" action="topic/insert" method="POST">
		<input type="text" name="boardId" value="${param.boardId}"> 
		<input type="text" name="userId" value="${u.userId}">
		<input type="text" name="boardName" value="${param.boardName}">

		
		
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
			
				    <TR>
					    <TD class="h" colSpan="3"><B>发表帖子 </B></TD>
				    </TR>
			

	
				    <TR class="tr3">
					    <TH width="20%"><B>标题</B></TH>
					    <TH><INPUT class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" name="title" ></TH>
				    </TR>
	
				    <TR class="tr3">
					    <TH vAlign=top>
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan=2>
					        <DIV>	
						        <span><textarea style="WIDTH: 500px;" name="content" rows="20" cols="90" tabIndex="2" ></textarea></span>
						    </DIV>
					      (不能大于:<FONT color="blue">1000</FONT>字)
					    </TH>
					</TR>
				</TABLE>
			</DIV>		
	
			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="提 交"> 
				<INPUT class="btn" tabIndex="4" type="reset"  value="重 置">
			</DIV>
		</FORM>	
	</DIV>
</DIV>

</BODY>
</HTML>
