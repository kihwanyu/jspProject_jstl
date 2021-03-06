<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.board.model.vo.*, java.util.*"%>
<%-- <% 
	Board b = (Board)request.getAttribute("b");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	Attachment titleImg = fileList.get(0);
	Attachment detailImg1 = fileList.get(1);
	Attachment detailImg2 = fileList.get(2);
	Attachment detailImg3 = fileList.get(3);
%> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer {
		width:1000px;
		height:650px;
		background:black;
		color:white;
		margin-left:auto;
		margin-right:auto;
		margin-top:50px;
	}
	.detail td{
		text-align:center;
		width:1000px;
		border:1px solid white;
	}
	#titleImgArea {
		width:500px;
		height:300px;
		margin-left:auto;
		margin-right:auto;
	}
	#contentArea {
		height:30px;
	}
	.detailImgArea {
		width:250px;
		height:210px;
		margin-left:auto;
		margin-right:auto;
	}
	#titleImg {
		width:500px;
		height:300px;
	}
	.detailImg {
		width:250px;
		height:180px;
	}
	

</style>
</head>
<body>
	
	<c:set var="titleImg" value="${fileList.get(0)}" scope="page"/>
	<c:set var="detailImg1" value="${fileList.get(1)}" scope="page"/>
	<c:set var="detailImg2" value="${fileList.get(2)}" scope="page"/>
	<c:set var="detailImg3" value="${fileList.get(3)}" scope="page"/>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="outer">
		<table class="detail" align="center">
			<tr>
				<td width="50px">제목</td>
				<td colspan="5">
					<label>${b.bTitle}</label>
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<label>${b.bWriter}</label>
				</td>
				<td>조회수</td>
				<td>
					<label>${b.bCount}</label>
				</td>
				<td>작성일</td>
				<td>
					<label>${b.bDate}</label>
				</td>
			</tr>
			<tr>
				<td>대표사진</td>
				<td colspan="4">
					<img id="titleImg" src="${contextPath }/thumbnail_uploadFiles/${titleImg.changeName}">
				</td>
				<td>
					<button onclick="location.href='${contextPath }/download.tn?num=${titleImg.fid}'">다운로드</button>
				</td>
			</tr>
			<tr>
				<td>사진 메모</td>
				<td colspan="6">
					<p id="contentArea">${b.bContent }</p>
				</td>
			</tr>
		</table>
		<table class="detail">
			<tr>
				<td>
					<div class="detailImgArea">
						<img id="detailImg1" class="detailImg" 
						src="${contextPath }/thumbnail_uploadFiles/${detailImg1.changeName}">
						<button onclick="location.href='${contextPath }/download.tn?num=${detailImg1.fid}'">다운로드</button>
					</div>
				</td>
				<td>
					<div class="detailImgArea">
						<img id="detailImg2" class="detailImg" 
						src="${contextPath }/thumbnail_uploadFiles/${detailImg2.changeName}">
						<button onclick="location.href='${contextPath }/download.tn?num=${detailImg2.fid}'">다운로드</button>
					</div>
				</td>
				<td>
					<div class="detailImgArea">
						<img id="detailImg3" class="detailImg" 
						src="${contextPath }/thumbnail_uploadFiles/${detailImg3.changeName}">
						<button onclick="location.href='${contextPath }/download.tn?num=${detailImg3.fid}'">다운로드</button>
					</div>
				</td>
			</tr>
		</table>
	</div>













</body>
</html>