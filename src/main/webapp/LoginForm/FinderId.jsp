<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validateForm(form) {
	if(form.name.value==""){
		alert("이름을 입력하세요");
		form.name.focus();
		return false;
	}
	if(form.email.value==""){
		alert("이메일을 입력하세요.");
		form.email.focus();
		return false;
	}
}
function idFind(){
	var ifn = document.myForm;
	ifn.action="FinderProcess.jsp";
}
</script>
</head>
<body>
	<%@ include file ="../Main/inc/top.jsp" %>
	<div class="container p-5 my-4 border" align="center">
		<form name="myForm" method="post" onsubmit="return validateForm(this);">
			<div class="container mt-3">
			  <ul class="nav justify-content-center nav-tabs">
			    <li class="nav-item">
			      <a class="nav-link active" href="./FinderId.jsp" name="id">아이디 찾기</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="./FinderPw.jsp" name="pw" >비밀번호 찾기</a>
			    </li>
			  </ul>
			</div>
			<table class="mt-3">
				<tr>
					<th>이름</th>
					<td><input type="text" maxlength="20" placeholder="이름" name="name" style="width:200px" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text"  placeholder="'@'포함해서 작성" name="email" style="width: 200px" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" onclick="idFind();"/>
						 <input type="reset" value="취소" onclick="location.href='../Main/mainHome.jsp'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>