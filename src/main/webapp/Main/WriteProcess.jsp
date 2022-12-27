<%@page import="mo1board.BoardDAO"%>
<%@page import="mo1board.BoardDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가
있으므로 글쓰기 처리 페이지에서도 반드시 로그인을 확인해야된다. -->
<%@ include file="./IsLoggedIn.jsp"%>  
<%
String title = request.getParameter("title");
String content = request.getParameter("content");
String b_flag = request.getParameter("b_flag");

BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setB_flag(b_flag);

dto.setId(session.getAttribute("UserId").toString());

BoardDAO dao = new BoardDAO(application);

int iResult = dao.insertWrite(dto);

dao.close();

if(iResult == 1){
	response.sendRedirect("List.jsp?b_flag="+b_flag);
}else{
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>