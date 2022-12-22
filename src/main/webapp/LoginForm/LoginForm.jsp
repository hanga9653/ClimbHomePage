<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../common/jquery/jquery-3.6.1.min.js"></script>
<title>Insert title here</title>
<script>
	function validateForm(form) {
		if(form.id.value==''){
			alert("아이디를 입력하세요.");
			form.id.focus();
			return false;
		}
		if(form.pass.value==''){
			alert("패스워드를 입력하세요.");
			form.pass1.focus();
			return false;
		}
	}
</script>
<style type="text/css">
	.login{
		padding: 5px;
	}
	input{width:20%;}
</style>
</head>
<body>
	<%@ include file ="../Main/inc/top.jsp" %>
	<span style="color:red; font-size:1.2em;">
		<%= request.getAttribute("LoginErrMsg")==null?
				"": request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if(session.getAttribute("UserId")==null){
	%>
	<div style="width: 100%;">
		<form action="LoginProcess.jsp" method="post" name="loginFrm"
			onsubmit="return validateForm(this);" align="center">
			<div>
				<h3 style="margin-top:108px;">喝! 클라이밍</h3>
			</div>
			<div class="login">
				<input type="text" name="user_id" placeholder="아이디" />
			</div>
			<div class="login">
				<input type="password" name="user_pass" placeholder="비밀번호" />
			</div>
			<div class="login">
				<input type="submit"  value="로그인" />
			</div>
		</form>
		<div align="center" style="margin-bottom:108px;">
			<a href="../regidate/RegidateForm.jsp">회원가입</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="">아이디 비밀번호 찾기</a>
		</div>
	</div>
	<%
	}else{
	%>
	<%=session.getAttribute("UserName") %> 회원님, 어서오세욧! <br />
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
	<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>