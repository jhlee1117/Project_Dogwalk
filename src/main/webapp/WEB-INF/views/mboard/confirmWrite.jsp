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
		location.href="mbWriteForm.do"; /* 글 작성자 정보에 대한 코드가 없음? */
	</script>
</c:if>
<c:if test="${result == 2 }">
	<script type="text/javascript">
		alert("글쓰기 권한이 없습니다");
		history.back();
	</script>
</c:if>

</body>
</html>