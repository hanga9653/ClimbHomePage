<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일첨부형 게시판 - 글쓰기(Write)</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.content.value == "") {
        alert("내용을 입력하세요.");
        form.content.focus();
        return false;
    }
}
</script>
</head>
<body>

<%@ include file="../Main/inc/top.jsp"%>
<form name="writeFrm" method="post" action="../gallclimb/Write.do"
	enctype="multipart/form-data"
      onsubmit="return validateForm(this);">
      <input type="hidden" name="id" value="<%=session.getAttribute("UserId") %>" />
      <input type="hid/den" name="b_flag" value="${param.b_flag }" />
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td>첨부파일</td>
            <td>
                <input type="file" name="ofile" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='../gallclimb/List.do';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
    <%@ include file="../Main/inc/Bottom.jsp"%>
</form>
</body>
</html>
