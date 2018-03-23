<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.notice.model.vo.*"%>
    
<%-- <% Notice n = (Notice)request.getAttribute("n"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<!-- private int nno;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private int nCount;
	private Date nDate;
	private String status; -->
	<%@ include file="../common/menubar.jsp" %>
	<div class="outer">
		<br>
		<h2 align="center">공지 사항 내용</h2>
		<div class="tableArea">
			<table>
				<tr>
					<td>제목</td>
					<td colspan="3">
						<input type="text" size="50" name="title" value="${n.nTitle }" readonly>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" value="${n.nWriter }" readonly>
					</td>
					<td>작성일</td>
					<td>
						<input type="date" value="${n.nDate }" readonly> 
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
						<textarea rows="15" cols="60" readonly>${n.nContent }</textarea>
					<td>
				</tr>
			</table>
			<br>
			<div align="center">
				<button onclick="location.href='${contextPath}/selectList.no'">메뉴로 돌아가기</button>
				<c:if test="${!empty loginUser && sessionScope.loginUser.userId eq 'admin'}">
					<button onclick="location.href='${contextPath}/selectNotice.no?num=${n.nno }'">수정하기</button>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>