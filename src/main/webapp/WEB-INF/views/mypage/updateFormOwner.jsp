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
<title>견주 정보 수정</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
</script>
<script type="text/javascript">
jb(function () {
	jb("#alert-success").hide();
	jb("#alert-danger").hide();
	jb(".passchk").keyup(function(){
		var pass = jb("#pass").val();
		var confirmPass = jb("#confirmPass").val();
		if(pass != "" || confirmPass != ""){ 
			if(pass == confirmPass){ 
				jb("#alert-success").show(); 
				jb("#alert-danger").hide(); 
				jb("#submit").removeAttr("disabled"); 
			}else{ 
				jb("#alert-success").hide(); 
				jb("#alert-danger").show(); 
				jb("#submit").attr("disabled", "disabled"); 
			} 
		}
	});
});
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="updateOwner.do" name="updtfrm" method="post" onsubmit="return pwchk()">
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
			<th scope="row">Password</th>
			<td><input type="password" name="password" id="pass" class="form-control passchk" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">변경할 암호 확인</th>
			<td><input type="password" name="confirmPass" id="confirmPass" class="form-control passchk" required="required"></td>
		</tr>
		<tr align="center">
			<th scope="row"></th>
			<td>
				<div class="alert_msg" id="alert-success">변경한 암호가 일치합니다.</div>
				<div class="alert_msg" id="alert-danger">변경한 암호가 일치하지 않습니다.</div>
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Name</th>
			<td><input class="form-control" type="text" name="own_name" value="${owner.own_name }" readonly="readonly">
		</tr>
		<tr align="center">
			<th scope="row">Brithday</th>
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
			<td><input class="form-control" type="text" name="own_addr" value="${owner.own_addr }" required="required">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Tel</th>
			<td><input class="form-control" type="tel" name="own_tel" title="전화형식 3-3,4-4"
							required="required" pattern="\d{3}-\d{3,4}-\d{4}" value="${owner.own_tel }"></td>
		</tr>
		<tr align="center">
			<th scope="row">E-mail</th>
			<td><input class="form-control" type="email" name="own_email" value="${owner.own_email }" required="required">
			</td>
		</tr>
	</table>
	</div>
	<br>	
	<div align="center">
		<button type="submit" class="btn btn-primary btn-lg" id="submit">Submit</button>
		<button type="reset" class="btn btn-primary btn-lg" onclick="history.go(-1)">Cancel</button>
	</div>
</div>
<br>
</form>
</body>
</html>