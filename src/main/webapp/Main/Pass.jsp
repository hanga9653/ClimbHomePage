<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판 - 비밀번호 검증(Pass)</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.pass.value == "") {
        alert("비밀번호를 입력하세요.");
        form.pass.focus();
        return false;
    }
}
</script>
</head>
<body>
<%@ include file="../Main/inc/top.jsp"%>
<h2>파일첨부형 게시판 - 비밀번호 검증(Pass)</h2>
<!-- 글쓰기 페이지를 복사하여 해당 페이지를 만들때 비밀번호 검증시에는
첨부파일이 필요없으므로 enctype은 제거해야한다. 만약 제거하지 않으면
request내장객체로 폼값을 받을 수 없으므로 주의해야한다. -->
<form name="writeFrm" method="post" action="../gallclimb/Pass.do"
      onsubmit="return validateForm(this);">
    <input type="hidden" name="num" value="${param.num }" />
    <input type="hidden" name="mode" value="${mode }" />
    
    <table border="1" width="90%">
        <tr>
            <td></td>
            <td>
                <input type="password" name="pass" style="width: 100px;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">검증하기</button>
                <button type="reset">다시입력</button>
                <button type="button" onclick="location.href='../gallclimb/List.do';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>
