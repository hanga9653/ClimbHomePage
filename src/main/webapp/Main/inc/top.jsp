<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="../common/jquery/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
/*  div{
	border:1px solid red;
}  */
header{
	color : white;
}
</style>
</head>
<body class="bg-dark">
<header class="container bg-dark">
<div class="row">
	<!-- 로고 -->
	<div class="col-lg-2">
		<img style="width:100px" src="https://img.freepik.com/premium-vector/rock-mountain-climbing-logo-design-concept_96807-918.jpg?w=1060" alt="喝! 클라이밍">
	</div>
	<div class="col-1"></div>
	<!-- 메뉴 -->
	<div class="mt-4 col-lg-6">
		<ul class="row list-unstyled" >
			<li class="col-lg-2">홈</li>
			<li class="col-lg-2">강사진</li>
			<li class="col-lg-2">이용권</li>
			<li class="col-lg-2">갤러리</li>
			<li class="col-lg-2">자유게시판</li>
			<li class="col-lg-2">공지</li>
		</ul>
	</div>
	<!-- 로그인 -->
	<div class="col-1"></div>
	<div class="mt-4 col-lg-2">
		<a href="#" onclick="location.href='../LoginForm/LoginForm.jsp'">로그인</a>
		<a href="#" onclick="location.href='../regidate/RegidateForm.jsp'">회원가입</a>
	</div>
</div>
</header>
</body>
</html>