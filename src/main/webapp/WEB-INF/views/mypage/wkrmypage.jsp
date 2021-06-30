<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>도우미 정보</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">도우미 정보</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row" colspan="3">
					<img src="/Dogwalk/walkerimg/${walker.wkr_pht_nm }" alt="${walker.wkr_pht_nm}"  width="400" height="400">	
				</th>
			</tr>
			<tr align="center">
				<th scope="row">ID</th>
				<td colspan="2"><input class="form-control" type="text" name="wkr_id" value="${walker.wkr_id }" readonly="readonly">
			</tr>
			<tr align="center">
				<th scope="row">Name</th>
				<td colspan="2"><input class="form-control" type="text" name="wkr_id" value="${walker.wkr_name }" readonly="readonly">
			</tr>
			<tr align="center">
				<th scope="row">Birthday</th>
				<td id="wkr_bth_dt" colspan="2" align="left">${walker.wkr_bth_dt }</td>
			</tr>
			<tr align="center">
				<th scope="row">Gender</th>
				<c:if test="${walker.wkr_gdr eq 'M' }">
					<td align="left" colspan="2">Male</td>
				</c:if>
				<c:if test="${walker.wkr_gdr eq 'F' }">
					<td align="left" colspan="2">Female</td>
				</c:if>				
			</tr>
			<tr align="center">
				<th scope="row">Address</th>
				<td colspan="2"><input class="form-control" type="text" name="wkr_addr" value="${walker.wkr_addr }" readonly="readonly" ></td>
			</tr>
			<tr align="center">
				<th scope="row">Tel</th>
				<td colspan="2"><input class="form-control" type="tel" name="wkr_tel" value="${walker.wkr_tel }" readonly="readonly"></td>
			</tr>
			<tr align="center">
				<th scope="row">E-mail</th>
				<td colspan="2"><input class="form-control" type="email" name="wkr_email" value="${walker.wkr_email }" readonly="readonly"></td>				
			</tr>
			<tr align="center">
				<th>Rearing Experience</th>
				<td colspan="2"><textarea class="form-control" name="wkr_rs_ex" readonly="readonly">${walker.wkr_rs_ex }</textarea>
				</td>
			</tr>
			<tr align="center">
				<th>Rearing Year</th>
				<td colspan="2"><input class="form-control" type="number" name="wkr_rs_cnt" readonly="readonly" value="${walker.wkr_rs_cnt }"></td>
			</tr>
			<tr align="center">
				<th>Walker Career</th>
				<td colspan="2"><textarea class="form-control" name="wkr_career" readonly="readonly">${walker.wkr_career }</textarea>
				</td>
			</tr>			
    		<tr align="center">
    			<th colspan="3" id="tblc">License</th>
    		</tr>
    		<tr class="lc_info" align="center">
				<th scope="col">LC.NO</th>
				<th scope="col">LC.NAME</th>
				<th scope="col">ISSUER</th>
			</tr>
				<c:forEach var="lc_list" items="${licenselst }">
				<tr align="center">
				<td>${lc_list.lc_cd }</td>
				<td>${lc_list.lc_name }</td>
				<td>${lc_list.lc_iss_ogz }</td>
				</tr>
				</c:forEach>
		</table>		
	</div>
	<br>	
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick ="location.href = 'updateFormWalker.do'" >정보 수정</button>
	</div>
	<br>
</div>
</body>
</html>