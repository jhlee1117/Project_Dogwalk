<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 매칭게시판 상세보기</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
		function goBack() {
			history.back();	
		}
	</script>
</head>
<body>
	<div class="container">
		<div id="content" align="center">
			<h1 align="center">Walk!</h1>
			<br>
			<table class="table table-striped">
				<tr align="center">
					<th scope="row">Writer</th>
					<td>${mboard.own_id }</td>
				</tr>
				<tr align="center">
					<th scope="row">Subject</th>
					<td>${mboard.mbd_sbjt }</td>
				</tr>
				<tr align="center">
					<th scope="row">Registration Date</th>
					<td>${mboard.mbd_reg_dt }</td>
				</tr>
				<tr align="center">
					<th scope="row">Start Date</th>
					<td>${mboard.mbd_str_dt }</td>
				</tr>
				<tr align="center">
					<th scope="row">End Date</th>
					<td>${mboard.mbd_fn_dt }</td>
				</tr>
				<tr align="center">
					<th class="align-middle" scope="row">Content</th>
					<td><textarea rows="5" cols="70" style="border: none;"
							readonly="readonly">${mboard.mbd_cont }</textarea></td>
				</tr>
			</table>

			<div class="container">
				<div id="content" align="center">
					<button type="button" class="btn btn-primary btn-lg"
						onclick="goBack();">Back</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>