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
 div{
	border:1px solid red;
}
header{
	color : white;
}
a{text-decoration-line: none;}
.menu{display: block;
    color: #fff;
    font-size: 16px;
    font-weight: bold;
    width: 100%;}
.mbregi{
	font-size:12px;
}
</style>
</head>
<body>
<header>
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
<div class="container-fluid">
		<!-- 로고 -->
		<a class="navbar-brand" href="../Main/mainHome.jsp"><img style="width:100px" src="https://img.freepik.com/premium-vector/rock-mountain-climbing-logo-design-concept_96807-918.jpg?w=1060" 
			alt="喝! 클라이밍"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<!-- 메뉴 -->
		<div class="collapse navbar-collapse" id="mynavbar">
			<ul class="container me-auto" >
				<li class="" ><a href="../Main/mainHome.jsp" class="menu">Home</a></li>
				<li class=""><a href="../Main/mainHome.jsp" class="menu">강사진</a></li>
				<li class=""><a href="../Main/mainHome.jsp" class="menu">이용권</a></li>
				<li class=""><a href="../Main/mainHome.jsp" class="menu">갤러리</a></li>
				<li class=""><a href="../Main/mainHome.jsp" class="menu">자유게시판</a></li>
				<li class=""><a href="../Main/mainHome.jsp" class="menu">공지</a></li>
			</ul>
		</div>
		<!-- 로그인 -->
		<div>
            <ul class="navbar-nav me-auto">
               <%
               if(session.getAttribute("UserId") == null){%>
               <li class="mbregi nav-item"><a class="nav-link" onclick="location.href='../regidate/RegidateForm.jsp';">
               <i class='bi bi-person-plus-fill' style='font-size: 9px'></i>회원가입</a></li>
               <li class="mbregi nav-item"><a class="nav-link" href="#" onclick="location.href='../LoginForm/LoginForm.jsp';">
               <i class='bi bi-box-arrow-in-right' style='font-size: 9px' ></i>로그인</a></li>
               <% 
               }
               else {
               %>
              
               <!-- <li class="mbregi nav-item"> <i class='bi bi-person-lines-fill' style='font-size: 9px'></i></li> -->
               <li class="mbregi nav-item">
               		<a class="nav-link" ><%=session.getAttribute("UserName") %>님 환영합니다.</a>
               		<a class="nav-link" href="#"><i
                    class='bi bi-person-lines-fill' style='font-size: 9px'></i>회원정보수정</a>
               </li>
                <li class="mbregi nav-item"><a class="nav-link" href="#" onclick="location.href='../Login/Logout.jsp';">
               <i class='bi bi-box-arrow-right' style='font-size: 9px'></i>로그아웃</a></li>
               <% 
               }
               %>
            </ul>
         </div>
</div>
</nav>
</header>
</body>
</html>