<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.notice.model.vo.*"%>
    
<%-- <% Notice n = (Notice)request.getAttribute("n"); %> --%>
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
	}
	.tableArea{
		width:450px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	
	
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<c:choose>
		<c:when test="${!empty loginUser && sessionScope.loginUser.userId eq 'admin'}">
			<div class="outer">
				<br>
				<h2 align="center">공지 사항 수정</h2>
				<div class="tableArea">
					<form id="updateForm" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td colspan="3">
								<input type="text" size="50" name="title" value="${n.nTitle}">
								<input type="hidden" name="nno" value="${n.nno }">
							</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>
								<input type="text" value="${n.nWriter} " readonly>
							</td>
							<td>작성일</td>
							<td>
								<input type="date" value="${n.nDate} "> 
							</td>
						</tr>
						<tr>
							<td>내용<td>
							<td><td>
							<td><td>
							<td><td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea name="content" rows="15" cols="60">${n.nContent} </textarea>
							<td>
						</tr>
					</table>
					<br>
					<div align="center">
						<button onclick="complet();">작성완료</button>
						<button onclick="deleteNotice();">삭제하기</button>
					</div>
					</form>
					<script>
						function complet(){
							$("#updateForm").attr("action", "${contextPath}/update.no");
						}
						
						function deleteNotice(){
							$("#updateForm").attr("action", "${contextPath}/deleteNotice.no");
						}
						
					</script>
				</div>
			</div>	
		</c:when>
		<c:otherwise>
		<c:url value="../common/errorPage.jsp" var="errorPage">
			   <c:param name="msg" value="잘못된경로입니다."/>
			</c:url>
			<c:redirect url = "${errorPage }"/>
		</c:otherwise>
	</c:choose>

</body>
</html>