<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.background {
		width:100%;
		height:600px;
	}
	.tile {
		width:150px;
		height:150px;
		background:black;
		display:inline-block;
		color:white;
	}
	.first-line {
		margin-top:10%;
	}
	.tile1 {
		background:darkgray;
	}
	.notile {
		visibility:hidden;
	}
	.tile-menu:hover {
		background:orangered;
		cursor:pointer;
		color:white;
	}

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<%@ include file="views/common/menubar.jsp" %>
	<div class="background" align="center">
		<div class="first-line">
			<div class="tile tile-menu"></div>
			<div class="tile tile1"></div>
			<div class="tile tile-menu"></div>
			<div class="tile notile"></div>
			<div class="tile tile1"></div>
		</div>
		<div class="second-line">
			<div class="tile notile"></div>
			<div class="tile tile1"></div>
			<div class="tile notile"></div>
			<div class="tile tile1"></div>
			<div class="tile tile-menu"></div>
		</div>
	</div>
	
	
	
</body>
</html>