<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result_walker > 0 && result_license > 0}">
	<script type="text/javascript">
		alert("회원가입 성공");
		location.href="loginForm.do";
	</script>
</c:if>
<c:if test="${result_walker == 0 && result_license == 0}">
	<script type="text/javascript">
		alert("회원가입 실패");
		history.go(-1);
	</script>
</c:if>
<c:if test="${result_walker == -1 && result_license == -1}">
	<script type="text/javascript">
		alert("이미 존재하는 아이디이므로, 가입에 실패하였습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>