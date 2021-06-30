<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 매칭게시판</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">Walk!</h1>
		<br>
		<table class="table table-striped">
			<thead>
			    <tr align="center">
			      <th scope="col" align="center">No</th>
			      <th scope="col" align="center">Writer</th>
			      <th scope="col" align="center">Subject</th>
			      <th scope="col" align="center">Date</th>
			      <th scope="col" align="center">R.D</th>
			    </tr>
			  </thead>
			<c:if test="${empty list }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
				<tr class="table-danger" align="center">
	      			<th scope="row" colspan="5">등록된 게시글이 없습니다.</th>
	    		</tr>
    		</c:if>
    		<c:if test="${not empty list }">
				<c:forEach var="mboard" items="${list }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->
					<tr align="center">			
						<c:set var="total" value="${total }"></c:set>
						
						<c:if test="${mboard.mbd_del == 'Y' }">
							<th colspan="5" scope="row">삭제된 게시글입니다.</th>
						</c:if>
						
						<c:if test="${mboard.mbd_del == 'N' }">
						<td>${total }<c:set var="total" value="${total-1 }" /></td>
						<td>${mboard.own_id }</td>
						<td><a href="managerMboardView.do?mbd_no=${mboard.mbd_no }&pageNum=${currentPage}">${mboard.mbd_sbjt }</a></td>
						<td>${mboard.mbd_reg_dt }</td>
						<td>${mboard.mbd_rd_cnt }</td>
						</c:if>
					</tr>
				</c:forEach>		
			</c:if>
		</table>
	</div>	
	<div align="center" class="pageMiddle">
	  <ul class="pagination pagination-lg" class="a">
	    <c:if test="${startPage > pagePerBlock }">
	    <li class="page-item">
	      <a class="page-link" href="managerMboardList.do?pageNum=${startPage - 1}">&laquo;</a>
	    </li>
	    </c:if>
	    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <li class="page-item">
	      <a class="page-link" href="managerMboardList.do?pageNum=${i}">${i }</a>
	    </li>
	    </c:forEach>
	    <c:if test="${endPage < totPage }">
	    <li class="page-item">
	      <a class="page-link" href="managerMboardList.do?pageNum=${endPage + 1 }">&raquo;</a>
	    </li>
	    </c:if>
	  </ul>
	</div>

	<div align="center">
		<button class="btn btn-primary btn-lg" onclick="location.href='managerMain.do'">Main</button>
	</div>

	<br>
</div>
</body>
</html>