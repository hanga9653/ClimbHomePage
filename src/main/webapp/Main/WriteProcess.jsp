<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="mo1board.BoardDAO"%>
<%@page import="mo1board.BoardDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가
있으므로 글쓰기 처리 페이지에서도 반드시 로그인을 확인해야된다. -->
<%@ include file="./IsLoggedIn.jsp"%>  
<%
String saveDirectory = application.getRealPath("/UploadsDirectory");
int maxPostSize = 1024 * 1000;
String encoding = "UTF-8";

try{
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	String fileName=mr.getFilesystemName("ofile");
	String newFileName = "";
	if(fileName != null){
		String ext=fileName.substring(fileName.lastIndexOf("."));
		String now=new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		newFileName=now+ext;
		
		File oldFile=new File(saveDirectory+File.separator+fileName);
		File newFile=new File(saveDirectory+File.separator+newFileName);
		oldFile.renameTo(newFile);
	}
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String b_flag = mr.getParameter("b_flag");
	
	BoardDTO dto = new BoardDTO();
	dto.setTitle(title);
	dto.setContent(content);
	dto.setB_flag(b_flag);
	dto.setOfile(fileName);
	dto.setSfile(newFileName);

	dto.setId(session.getAttribute("UserId").toString());

	BoardDAO dao = new BoardDAO(application);

	dao.insertWrite(dto);
	dao.close();
	
	response.sendRedirect("List.jsp?b_flag="+b_flag);
}
catch(Exception e){
	e.printStackTrace();
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>