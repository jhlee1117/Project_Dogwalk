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
	<c:if test="${result > 0}">
		<script type="text/javascript">
			alert("신청 성공");
			location.href = "mbWalkerView.do?mbd_no=${mbd_no }&wkr_reg_no=${sessionScope.wkr_reg_no }&wkr_id=${sessionScope.wkr_id }";
		</script>
	</c:if>
	<c:if test="${result == 0}">
		<script type="text/javascript">
			alert('신청 실패');
			history.go(-1);
		</script>
	</c:if>
</body>
</html>