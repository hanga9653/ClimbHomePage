<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardDAO dao = new BoardDAO(application);

String b_flag = "notice";

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<style>a{text-decoration:none;}</style>
</head>
<body>
	<%@ include file="../Main/inc/top.jsp"%>
    <!-- 검색 폼 -->
    <form method="get" class="container"> 
    <input type="hidden" name="b_flag" value="<%= b_flag %>" /> 
    <table width="90%">
    <tr>
        <td align="center">
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="name">작성자</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>
    </table>
    </form>

    <!-- 목록 테이블 -->
    <table border="1" width="90%" class="container table table-hover">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
        </tr>

<c:choose>
   <c:when test="${ empty boardLists }">
   <!-- 게시물을 저장하고 있는 boardLists 컬렉션에 내용이 없다면 아래
   부분을 출력한다. -->
      <tr>
         <td colspan="6" align="center">
            등록된 게시물이 없습니다^^*
         </td>
      </tr>        
    </c:when>
    <c:otherwise>
    <!-- 게시물이 있을 때 컬렉션에 저장된 목록의 갯수만큼 반복한다. -->
       <c:forEach items="${ boardLists }" var="row" varStatus="loop">
       <tr>
          <td>
             ${ map.totalCount - (((map.pageNum-1) * map.pageSize)
                + loop.index) }
          </td>
          <td align="left">
          	<!-- 제목을 클릭할 경우 내용보기 페이지로 이동한다. -->
             <a href="../gallclimb/View.do?num=${ row.num }">
                ${ row.title }</a>
          </td>
          <td>${ row.id }</td>
          <td>${ row.visitcount }</td>
          <td>${ row.postdate }</td>
          
          <td>
          <!-- 첨부파일의 경우 필수사항이 아니므로 테이블 생성시에도 not null조건이
          적용되어 있지않다. 따라서 첨부파일이 있을때만 다운로드 링크를 출력한다. -->
          <c:if test="${ not empty row.ofile }">
             <a href="../Main/download.do?ofile=${ row.ofile }&sfile=${ row.sfile}&num=${ row.num }">[Down]</a>
          </c:if>
          </td>
       </tr>
        </c:forEach>
    </c:otherwise>
</c:choose>
    </table>
   <!-- 하단 메뉴(바로가기, 글쓰기) -->
    <table  width="90%" class="container">
        <tr align="center">
            <td>
            	<!-- 컨트롤러(서블릿)에서 클래스 호출을 통해 이미 페이지
            	번호가 문자열로 만들어져 있는 상태이므로 뷰(JSP)에서는
            	출력만 해주면된다. -->
                ${ map.pagingImg }
            </td>
            <td width="100"><button type="button"><a href="../gallclimb/Write.do">글쓰기</a></button></td>
        </tr>
    </table>
    <%@ include file="../Main/inc/Bottom.jsp"%>
</body>
</html>
