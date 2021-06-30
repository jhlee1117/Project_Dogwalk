<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<div class="container">
		<h1 align="center">Manager Main</h1>
		<h2 align="center">정보 관리</h2>
		<table class="table table-hover">
	<tr>
		<th>Notice</th>
		<td><a href="managerNoticeList.do">Notice</a></td>
	</tr>
	<tr>
		<th>Walk!</th>
		<td><a href="managerMboardList.do">Walk!</a></td>
	</tr>
	<tr>
		<th>Owner</th>
		<td><a href="managerOwnerList.do">Owner</a></td>
	</tr>
	<tr>
		<th>Dog</th>
		<td><a href="managerDogList.do">Dog</a></td>
	</tr>
	<tr>
		<th>Walker</th>
		<td><a href="managerWalkerList.do">Walker</a></td>
	</tr>
</table>
</div>
</body>
</html>