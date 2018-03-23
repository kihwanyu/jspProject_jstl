<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jsp.notice.model.vo.*"%>
<%-- <% ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); %> --%>
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
	table {
		border:1px solid white;
		text-align:center;
	}
	.tableArea {
		width:600px;
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
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지사항</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
				<tr>
					<th width="100px">글번호</th>
					<th width="300px">글제목</th>
					<th width="100px">작성자</th>
					<th width="100px">조회수</th>
					<th width="100px">작성일</th>
				</tr>
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.nno }</td>
						<td>${list.nTitle }</td>
						<td>${list.nWriter }</td>
						<td>${list.nCount }</td>
						<td>${list.nDate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="searchArea" align="center">
			<select id="searchCondition" name="searchCondition">
				<option>---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			<input type="search" name="searchValue">
			<button type="button">검색하기</button>
			<c:if test="${!empty loginUser && sessionScope.loginUser.userId eq 'admin'}">
			<button onclick="location.href='views/notice/noticeInsertForm.jsp'">작성하기</button>
			</c:if>
		</div>
	</div>
	<script>
		$(function(){
			$("#listArea td").mouseenter(function(){
				$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css("background","black");
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				console.log(num);
				location.href = "${contextPath}/selectOne.no?num=" + num;
			});
		});
	</script>
	
</body>
</html>








