<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jsp.member.model.vo.*"%>
<%-- <% Member loginUser = (Member)session.getAttribute("loginUser"); %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
	body {
		background:url("/jsp/image/city1.PNG") no-repeat;
		background-size:cover;
	}
	.btns {
		align:center;
	}
	
	#loginBtn, #memberJoinBtn, #logoutBtn, #changeInfo {
		display:inline-block;
		vertical-align:middle;
		text-align:center;
		background:orangered;
		color:white;
		height:25px;
		width:100px;
		border-radius:5px;
	}
	
	#memberJoinBtn {
		background:yellowgreen;
	}
	
	#loginBtn:hover, #memberJoinBtn:hover, 
	#logoutBtn:hover, #changeInfo:hover {
		cursor:pointer;
	}
	.loginArea > form, #userInfo {
		float:right;
	}
	.wrap {
		background:black;
		width:100%;
		height:50px;
	}
	.menu {
		background:black;
		color:white;
		text-align:center;
		vertical-align:middle;
		width:150px;
		height:50px;
		display:table-cell;
	}
	.nav {
		width:600px;
		margin-left:auto;
		margin-right:auto;
	}
	.menu:hover {
		background:darkgray;
		color:orangered;
		font-weight:bold;
		cursor:pointer;
	}
	#logoutBtn, #changeInfo {
		background:orangered;
		color:white;
		text-decoration:none;
		border-radius:5px;
	}
	#changeInfo{
		background:yellowgreen;
	}
	
</style>
</head>
<body>
	<h1 align="center">Welcome JSP World</h1>
	
	<div class="loginArea">
	
		<c:choose>
			<c:when test="${empty loginUser }"><!-- 두개다 같은 연산자 -->
				<form id="loginForm" action="${contextPath}/login.me" method="post">
					<table>
						<tr>
							<td><label class="text">ID : </label></td>
							<td><input type="text" name="userId"></td>
						</tr>
						<tr>
							<td><label class="text">PWD : </label></td>
							<td><input type="password" name="userPwd"></td>
						</tr>
					</table>
					<div class="btns" align="center">
						<div id="memberJoinBtn" onclick="memberJoin();">회원가입</div>
						<div id="loginBtn" onclick="login(); ">로그인</div>
					</div>
				</form>
			</c:when>
			<c:otherwise><!-- 나머지 -->
				<div id="userInfo">
					<label>${sessionScope.loginUser.nickName }님의 방문을 환영합니다.</label>
					<div class="btns">
						<div id="changeInfo" onclick="changeInfo();">정보수정</div>
						<div id="logoutBtn" onclick="logout();">로그아웃</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		
		
		<script>
			function login(){
				$('#loginForm').submit();
			}
			
			function logout(){
				location.href="${contextPath}/logout.me";
				
			}
			
			function memberJoin(){
				location.href="/jsp/views/member/memberJoinForm.jsp";
				
			}
			
			function changeInfo(){}
		</script>
	</div>
	<br clear="both">
	<br>
	<div class="wrap">
		<div class="nav">
			<div class="menu" onclick="goHome();">HOME</div>
			<div class="menu" onclick="goNotice();">공지사항</div>
			<div class="menu" onclick="goBoard();">게시판</div>
			<div class="menu" onclick="goThumbnail();">사진게시판</div>
		</div>
	</div>
	<script>
		function goHome(){
			location.href="/jsp/index.jsp";
			
		}
		
		function goNotice(){
			location.href="/jsp/selectList.no";
		}
		
		function goBoard(){
			location.href="/jsp/selectList.bo";
		}
		function goThumbnail(){
			location.href="/jsp/selectList.tn";
		}
	
	</script>
</body>
</html>