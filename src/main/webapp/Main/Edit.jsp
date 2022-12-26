<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 패스워드 검증을 통해 수정페이지로 진입하므로 해당 페이지에서는
추가로 패스워드를 입력하지 않는다.*/
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
<form name="writeFrm" method="post"  enctype="multipart/form-data"
	action="../gallclimb/edit.do" onsubmit="return validateForm(this);">
	<!-- 게시물 수정을 위한 일려번호 -->
    <input type="hidden" name="num" value="${dto.num }" />
    <!-- 기존의 원본파일명 -->
    <input type="hidden" name="prevOfile" value="${dto.ofile }" />
    <!-- 기존의 서버에 저장된 파일명 -->
    <input type="hidden" name="prevSfile" value="${dto.sfile }" />
    <!-- 해당 hidden값은 게시물 수정시 첨부파일이 없는경우 사용될것이다. -->
    
    <table class="table table-hover" border="1" width="90%">
        <tr>
            <td>작성자</td>
            <td>
                <input type="text" name="name" style="width: 90%;" 
                	value="${dto.id }"/>
            </td>
        </tr>
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" 
                	value="${dto.title }"/>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;">${dto.content }</textarea>
            </td>
        </tr>
        <tr>
        	<td>첨부 파일</td>
        	<td>
        		<input type="file" name="ofile" />
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