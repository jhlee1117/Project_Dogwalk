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
<title>반려견 정보 수정</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
</script>
<script type="text/javascript">
	jb(function() { // 반려견이 중성화한 상태인 경우 'N' 라디오버튼 비활성화
		var dog_ntl_chk = "${dog.dog_ntl_chk}";
		if (dog_ntl_chk = "Y") {
			jb("#dog_ntl_n").attr('disabled',true);
		}
	})
</script>

</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="updateDog.do" method="post" name="updtfrm" method="post">
	<div class="container">
		<div id="content" align="center">
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
				<td><input class="form-control" type="number" name="dog_age" required="required"
					max="50" min="${dog.dog_age }"></td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Length(Centimeter)</th>
				<td><input class="form-control" type="number" name="dog_len" required="required"
					max="250.0" min="${dog.dog_len }" step="0.1"></td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Weight(Kg)</th>
				<td><input class="form-control" type="number" name="dog_wgt" required="required"
					max="100.00" min="0.0" step="0.1"></td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Neutralization</th>
				<td>				
					<input type="radio" id="dog_ntl_y" name="dog_ntl_chk" value="Y" required="required"> 
					<label for="dog_ntl_y" >YES</label>		
					<input type="radio" id="dog_ntl_n" name="dog_ntl_chk" value="N" required="required"> 
					<label for="dog_ntl_n" >NO</label>
				</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Aggression</th>
				<td>						
					<input type="radio" id="dog_agg_low" name="dog_agg" value="LOW" required="required"> 
					<label for="dog_agg_low" >Low</label>
					<input type="radio" id="dog_agg_average" name="dog_agg" value="AVERAGE" required="required">
					<label for="dog_agg_average" >Average</label>					
					<input type="radio" id="dog_agg_high" name="dog_agg" value="HIGH" required="required">
					<label for="dog_agg_high" >High</label>
				</td>
			</tr>
			<tr align="center">
				<th scope="row">Dog Character</th>
				<td><textarea class="form-control" name="dog_chr">${dog.dog_chr }</textarea></td>		
			</tr>
			<tr align="center">
				<th scope="row">Medical History</th>
				<td><textarea class="form-control" name="dog_md_hst">${dog.dog_md_hst }</textarea></td>
			</tr>						
		</table>		
		</div>
		<br>
		<div align="center">
			<button type="submit" class="btn btn-primary btn-lg" id="submit">Submit</button>
			<button type="reset" class="btn btn-primary btn-lg" onclick="history.go(-1)">Cancel</button>
		</div>
		<br>
	</div>
</form>
</body>
</html>