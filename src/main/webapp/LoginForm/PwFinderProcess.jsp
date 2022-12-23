<%@page import="MemberTable1.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../Main/inc/top.jsp"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");

MemberDAO dao = new MemberDAO(application);
String mpw = dao.findPw(id, name, email);
%>
<form name="pwFind" method="post">
	<%
	if(mpw != null){
	%>
	<div class="container">
		<div class="success">
			<h3>회원님의 비밀번호는</h3>
			<div><%=mpw %></div>
			<h3>입니다.</h3>
		</div>
		<div>
			<input type="button" value="로그인" onclick="location.href='./LoginForm.jsp'"/>
		</div>
	</div>	
	<%
	}else{
	%>
	<div class="container">
		<div class="false">
			<h4>등록된 정보가 없습니다.</h4>
		</div>
		<div>
			<input type="button" value="다시찾기" onclick="history.back()" />
			<input type="button" value="회원가입" onclick="../regidate/RegidateForm.jsp" />
		</div>
	</div>
	<%
	}
	%>
</form>
<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>