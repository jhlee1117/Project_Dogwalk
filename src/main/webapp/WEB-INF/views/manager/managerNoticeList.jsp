<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 공지사항</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">Notice</h1>
		<br>
		<table class="table table-striped">
			  <thead>
			    <tr align="center">
			      <th scope="col" align="center">No</th>
			      <th scope="col" align="center">Subject</th>
			      <th scope="col" align="center">Date</th>
			      <th scope="col" align="center">R.D</th>
			    </tr>
			  </thead> 
			<c:if test="${empty list }"> <!-- 만약 DB에 데이터가 없어 list 애트리뷰트 안이 비었을 경우 -->
			<tr class="table-danger" align="center">
      			<th scope="row" colspan="4">등록된 공지사항이 없습니다.</th>
    		</tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="notice" items="${list }"> <!-- list 애트리뷰트의 정보를 notice 변수에 하나씩 받는다 -->
					<tr align="center">			
						<c:set var="total" value="${total }"></c:set>
						
						<c:if test="${notice.nt_del == 'Y' }">
							<th colspan="4" scope="row">삭제된 공지사항입니다.</th>
						</c:if>
						
						<c:if test="${notice.nt_del == 'N' }">
						<td>${total }<c:set var="total" value="${total-1 }" /></td>
									<!-- nt_sbjt를 클릭 시 nt_no와 pageNum의 정보를 noticeView.do로 보냄 -->
						<td><a href="managerNoticeView.do?nt_no=${notice.nt_no }&pageNum=${currentPage }">${notice.nt_sbjt }</a></td>
						<td>${notice.nt_reg_dt }</td>
						<td>${notice.nt_rd_cnt }</td>
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
	      <a class="page-link" href="managerNoticeList.do?pageNum=${startPage - 1 }">&laquo;</a>
	    </li>
	    </c:if>
	    <c:forEach var="i" begin="${startPage }" end="${endPage }">
	    <li class="page-item">
	      <a class="page-link" href="managerNoticeList.do?pageNum=${i }">${i }</a>
	    </li>
	    </c:forEach>
	    <c:if test="${endPage < totPage }">
	    <li class="page-item">
	      <a class="page-link" href="managerNoticeList.do?pageNum=${endPage + 1 }">&raquo;</a>
	    </li>
	    </c:if>
	  </ul>
	</div>
	
	<div align="center">
		<button class="btn btn-primary btn-lg" onclick="location.href='managerNoticeWriteForm.do?mng_id=${sessionScope.mng_id }&pageNum=${currentPage }'">Write</button>
	</div>
	
	<div align="center">
		<button class="btn btn-primary btn-lg" onclick="location.href='managerMain.do'">Main</button>
	</div>
</div>

</body>
</html>