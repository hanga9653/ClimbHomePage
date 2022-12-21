<%@page import="MemberTable1.MemberDTO"%>
<%@page import="MemberTable1.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MemberDAO dao = new MemberDAO(application);

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email1")+"@"+request.getParameter("email2");
String phone = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");

MemberDTO dto = new MemberDTO();

dto.setId(id);
dto.setPass(pass);
dto.setName(name);
dto.setEmail(email);
dto.setPhone(phone);

int iResult = dao.insertMember(dto);
dao.close();

if(iResult==1){
	response.sendRedirect("../LoginForm/LoginForm.jsp");
}
else{
	request.getRequestDispatcher("RegidateForm.jsp")
	.forward(request, response);
}
%>

