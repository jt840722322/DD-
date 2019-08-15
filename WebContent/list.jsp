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
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
//js代码
   //当前页码
   var p=1;
   var b=${boardss.boardId};  //将el表达式的值放入此处，怕乱。不乱就是boardId:${boardss.boardId} ..===....boardId:b  
   var totalpages=${totalpages}; //总页数
   var top1=${boardss.boardName};
   
   //上一页
	function pre(){
		if(p>1){
			p--;	
		}
		//ajax代码					//{page,p}page是实体类的中的page，p是此处的值
		$.post("/topic/ajaxselect",{page:p,boardId:b},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var topic=data[i];
				s+='<TR class="tr3">';
				s+='<TD><IMG src="image/topic.gif" border=0></TD>';
				s+='<TD style="FONT-SIZE: 15px">';
				s+='<A href="/reply/select?topicId='+topic.topicId+'&userId='+topic.userId+'&top1='+top1+'">'+topic.title+'</A>';
				s+='</TD>';
				s+='<TD align="center">'+topic.uname+'</TD>';
				s+='<TD align="center">6</TD>';
				s+='</TR>';
			}
			$("#tbody").html(s);   //$("#tbody")????   调用的id标签的值
		})	
	}
	//下一页
	function next(){
		if(p<totalpages){
		p++;
		}
		$.post("/topic/ajaxselect",{page:p,boardId:b},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var topic=data[i];
				s+='<TR class="tr3">';
				s+='<TD><IMG src="image/topic.gif" border=0></TD>';
				s+='<TD style="FONT-SIZE: 15px">';
				s+='<A href="/reply/select?topicId='+topic.topicId+'&userId='+topic.userId+'&top1='+top1+'">'+topic.title+'</A>';
				s+='</TD>';
				s+='<TD align="center">'+topic.uname+'</TD>';
				s+='<TD align="center">6</TD>';
				s+='</TR>';
			//	alert(z);
			}
			$("#tbody").html(s);  
		})	
	}
	
</script>
</HEAD>

<BODY>
<%@include file="Top.jsp" %>


<!--      主体        -->
<DIV>
<!--      导航        -->
	<br/>
	<DIV>
		&gt;&gt;<B><a href="/board/select">论坛首页</a></B>&gt;&gt;
		<B>${boardss.boardName}</B>
	</DIV>
	<br/>
<!--      新帖        -->
	<DIV>
	<c:if test="${u!=null}">
		<A href="post.jsp?boardId=${boardss.boardId}&boardName=${boardss.boardName}"><IMG src="image/post.gif" border="0"></A>
	</c:if>
	</DIV>
<!--         翻 页         -->
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>

	<DIV class="t">
		<TABLE cellSpacing="0" cellPadding="0" width="100%">		
			<TR>
				<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
			</TR>
<!--       表 头           -->
			<TR class="tr2">
				<TD>&nbsp;</TD>
				<TD style="WIDTH: 80%" align="center">文章</TD>
				<TD style="WIDTH: 10%" align="center">作者</TD>
				<TD style="WIDTH: 10%" align="center">回复</TD>
			</TR>
<!--         主 题 列 表        -->
		<tbody id="tbody" >
		<c:forEach items="${lists}" var="s">
			
			<TR class="tr3">
				<TD><IMG src="image/topic.gif" border=0></TD>
				<TD style="FONT-SIZE: 15px">
					<A href="/reply/select?topicId=${s.topicId}&userId=${s.userId}&top1=${boardss.boardName}">${s.title}</A><!-- detail获取的是uName还是uname？？ -->
				</TD>
				<TD align="center">${s.uname}</TD>
				<TD align="center">6</TD>
			</TR>
			
			</c:forEach>
		</tbody>
		</TABLE>
	</DIV>
<!--            翻 页          -->
		<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
		</DIV>
</DIV>


</BODY>
</HTML>
