<%@page import="MemberTable1.MemberDTO"%>
<%@page import="MemberTable1.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userId = request.getParameter("id");
String userPwd = request.getParameter("pass");

String mysqlDriver = application.getInitParameter("mysqlDriver");
String mysqlURL = application.getInitParameter("mysqlURL");
String mysqlId = application.getInitParameter("mysqlId");
String mysqlPwd = application.getInitParameter("mysqlPwd");

MemberDAO dao = new MemberDAO(mysqlDriver, mysqlURL, mysqlId, mysqlPwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

if(memberDTO.getId()!=null){
	session.setAttribute("UserId", memberDTO.getId());
	session.setAttribute("UserName", memberDTO.getName());
	response.sendRedirect("LoginForm.jsp");
}
else{
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
}
%>
