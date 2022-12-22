<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.m-top-wrap {
	width: 1280px;
	margin: 0 auto 50px auto;
	padding: 0 40px;
	font-size: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<%@ include file="../Main/inc/top.jsp"%>
	<!-- 슬라이드 배너 -->
	<form action="">
		<div id="demo" class="carousel slide" data-bs-ride="carousel">

			<!-- Indicators/dots -->
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
					class="active"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			</div>

			<!-- The slideshow/carousel -->
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../image/la.jpg" alt="Los Angeles"
						class="mx-auto d-block d-block" style="width: 100% hight:40%">
					<div class="carousel-caption">
						<h3>Los Angeles</h3>
						<p>We had such a great time in LA!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img src="../image/me1.jpg" alt="gall"
						class="mx-auto d-block d-block" style="width: 100% hight:40%">
					<div class="carousel-caption">
						<h3>GAR</h3>
						<p>Thank you, GALL!</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="https://ldb-phinf.pstatic.net/20200517_50/1589691271053aqnWt_JPEG/KakaoTalk_20200517_124435951_04.jpg?type=f804_408_60_sharpen"
						alt="New York" class="mx-auto d-block d-block"
						style="width: 100% hight:40%">
					<div class="carousel-caption"></div>
				</div>
			</div>

			<!-- Left and right controls/icons -->
			<button class="carousel-control-prev" type="button"
				data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
	</form>

	<!-- 홈페이지 메인 -->
	<form id="main-contents" align="center">
		<div class="m-h2-bg">
			<h2 class="m-h2-tit01">
				<img src="http://www.b-bloc.co.kr/images/m_h2_tit01.png"
					alt="우리가족 건강 주치의, 전문클리닉소개">
			</h2>
			<p class="m-h2-text01">
				<img src="http://www.b-bloc.co.kr/images/m_h2_text01.png"
					alt="풍부한 경험을 가진 대학교수 전문의료진 아이라이크닥터는 보건복지부에서 지정한 의료기관입니다.">
			</p>
		</div>


		
	</form>
	<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>