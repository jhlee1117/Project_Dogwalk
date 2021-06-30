<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>도우미 로그인</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="wkrLogin.do">
	<div class="SelectOuterWrapper" align="center">
		<div class="LoginInnerWrapper" >
			<h3 align="center">Walker Login</h3>
		    <div class="form-group">
		      <label for="id">ID</label>
		      <input type="text" class="form-control" id="id" name="wkr_id" required="required" autofocus="autofocus">
		    </div>
		    <div class="form-group">
		      <label for="password">Password</label>
		      <input type="password" class="form-control" id="password" name="wkr_pwd" required="required">
		    </div>
		    <button type="submit" class="btn btn-primary">Log in</button>
		</div>
	</div>
</form>
</body>
</html>