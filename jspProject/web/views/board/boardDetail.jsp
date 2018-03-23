<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.board.model.vo.*"%>
<%-- <% Board b = (Board)request.getAttribute("b"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:800px;
		height:500px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	td {
		border:1px solid white;
	}
	.tableArea {
		board:1px solid white;
		width:800px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	#content {
		height:230px;
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<div class="outer">
		<br>
		<h2 align="center">게시판 상세보기</h2>
		<div class="tableArea">
			<table align="center" width="800px">
				<tr>
					<td>분야</td>
					<td>
						<span>${b.category} </span>
					</td>
					<td>제목</td>
					<td colspan="3">
						<span>${b.bTitle} </span>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<span>${b.bWriter} </span>
					</td>
					<td>조회수</td>
					<td>
						<span>${b.bCount} </span>
					</td>
					<td>작성일</td>
					<td>
						<span>${b.bDate} </span>
					</td>
					
				</tr>
				<tr>
					<td colspan="6">내용</td>
				</tr>
				<tr>
					<td colspan="6">
						<p id="content">${b.bContent }</p>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<div align="center">
			<button onclick="location.href='${contextPath}/selectList.bo'">메뉴로 돌아가기</button>
			<c:if test="${!empty loginUser && loginUser.nickName eq b.bWriter}">
				<button>수정하기</button>
			</c:if> 
		</div>
	</div>
</body>
</html>




