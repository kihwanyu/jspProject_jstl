<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%-- <% ArrayList<HashMap<String, Object>> list 
	= (ArrayList<HashMap<String, Object>>)request.getAttribute("list"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:1000px;
		height:700px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	.searchArea {
		width:420px;
		margin-left:auto;
		margin-right:auto;
	}
	.thumbnailArea {
		width:760px;
		height:550px;
		margin-left:auto;
		margin-right:auto;
	}
	.thumb-list {
		width:220px;
		border:1px solid white;
		display:inline-block;
		margin:10px;
		align:center;
	}
	.thumb-list:hover {
		opacity:0.8;
		cursor:pointer;
	}
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<div class="outer">
		<br>
		<h2 align="center">사진 게시판</h2>
		
		<div class="thumbnailArea" align="center">
		<c:forEach var="list" items="${list}">
			<div class="thumb-list" align="center">
				<div>
					<input type="hidden" value="${list.bid} ">
					<img src="/jsp/thumbnail_uploadFiles/${list.changeName}" width="200px" height="150px">
				</div>
				<p>No. ${list.bno} ${list.btitle}<br>
				조회수 : ${list.bcount}
				</p>
			</div>
		</c:forEach>
		
		</div>
		<script>
			$(function(){
				$(".thumb-list").click(function(){
					var num = $(this).children().children().eq(0).val();
					console.log(num);
					
					location.href= "${contextPath}/selectOne.tn?num=" + num;
				});
			});
		</script>
		
		<div class="searchArea">
			<select id="searchCondition" name="searchCondition">
				<option>----</option>
				<option>작성자</option>
				<option>제목</option>
				<option>내용</option>
			</select>
			<input type="search">
			<button type="submit">검색하기</button>
			<c:if test="${!empty loginUser}">
				<button onclick="location.href='views/thumbnail/thumbnailInsertForm.jsp'">작성하기</button>
			</c:if>
		</div>
	
	</div>
	
	
	
	

</body>
</html>









