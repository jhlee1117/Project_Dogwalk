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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("공지사항 수정이 완료되었습니다.");
		location.href = "managerNoticeView.do?pageNum=${pageNum }&nt_no=${notice.nt_no}";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("공지사항 수정이 되지 않았습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>