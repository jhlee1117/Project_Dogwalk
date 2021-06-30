<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>견주 프로필 상세보기</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript">
		function goBack() {
			history.back();	
		}
	</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">${owner.own_id } Profile</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row">ID</th>
				<td>${owner.own_id }</td>
			</tr>
			<tr align="center">
				<th scope="row">Name</th>
				<td>${owner.own_name }</td>
			</tr>
			<tr align="center">
				<th scope="row">Gender</th>
				<td>${owner.own_gdr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Birthday</th>
				<td>${owner.own_bth_dt }</td>
			</tr>
			<tr align="center">
				<th scope="row">Address</th>
				<td>${owner.own_addr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Email</th>
				<td>${owner.own_email }</td>
			</tr>
			<tr align="center">
				<th scope="row">Phone</th>
				<td>${owner.own_tel }</td>
			</tr>
			<tr align="center">
				<th scope="row">Registration</th>
				<td>${owner.own_reg_dt }</td>
			</tr>
		</table>
	</div>
	
	<br>
	
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
	</div>

</div>

<br>
</body>
</html>