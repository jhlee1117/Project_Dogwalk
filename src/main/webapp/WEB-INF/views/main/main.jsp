<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>반려견 산책 프로젝트 DogWalk</title>
</head>
<body>
<jsp:include page="mainNav.jsp"></jsp:include>
<jsp:include page="mainCont.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>