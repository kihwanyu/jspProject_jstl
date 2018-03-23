<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.board.model.vo.*"%>
<%-- <% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:900px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	table {
		border:1px solid white;
		text-align:center;
	}
	.tableArea {
		width:650px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	.searchArea {
		width:650px;
		margin-left:auto;
		margin-right:auto;
	}
</style>
</head>
<body>

	 <c:set var="listCount" value="${pi.listCount}" scope="page"/>
	 <c:set var="currentPage" value="${pi.currentPage}" scope="page"/>
	 <c:set var="maxPage" value="${pi.maxPage}" scope="page"/>
	 <c:set var="startPage" value="${pi.startPage}" scope="page"/>
	 <c:set var="endPage" value="${pi.endPage}" scope="page"/>
	 
	<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<br>
		<h2 align="center">게시판</h2>
		<div class="tableArea">
			<table align="center">
				<tr>
					<th width="100px">글번호</th>
					<th width="100px">카테고리</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="150px">작성일</th>
				</tr>
				<c:if test="${!empty list}">
					<c:forEach var="b" items="${list}">
						
						<tr>
							<input type="hidden" value="${b.bid}">
							<td>${b.bno}</td>
							<td>${b.category}</td>
							<td>${b.bTitle}</td>
							<td>${b.bWriter}</td>
							<td>${b.bCount}</td>
							<td>${b.bDate}</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
		
		<%-- 페이지 처리 --%>
		<div class="pagingArea" align="center">
			<button onclick="location.href='${contextPath}/selectList.bo?currentPage=1'"><<</button>
			<c:choose>
				<c:when test="${currentPage <= 1}">
					<button disabled><</button>
				</c:when>
				<c:otherwise>
					<button onclick="location.href='${contextPath}/selectList.bo?currentPage=${currentPage + 1}'"><</button>
				</c:otherwise>
			</c:choose>
			<c:forEach var="p" begin="${startPage}" end="${endPage}" step="1">
				<c:choose>
					<c:when test="${p eq currentPage}">
						<button disabled>${p}</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='${contextPath}/selectList.bo?currentPage=${p}'">${p}</button>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${currentPage >= maxPage}">
					<button disabled>></button>
				</c:when>
				<c:otherwise>
					<button onclick="location.href='${contextPath}/selectList.bo?currentPage=${currentPage + 1}'">></button>
				</c:otherwise>
			</c:choose>
			<button onclick="location.href='${contextPath}/selectList.bo?curruntPage=${maxPage}'">>></button>
		</div>
		
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>-----</option>
				<option value="category">카테고리</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="searchValue">
			<button type="button">검색하기</button>
			<c:if test="${!empty loginUser}"><!-- 두개다 같은 연산자 -->
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			</c:if>
		</div>
		
		
	</div>
	
	<script>
		$(function(){
			$(".tableArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"black"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="${contextPath}/selectOne.bo?num=" + num;
			});
		});
	
	</script>
	







</body>
</html>








