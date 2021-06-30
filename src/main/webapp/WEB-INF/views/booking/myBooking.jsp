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
	<c:if test="${result == 1 }">
	<script type="text/javascript">
		location.href="ownerBookingList.do?own_id=${own_id }&own_reg_no=${own_reg_no }&pageNum=${pageNum}";
	</script>
</c:if>
<c:if test="${result == 2 }">
	<script type="text/javascript">
		location.href="walkerBookingList.do?wkr_id=${wkr_id }&wkr_reg_no=${wkr_reg_no }&pageNum=${pageNum}";	
	</script>
</c:if>
<c:if test="${result != 1 && result != 2 }">
	<script type="text/javascript">
		alert("로그인이 필요합니다.")
		location.href="loginForm.do";	
	</script>
</c:if>
</body>
</html>