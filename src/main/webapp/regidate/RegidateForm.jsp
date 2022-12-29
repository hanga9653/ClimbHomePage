<%@page import="MemberTable1.MemberDAO"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>regidateForm</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">  
	
<script type="text/javascript">
var idch = 0;
function validateForm(form) {
	if(form.id.value==""){
		alert("아이디를 입력하세요");
		form.id.focus();
		return false;
	}
	if(idch == 0){
		alert("중복체크해주세요.");
		return false;
	}
	if(form.pass.value==""){
		alert("비밀번호를 입력하세요");
		form.pass.focus();
		return false;
	}
	if(form.name.value==""){
		alert("이름을 입력하세요");
		form.name.focus();
		return false;
	}
	if(form.email1.value==""){
		alert("이메일을 입력하세요.");
		form.email1.focus();
		return false;
	}
	if(form.email2.value==""){
		alert("이메일 주소를 입력하세요.");
		form.email2.focus();
		return false;
	}
	if(form.phone1.value==""){
		alert("전화번호가 잘못 입력되었습니다.");
		form.phone1.focus();
		return false;
	}
	if(form.phone2.value==""){
		alert("전화번호가 잘못 입력되었습니다.");
		form.phone2.focus();
		return false;
	}
	if(form.phone3.value==""){
		alert("전화번호가 잘못 입력되었습니다.");
		form.phone3.focus();
		return false;
	}
}
function inputEmail(frm){
    var domain = frm.email_domain.value;
    if(domain==''){//--선택-- 부분을 선택했을때
        frm.email1.value = '';//모든 입력값을 지운다. 
        frm.email2.value = '';
    }
    else if(domain=='직접입력'){//'직접입력'을 선택했을때
        frm.email2.readOnly = false;//사용자가 입력해야 하므로 readonly속성을 해제한다. 
        frm.email2.value = '';
        frm.email2.focus();
    }
    else{//도메인을 선택했을때
        frm.email2.value = domain;//선택한 도메인을 입력한다. 
        frm.email2.readOnly = true;//입력된 값을 수정할 수 없도록 readonly속성을 활성화한다. 
    }
}  
function idCheck(){
	var fn = document.forms[0];
		if(fn.id.value==""){
			alert("아이디를 입력해주세요");
			fn.id.focus();
		}
		else{
			//fn.id.readOnly = true;
			window.open("./Idcheck.jsp?id="+fn.id.value,"idover", "width=400, height=300");
		}
		idch=1;
}
</script>

<style>
	form{font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: 12px;margin: 0px auto;}
	.c_imp{color : red;}
	.btn_search{background-color: #3d3d3d; color: #ffffff; width: 70px; height: 23px; padding:1px 0 2px;}
    .btn_search:hover{background-color: #6d6d6d;}
</style>
</head>
<body>
	<%@ include file ="../Main/inc/top.jsp" %>
	<div class="container p-5 my-5 border">
	
	<h1>회원가입</h1>
	
	<form name="myForm" method="post" action="RegidateProcess.jsp" onsubmit="return validateForm(this);">
		<table class="table">
			<tr>
				<th><span class="c_imp">*</span>아이디</th>
				<td>
					<input type="text" style="width: 120px;" name="id"
					id="id"/>
					<button type="button" class="btn_search" onclick="idCheck();">중복확인</button>
				</td>
			</tr>
			<tr>
				<th><span class="c_imp">*</span>비밀번호</th>
				<td>
					<input type="password" name="pass"/>
				</td>
			</tr>
			<tr>
				<th><span class="c_imp">*</span>이름</th>
				<td>
					<input type="text" style="width: 100px;" name="name" />
				</td>
			</tr>
			<tr>
				<th><span class="c_imp">*</span>이메일</th>
				<td>
					<input type="text" name="email1"/>
					<span>@</span>
					<input type="text" name="email2" style="width: 100px;"/>
					<!-- 도메인 선택할 수 있게 만들어주기  -->
					<select name="email_domain" onchange="inputEmail(this.form);" class="userSelect w100">
                        <option value="" checked> -- 선택 --</option>
                        <option value="naver.com">naver.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="daum.net">daum.net</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="직접입력">직접입력</option>
                    </select>
				</td>
			</tr>
			<tr>
				<th><span class="c_imp">*</span>전화번호</th>
				<td>
					<input type="text" maxlength="3" style="width: 50px" name="phone1" /> - 
					<input type="text" maxlength="4" style="width: 80px" name="phone2" /> - 
					<input type="text" maxlength="4" style="width: 80px" name="phone3" />
				</td>
			</tr>
			
		</table>
		
		<table style="width:670px; margin-top:20px;">
            <tr>
                <td align="center">                    
                    <input type="submit" value="회원가입" class="btn_submit" />
                    &nbsp;&nbsp;
                    <input type="reset" value="취소" onclick="location.href='../Main/mainHome.jsp'" />
                </td>
            </tr>
        </table> 
	</form>
	</div>
	<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>