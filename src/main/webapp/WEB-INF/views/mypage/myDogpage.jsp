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
<title>반려견 정보</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">반려견 정보</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row" colspan="2">
				<img src="/Dogwalk/dogimg/${dog.dog_pht_nm }" alt="${dog.dog_pht_nm }"  width="400" height="400" >
				</th>
			</tr>
			<tr align="center">
				<th scope="row">Dog Name</th>
				<td><input class="form-control" type="text" name="dog_name" value="${dog.dog_name}" readonly="readonly">
			</tr>
			<tr align="center">
				<th scope="row">Dog Gender</th>
				<c:if test="${dog.dog_gdr eq 'M' }">
				<td align="left">Male</td>
				</c:if>
				<c:if test="${dog.dog_gdr eq 'F' }">
				<td align="left">Female</td>
				</c:if>
			</tr>
			<tr align="center">
				<th scope="row">Dog Kind</th>
				<td align="left">${dog.dog_kind}</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Age</th>
				<td align="left">${dog.dog_age} 년</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Length(Centimeter)</th>
				<td align="left">${dog.dog_len} cm</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Weight(Kg)</th>
				<td align="left">${dog.dog_wgt} kg</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Neutralization</th>
				<td>
					<input type="radio" id="dog_ntl_y" name="dog_ntl_chk" value="Y" readonly="readonly" <c:if test="${dog.dog_ntl_chk eq 'Y' }">checked</c:if>> 
					<label for="dog_ntl_y">YES</label>			
					<input type="radio" id="dog_ntl_n" name="dog_ntl_chk" value="N" readonly="readonly" <c:if test="${dog.dog_ntl_chk eq 'N' }">checked</c:if>> 
					<label for="dog_ntl_n">NO</label>
				</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Aggression</th>
				<td>
					<input type="radio" id="dog_agg_low" name="dog_agg" value="LOW" readonly="readonly" <c:if test="${dog.dog_agg eq 'LOW' }">checked</c:if>>
					<label for="dog_agg_low">Low</label>		
					<input type="radio" id="dog_agg_average" name="dog_agg" value="AVERAGE" readonly="readonly" <c:if test="${dog.dog_agg eq 'AVERAGE' }">checked</c:if>>
					<label for="dog_agg_average">Average</label>			
					<input type="radio" id="dog_agg_high" name="dog_agg" value="HIGH" readonly="readonly" <c:if test="${dog.dog_agg eq 'HIGH' }">checked</c:if>>
					<label for="dog_agg_high">High</label>				
				</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Character</th>
				<td><textarea class="form-control" name="dog_chr" readonly="readonly">${dog.dog_chr }</textarea></td>
			</tr>
			<tr align="center">
				<th scope="row">Medical History</th>
				<td><textarea class="form-control" name="dog_md_hst" readonly="readonly">${dog.dog_md_hst }</textarea></td>
			</tr>
		</table>
	</div>
	<br>
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick ="location.href = 'updateFormDog.do'" >정보 수정</button>
	</div>
	<br>
</div>
</body>
</html>