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
		
	}
	.tableArea {
		width:500px;
		height:350px;
		margin-left:auto;
		margin-right:auto;
	}

</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	<c:choose>
		<c:when test="${!empty loginUser }">
			<div class="outer">
				<br>
				<h2 align="center">게시판 작성</h2>
				<div class="tableArea">
					<form action="${contextPath}/insert.bo" method="post">
						<table>
							<tr>
								<td>분야</td>
								<td>
									<select name="category">
										<option>-----</option>
										<option value="10">공통</option>
										<option value="20">운동</option>
										<option value="30">등산</option>
										<option value="40">낚시</option>
										<option value="50">게임</option>
										<option value="60">요리</option>
										<option value="70">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>제목</td>
								<td colspan="3">
									<input type="text" size="55" name="title">
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td colspan="3">
									<textarea rows="15" cols="60" name="content" style="resize:none;"></textarea>
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













