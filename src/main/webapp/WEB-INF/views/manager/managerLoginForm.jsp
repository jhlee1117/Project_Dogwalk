<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 로그인</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<form action="managerLogin.do">
	<div class="SelectOuterWrapper" align="center">
		<div class="LoginInnerWrapper" >
			<h3 align="center">Manager Login</h3>
		    <div class="form-group">
		      <label for="id">ID</label>
		      <input type="text" class="form-control" id="id" name="mng_id" required="required" autofocus="autofocus">
		    </div>
		    <div class="form-group">
		      <label for="password">Password</label>
		      <input type="password" class="form-control" id="password" name="mng_pwd" required="required">
		    </div>
		    <button type="submit" class="btn btn-primary">Log in</button>
		</div>
	</div>
</form>
</body>
</html>