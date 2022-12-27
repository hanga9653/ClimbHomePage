<%@page import="mo1board.BoardDTO"%>
<%@page import="mo1board.BoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");
String b_flag = request.getParameter("b_flag");
BoardDAO dao = new BoardDAO(application);

BoardDTO dto = dao.selectView(num);

String sessionId = session.getAttribute("UserId").toString();
if(!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
/* 
URL의 패턴을 파악하면 내가 작성한 게시물이 아니어도 얼마든지 
수정페이지로 진입할 수 있다. 따라서 수정페이지 자체에서도 작성자
본인이 맞는지 확인하는 절차가 필요하다.
*/
//자원해제
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2>회원제 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">
      <!-- 
      게시물의 일련번호를 서버로 전송하기 위해서 hidden타입의 input이
      반드시 필요하다.
       -->
      <input type="hid-den" name="num" value="<%= dto.getNum() %>" />
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" 
                	value="<%= dto.getTitle()%>"/>
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width: 90%; height: 100px;"><%=dto.getContent() %></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='List.jsp?b_flag=${param.b_flag}';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
</form>
<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>