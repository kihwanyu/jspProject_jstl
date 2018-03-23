<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.outer {
		width:600px;
		height:500px;
		background:black;
		color:white;
		margin-top:50px;
		margin-left:auto;
		margin-right:auto;
	}
	
	#idCheck, #ckZip, #goMain, #joinBtn {
		background:orangered;
		border-radius:5px;
		width:80px;
		height:25px;
		text-align:center;
	}
	#idCheck:hover, #ckZip:hover, 
	#goMain:hover, #joinBtn:hover {
		cursor:pointer;
	}
	td {
		text-align:right;
	}
	#ckZip, #joinBtn {
		background:yellowgreen;
	}
	#joinBtn, #goMain {
		display:inline-block;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<br>
		<h2 align="center">회원가입</h2>
		
		<form id="joinForm" action="<%=request.getContextPath()%>/insertMember.me" method="post">
			<table align="center">
				<tr>
					<td width="200px">* 아이디</td>
					<td><input type="text" maxlength="13" name="userId"></td>
					<td width="200px"><div id="idCheck">중복확인</div></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" maxlength="13" name="userPwd"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" maxlength="13" name="userPwd2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td>* 닉네임</td>
					<td><input type="text" maxlength="5" name="nickName"></td>
					<td><label id="nnResult"></label></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td>
						<input type="text" maxlength="3" name="tel1" size="2">-
						<input type="text" maxlength="4" name="tel2" size="2">-
						<input type="text" maxlength="4" name="tel3" size="2">
					</td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
					<td></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="zipCode"></td>
					<td><div id="ckZip">검색</div></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="address1"></td>
					<td></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" name="address2"></td>
					<td></td>
				</tr>
				<tr>
					<td>관심분야</td>
					<td>
						<input type="checkbox" id="sports" name="interest" value="운동">
						<label for="sports">운동</label>
						<input type="checkbox" id="climbing" name="interest" value="등산">
						<label for="climbing">등산</label>
						<input type="checkbox" id="fishing" name="interest" value="낚시">
						<label for="fishing">낚시</label>
						<input type="checkbox" id="cooking" name="interest" value="요리">
						<label for="cooking">요리</label>
						<input type="checkbox" id="game" name="interest" value="게임">
						<label for="game">게임</label>
						<input type="checkbox" id="etc" name="interest" value="기타">
						<label for="etc">기타</label>
					</td>
					<td></td>
				</tr>
			</table>
			<div align="center">
				<div id="goMain" onclick="goMain();">메인으로</div>
				<div id="joinBtn" onclick="insertMember(); ">가입하기</div>
			</div>
			<script>
				function insertMember(){
					$("#joinForm").submit();
				}
				function goMain(){
					location.href="<%= request.getContextPath() %>/index.jsp";
				}
			
			</script>
		
		
		</form>
		
		
		
	</div>
</body>
</html>









