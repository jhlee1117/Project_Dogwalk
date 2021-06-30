<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/sessionChk.jsp" %>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>견주 정보</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<div class="container">
	<div id="content" align="center">
	<h1 align="center">회원정보</h1>
	<br>
	<table class="table table-striped">
		<tr align="center">
			<th scope="row">ID</th>
			<td><input class="form-control" type="text" name="own_id" value="${owner.own_id }" readonly="readonly">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Name</th>
			<td><input class="form-control" type="text" name="own_name" value="${owner.own_name }" readonly="readonly">
			</td> 
		</tr>
		<tr align="center">
			<th scope="row">Birthday</th>
			<td id="own_bth_dt" align="left">${owner.own_bth_dt }</td>
		</tr>
		<tr align="center">
			<th scope="row">Gender</th>
			<c:if test="${owner.own_gdr eq 'M' }">
				<td align="left">Male</td>
			</c:if>
			<c:if test="${owner.own_gdr eq 'F' }">
				<td align="left">Female</td>
			</c:if>
		</tr>
		<tr align="center">
			<th scope="row">Address</th>
			<td><input class="form-control" type="text" name="own_addr" value="${owner.own_addr }" readonly="readonly" >
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Tel</th>
			<td><input class="form-control" type="tel" name="own_tel" value="${owner.own_tel }" readonly="readonly"></td>
		</tr>
		<tr align="center">
			<th scope="row">E-mail</th>
			<td><input class="form-control" type="email" name="own_email" value="${owner.own_email }" readonly="readonly"></td>
		</tr>
	</table>
	</div>
	<br>	
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick ="location.href = 'updateFormOwner.do'" >정보 수정</button>
	</div>
	<br>
</div>
</body>
</html>