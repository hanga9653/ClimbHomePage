<%@page import="mo1board.BoardDTO"%>
<%@page import="mo1board.BoardDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String num = request.getParameter("num");
String title = request.getParameter("title");
String content = request.getParameter("content");
String b_flag = request.getParameter("b_flag");

BoardDTO dto = new BoardDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setContent(content);
dto.setB_flag(b_flag);

BoardDAO dao = new BoardDAO(application);
int affected = dao.updateEdit(dto);
dao.close();

if(affected == 1){
	response.sendRedirect("View.jsp?b_flag="+b_flag+"&num=" + dto.getNum());
}
else{
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>
