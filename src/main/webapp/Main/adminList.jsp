<%@page import="mo1board.BoardDTO"%>
<%@page import="mo1board.BoardDAO"%>
<%@page import="utils.BoardPage"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> param = new HashMap<String, Object>();

String b_flag = request.getParameter("b_flag");
param.put("b_flag", b_flag);

String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

if(searchWord != null){
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
int totalCount = dao.selectCount(param);


/**페이징 코드 추가부분 s***********************/
int pageSize = 
	Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = 
	Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

int totalPage = (int)Math.ceil((double)totalCount / pageSize);

int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals(""))
	pageNum = Integer.parseInt(pageTemp);

int start = (pageNum - 1) * pageSize;
int end = pageSize;

param.put("start", start);
param.put("end", end);
/**페이징 코드 추가부분 e***********************/

List<BoardDTO> boardLists = dao.selectListPage(param);
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 공통링크 -->
<%@ include file="../Main/inc/top.jsp"%>
	
    <!-- 검색폼 -->
    <form method="get">  
    <table width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <table class="table-bordered" border="1" width="60%"  align="center">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용 -->
<%
if (boardLists.isEmpty()) {
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
    int virtualNum = 0; 
	int countNum = 0;
    for (BoardDTO dto : boardLists)
    {
    	virtualNum = totalCount - (((pageNum - 1)*pageSize) + countNum++);
%>
        <tr>
        	<!-- 게시물의 가상번호 -->
            <td><%= virtualNum %></td>
            <!-- 제목 -->  
            <td> 
                <a href="View.jsp?b_flag=<%= dto.getB_flag() %>&num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
            </td>
            <!-- 작성자 아이디 -->
            <td><%= dto.getId() %></td>
            <!-- 조회수 -->           
            <td><%= dto.getVisitcount() %></td>
            <!-- 작성일 -->   
            <td><%= dto.getPostdate() %></td>    
        </tr>
<%
    }
}
%>
    </table>
   
    <table width="81%" >
        <tr align="center">
        	<!-- 페이징 처리 -->
        	<td>
        		<% System.out.println("현재경로="+request.getRequestURI()+"?b_flag="+b_flag); %>
        		<%= BoardPage.pagingStr(totalCount, pageSize,
        				blockPage, pageNum, request.getRequestURI()+"?b_flag="+b_flag) %>
        	</td>
        	<!-- 글쓰기 버튼 -->
        	<%
        	if(session.getAttribute("UserId")!=null&&session.getAttribute("UserId").equals("admin")){
        	%>
            <td align="right"><button type="button" onclick="location.href='Write.jsp?b_flag=${param.b_flag}';">글쓰기
                </button></td>
           <%
        	}
           %>
        </tr>
    </table>
<%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>