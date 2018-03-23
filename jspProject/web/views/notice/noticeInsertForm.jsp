<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		margin-right:auto;
		margin-left:auto;
		margin-top:50px;
	}
	table {
		border:1px solid white;
	}
	.tableArea {
		width:450px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}
	
	
	
	
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<c:choose>
		<c:when test="${!empty loginUser && sessionScope.loginUser.userId eq 'admin'}"><!-- 두개다 같은 연산자 -->
			<div class="outer">
				<br>
				<h2 align="center">공지사항 작성</h2>
				<div class="tableArea">
					<form action="${contextPath}/insert.no" method="post">
						<table>
							<tr>
								<td>제목</td>
								<td colspan="3">
									<input type="text" size="50" name="title">
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td>
									<input type="text" value="${sessionScope.loginUser.nickName} " name="writer" readonly>
									<input type="hidden" value="${sessionScope.loginUser.uno}" name="uno">
								</td>
								<td>작성일</td>
								<td><input type="date" name="date"></td>
							</tr>
							<tr>
								<td>내용</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4">
									<textarea name="content" cols="60" rows="15" style="resize:none;"></textarea>
								</td>
							</tr>
						</table>
						<br>
						<div align="center">
							<button type="reset">취소하기</button>
							<button type="submit">등록하기</button>
						</div>
					
					</form>
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











