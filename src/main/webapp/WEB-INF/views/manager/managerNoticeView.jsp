<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 공지사항 상세보기</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
	function chk() {
		if(confirm("정말로 삭제하시겠습니까?")) {
			location.href="managerNoticeDelete.do?nt_no=${notice.nt_no }&pageNum=${pageNum }"
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<div class="container">
		<div id="content" align="center">
			<h1 align="center">Notice</h1>
			<br>
			<table class="table table-striped">
				<tr align="center">
					<th scope="row">Subject</th>
					<td>${notice.nt_sbjt }</td>
				</tr>
				<tr align="center">
					<th scope="row">Date</th>
					<td>${notice.nt_reg_dt }</td>
				</tr>
				<tr align="center">
					<th class="align-middle" scope="row">Content</th>
					<td><textarea rows="5" cols="70" style="border: none;">${notice.nt_cont }</textarea></td>
				</tr>
			</table>
		</div>

		<div align="center">
			<button class="btn btn-primary btn-lg" onclick="location.href='managerNoticeUpdateForm.do?nt_no=${notice.nt_no }&pageNum=${pageNum }'">Update</button>
		</div>

		<div align="center">
			<button class="btn btn-primary btn-lg" onclick="return chk()">Delete</button>
		</div>

		<div align="center">
			<button class="btn btn-primary btn-lg" onclick="location.href='managerNoticeList.do?pageNum=${pageNum }'">List</button>
		</div>
	</div>
</body>
</html>