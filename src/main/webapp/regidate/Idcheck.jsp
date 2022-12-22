<%@page import="MemberTable1.MemberDAO"%>
<%@page import="MemberTable1.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");

MemberDAO dao = new MemberDAO(application);

int mdto = dao.selectCheckId(id);
dao.close();

if(mdto == 0){
	out.print("사용가능한 아이디입니다.");
}
else if(mdto == 1){
	out.print("중복된 아이디입니다.");
}
else{
	out.print("에러발생");
}

%>
</body>
</html>