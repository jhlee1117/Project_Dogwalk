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
		location.href="mbOwnerView.do?mbd_no=${mbd_no }";
	</script>
</c:if>
<c:if test="${result == 2 }">
	<script type="text/javascript">
		location.href="mbWalkerView.do?mbd_no=${mbd_no }&wkr_reg_no=${sessionScope.wkr_reg_no }&wkr_id=${sessionScope.wkr_id }";
	</script>
</c:if>
</body>
</html>