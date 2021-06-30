<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>도우미 내 예약</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<jsp:include page="../main/mainNav.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h1 align="center">Matching List</h1>
		<br>
		<table class="table table-striped">
			<thead>
				<tr align="center">
					<th scope="col" align="center">게시글번호</th>
					<th scope="col" align="center">제목</th>
					<th scope="col" align="center">작성자</th>
					<th scope="col" align="center">등록일</th>
					<th scope="col" align="center">매칭상태</th>
				</tr>
			</thead>
			<!-- 게시글이 없는 경우. -->
			<c:if test="${empty wkrlist }">
				<tr class="table-danger" align="center">
					<th scope="row" colspan="5">예약 내역이 없습니다.</th>
				</tr>
			</c:if>

			<c:if test="${not empty wkrlist}">
				<c:forEach var="booking" items="${wkrlist }">
					<tr align="center">
						<td>${booking.mbd_no }</td>
						<td>
							<!-- 요청 상세보기 --> <a
							href="mbView.do?mbd_no=${booking.mbd_no }&pageNum=${currentPage}">${booking.mbd_sbjt }</a>
						</td>
						<td>${booking.own_id }</td>
						<td>${booking.mbd_reg_dt }</td>
						<td>
							<c:choose>
								<c:when test="${booking.bk_mc_chk == 'N' and booking.bk_chk == 'Y'}">매칭 진행 중</c:when>
								<c:when test="${booking.bk_mc_chk == 'Y' and booking.bk_chk == 'Y' }">매칭 성공</c:when>
								<c:when test="${booking.bk_mc_chk == 'N' and booking.bk_chk == 'N' }">거절</c:when>
								<%-- <c:otherwise>${booking.bk_mc_chk}, ${booking.bk_chk}</c:otherwise> --%>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 페이징 -->
		<div align="center" class="pageMiddle">
			<ul class="pagination pagination-lg" class="a">
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<li class="page-item">
	      				<a class="page-link" href="MyBooking.do?pageNum=${startPage - 1}">&laquo;</a>
	    			</li>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li class="page-item">
						<a class="page-link" href="MyBooking.do?pageNum=${i}">${i }</a>
					</li>
				</c:forEach>
				<c:if test="${startPage< totalPage}">
					<li class="page-item">
	     	 			<a class="page-link" href="MyBooking.do?pageNum=${endPage + 1 }">&raquo;</a>
	    			</li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>