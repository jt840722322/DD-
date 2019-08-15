<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>钉钉社区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
function check(){
	if(document.updateForm.title.value=="") {
		alert("标题不能为空");
		return false;
	}
	if(document.updateForm.content.value=="") {
		alert("内容不能为空");
		return false;
	}
	if(document.updateForm.content.value.length>1000) {
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
		&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
		<B><a href="">trewe</a></B>
	</DIV><BR/>
	<DIV>
		<FORM name="updateForm" onSubmit="return check();" action="reply/update" method="post">
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				 
				    <TR>
					    <TD class="h" colSpan="3"><B>&#20462;&#25913;&#24086;&#23376;</B></TD>
				    </TR>
					
				    <TR class="tr3">
					    <TH width="20%">
					    <input type="text" name="replyId" value="${rup.replyId}">
					    <input type="text" name="topicId" value="${rup.topicId}">
					    <B>标题</B></TH>
					    <TH><INPUT name="title" value="${rup.title}" class="input" style="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60"></TH>
				    </TR>
				 
				    <TR class="tr3">
					    <TH vAlign="top">
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan="2">
					        <DIV>
						        <span><textarea  name="content" style="WIDTH: 500px;" rows="20" cols="90" tabIndex="2" >${rup.content}</textarea></span>
						    </DIV>
					      (不能大于:<FONT color="blue">1000</FONT>字)
					    </TH>
					</TR>
				</TABLE>
			</DIV>

			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="修 改"> 
			</DIV>
		</FORM>
	
	</DIV>

</BODY>
</HTML>
