<%@ page language="java" pageEncoding="utf-8"
	import="java.util.*"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<base href="<%=basePath%>">
<TITLE>钉钉社区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	var p=1;
	var t=${replys.topicId};
	var total=${total};
	var meId=${u.userId}
	function pre(){
		if(p>1){
			p--;
		}
		 $.post("/reply/ajaxselect",{page:p,topicId:t},function(data){
			var s="";
			for(var i=0;i<data.length;i++){
				var reply=data[i];
				s+='<DIV class="t">';
				s+='	<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">';
				s+='<TR class="tr1">';
				s+='	<TH style="WIDTH: 20%">';
				s+='<B>'+reply.uName+'</B><BR/><BR/>';
				s+='<img src="image/head/'+reply.head+'" width="90" height="90"/><BR/>';
				s+='注册:'+reply.regTime+'<BR/></TH><TH>';
				s+='<H4>'+reply.title+'</H4>';
				s+='<DIV><pre>'+reply.content+'</pre></DIV>';
				s+='<DIV class="tipad gray">';
				s+='发表：'+reply.publishTime+' &nbsp;';
				s+='最后修改:'+reply.modifyTime+'';
				if(meId==reply.userId){
					s+='<A href="/reply/delete?replyId='+reply.replyId+'&topicId='+reply.topicId+'">[删除]</A>';
					s+='<A href="/reply/edit?replyId='+reply.replyId+'">[修改]</A>';
					}
				s+='</DIV></TH></TR></TABLE></DIV>';
			}
			$("#tbody").html(s);
		})
	}
	function next(){
		if(p<total){
			p++;
		}
		 $.post("/reply/ajaxselect",{page:p,topicId:t},function(data){
				var s="";
				for(var i=0;i<data.length;i++){
					var reply=data[i];
					s+='<DIV class="t">';
					s+='	<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">';
					s+='<TR class="tr1">';
					s+='	<TH style="WIDTH: 20%">';
					s+='<B>'+reply.uName+'</B><BR/><BR/>';
					s+='<img src="image/head/'+reply.head+'" width="90" height="90"/><BR/>';
					s+='注册:'+reply.regTime+'<BR/></TH><TH>';
					s+='<H4>'+reply.title+'</H4>';
					s+='<DIV><pre>'+reply.content+'</pre></DIV>';
					s+='<DIV class="tipad gray">';
					s+='发表：'+reply.publishTime+' &nbsp;';
					s+='最后修改:'+reply.modifyTime+'';
					if(meId==reply.userId){
					s+='<A href="/reply/delete?replyId='+reply.replyId+'&topicId='+reply.topicId+'">[删除]</A>';
					s+='<A href="/reply/edit?replyId='+reply.replyId+'">[修改]</A>';
					}
					s+='</DIV></TH></TR></TABLE></DIV>';
				}
				$("#tbody").html(s);
			})
	}
</script>
</HEAD>

<BODY>
<%@include file="Top.jsp" %>
	
<!--      主体        -->
<DIV><br/>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="index.jsp">论坛首页</a></B>&gt;&gt;
	<B><a href="list.jsp?page=1&boardId=${userTopic.boardId}">${param.Top}</a></B>
	<input type="text" name="topicId" value="${param.topicId}"> 
	<input type="text" name="userId" value="${param.userId}"> 
	

	
	
</DIV>
	<br/>
	<!--      回复、新帖        -->
	<DIV>
		<A href="replyInsert.jsp?topicId=${param.topicId}"><IMG src="image/reply.gif" border="0"></A> 
	<!--  	<A href="post.jsp?boardId=${boardId}$u=reply"><IMG src="image/post.gif" border="0"></A>-->
	</DIV>
	<!--         翻 页         -->
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>
	<!--      本页主题的标题        -->
	<DIV>
		<TABLE cellSpacing="0" cellPadding="0" width="100%">
			<TR>
				<TH class="h">本页主题: ${userTopic.title}</TH>
			</TR>
			<TR class="tr2">
				<TD>&nbsp;</TD>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      主题        -->
	
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B>${zuo.uName}</B><BR/>
					<img src="image/head/${zuo.head}" width="90" height="90"/><BR/>
					注册:${zuo.regTime}<BR/>
				</TH>
				<TH>
					<H4>${you.title}</H4>
					<DIV><pre>${you.content}</pre></DIV>
					<DIV class="tipad gray" >
						发表：${you.publishTime} &nbsp;
						最后修改:${you.modifyTime}
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	
	<!--      回复        -->
	<div id="tbody">
  <c:forEach items="${replylist}" var="r">
	<DIV class="t">
		<TABLE style="BORDER-TOP-WIDTH: 0px; TABLE-LAYOUT: fixed" cellSpacing="0" cellPadding="0" width="100%">
			<TR class="tr1">
				<TH style="WIDTH: 20%">
					<B>${r.uName}</B><BR/><BR/>
					<img src="image/head/${r.head}" width="90" height="90"/><BR/>
					注册:${r.regTime}<BR/>
				</TH>
				<TH>
					<H4>${r.title}</H4>
					<DIV><pre>${r.content}</pre></DIV>
					<DIV class="tipad gray">
						发表：${r.publishTime} &nbsp;
						最后修改:${r.modifyTime}
						<c:if test="${r.userId==u.userId}">
						<A href="/reply/delete?replyId=${r.replyId}&topicId=${r.topicId}">[删除]</A>
						<A href="/reply/edit?replyId=${r.replyId}">[修改]</A>
						</c:if>
					</DIV>
				</TH>
			</TR>
		</TABLE>
	</DIV>
	</c:forEach>
	</div>
	<DIV>
		<a href="javascript:pre()">上一页</a>|
		<a href="javascript:next()">下一页</a>
	</DIV>
</DIV>
<BR>
</BODY>
</HTML>
