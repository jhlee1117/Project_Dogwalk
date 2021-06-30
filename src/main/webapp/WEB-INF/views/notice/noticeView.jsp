<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include>
<br>
<br>
<br>
<br>
<br>
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
		      	<td><textarea rows="5" cols="70" style="border:none;">${notice.nt_reg_dt }</textarea></td>
    		</tr>
		</table>
	</div>

	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick="location.href='noticeList.do?pageNum=${pageNum }'">List</button>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>