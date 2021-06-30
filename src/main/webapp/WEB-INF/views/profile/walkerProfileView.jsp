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
	<title>도우미 프로필 상세보기</title>
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
	<div id="content align="center>
		<h1 align="center">${walker.wkr_id } Profile</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row">ID</th>
				<td>${walker.wkr_id }</td>
			</tr>
			<tr align="center">
				<th scope="row">Name</th>
				<td>${walker.wkr_name }</td>
			</tr>
			<tr align="center">
				<th scope="row">Gender</th>
				<td>${walker.wkr_gdr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Birthday</th>
				<td>${walker.wkr_bth_dt }</td>
			</tr>
			<tr align="center">
				<th scope="row">Address</th>
				<td>${walker.wkr_addr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Email</th>
				<td>${walker.wkr_email }</td>
			</tr>
			<tr align="center">
				<th scope="row">Phone</th>
				<td>${walker.wkr_tel }</td>
			</tr>
			<tr align="center">
				<th scope="row">Phone</th>
				<td>${walker.wkr_tel }</td>
			</tr>
			<tr align="center">
				<th scope="row">Rearing Period(Year)</th>
				<td>${walker.wkr_rs_cnt }</td>
			</tr>
			<tr align="center">
      			<th scope="row" class="align-middle">Rearing Experience</th>
		      	<td><textarea rows="10" cols="70" style="border:none;" readonly="readonly">${walker.wkr_rs_ex }</textarea></td>
    		</tr>
    		<tr align="center">
      			<th scope="row" class="align-middle">Walker Career</th>
		      	<td><textarea rows="10" cols="70" style="border:none;" readonly="readonly">${walker.wkr_career }</textarea></td>
    		</tr>
			<tr align="center">
				<th scope="row">Registration</th>
				<td>${walker.wkr_reg_dt }</td>
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