<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%-- 	<c:set var="own_id" value="${sessionScope.own_id }"></c:set>
	<c:set var="wkr_id" value="${sessionScope.wkr_id }"></c:set> --%>
 	<c:if test="${sessionScope.mb_clf_cd == null }">
 		<script type="text/javascript">
 			alert("로그인이 필요합니다.");
 			location.href="main.do";
 		</script>
 	</c:if>
<%--  	<c:if test="${empty id }">
 		<script type="text/javascript">
 			alert("로그인이 필요합니다.")
 			history.go(-1)
 		</script>
 	</c:if> --%>
</body>
</html>