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
<title>도우미 정보 수정</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
</script>
<script type="text/javascript">
	// 자격증 중복체크
	function lcchk() {		
		jb.post("confirmLicense.do", "lc_cd=" + updtfrm.lc_cd.value, function(data) {
			$("#lc_check").html(data);
		})
	}
	
	jb(function () { // 비밀번호 중복 체크
		jb("#alert-success").hide();
		jb("#alert-danger").hide();
		jb(".passchk").keyup(function(){
			var pass = jb("#pass").val();
			var confirmPass = jb("#confirmPass").val();
			if(pass != "" || confirmPass != ""){ 
				if(pass == confirmPass){ 
					jb("#alert-success").show(); 
					jb("#alert-danger").hide(); 
					jb("#submit").removeAttr("disabled"); 
				}else{ 
					jb("#alert-success").hide(); 
					jb("#alert-danger").show(); 
					jb("#submit").attr("disabled", "disabled"); 
				} 
			}
		});
	});
	jb(function() { // 자격증 입력 태그 추가
		jb('#btnAdd').click(function() { // 각 입력자 추가
			jb('#lc_add').append('<tr class="lc_row"><td><input class="form-control" maxlength="9" type="text" name="lc_cd"></td><td><input class="form-control" type="text" name="lc_name"></td><td><input class="form-control" type="text" name="lc_iss_ogz"></td></tr>');
			jb('#btnDel').on('click', function() { // 각 입력자 삭제
				jb('.lc_row').last().remove();
			});
		});
	});
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="updateWalker.do" name="updtfrm" method="post" onsubmit="return pwchk()">
<div class="container">
	<div id="content" align="center">
	<h1 align="center">회원정보</h1>
	<br>
	<table class="table table-striped">
		<tr align="center">
			<th scope="row" colspan="4">
				<img src="/Dogwalk/walkerimg/${walker.wkr_pht_nm }" alt="${walker.wkr_pht_nm}"  width="400" height="400">	
			</th>
		</tr>
		<tr align="center">
			<th scope="row">ID</th>
			<td colspan="3"><input class="form-control" type="text" name="wkr_id" value="${walker.wkr_id }" readonly="readonly">
		</tr>
		<tr align="center">
			<th scope="row">Password</th>
			<td colspan="3"><input type="password" name="password" id="pass" class="form-control passchk" required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">변경할 암호 확인</th>
			<td colspan="3"><input type="password" name="confirmPass" id="confirmPass" class="form-control passchk" required="required">
			</td>			
		</tr>
		<tr align="center">
			<th scope="row"></th>
			<td colspan="3">
				<div class="alert_msg" id="alert-success">변경한 암호가 일치합니다.</div>
				<div class="alert_msg" id="alert-danger">변경한 암호가 일치하지 않습니다.</div>
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Name</th>
			<td colspan="3"><input class="form-control" type="text" name="wkr_name" value="${walker.wkr_name }" readonly="readonly">
		</tr>
		<tr align="center">
			<th scope="row">Brithday</th>
			<td id="wkr_bth_dt" align="left" colspan="3" >${walker.wkr_bth_dt }</td>
		</tr>
		<tr align="center">
			<th scope="row">Gender</th>
			<c:if test="${walker.wkr_gdr eq 'M' }">
			<td align="left">Male</td>
			</c:if>
			<c:if test="${walker.wkr_gdr eq 'F' }">
			<td align="left">Female</td>
			</c:if>
		</tr>
		<tr align="center">
			<th scope="row">Address</th>
			<td colspan="3"><input class="form-control" type="text" name="wkr_addr" value="${walker.wkr_addr }" required="required">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Tel</th>
			<td colspan="3"><input class="form-control" type="tel" name="wkr_tel" title="전화형식 3-3,4-4" pattern="\d{3}-\d{3,4}-\d{4}" value="${walker.wkr_tel }" required="required">
			</td>
		</tr>
		<tr align="center">
			<th scope="row">E-mail</th>
			<td colspan="3"><input class="form-control" type="email" name="wkr_email" value="${walker.wkr_email }" required="required">
			</td>			
		</tr>
		<tr align="center">
			<th scope="row">Rearing Experience</th>
			<td colspan="3"><textarea class="form-control" name="wkr_rs_ex">${walker.wkr_rs_ex }</textarea>
			</td>
		</tr>
		<tr align="center">
			<th scope="row">Rearing Year</th>
			<td colspan="3"><input class="form-control" type="number" name="wkr_rs_cnt" required="required" value="${walker.wkr_rs_cnt }"></td>
		</tr>
		<tr align="center">
			<th>Walker Career</th>
			<td colspan="3"><textarea class="form-control" name="wkr_career">${walker.wkr_career }</textarea></td>
		</tr>
		<tr align="center">
    		<th colspan="4" id="tblc">License</th>
    	</tr>
    	<tr align="center" class="lc_info">
			<th scope="col">자격증번호</th>
			<th scope="col">자격증명</th>
			<th scope="col">발급기관</th>
			<th scope="col">추가/삭제</th>
    	</tr>
    	<c:forEach var="lc_list" items="${licenselst }">
		<tr align="center">
			<td>${lc_list.lc_cd }</td>
			<td>${lc_list.lc_name }</td>
			<td>${lc_list.lc_iss_ogz }</td>
			<td></td>
		</tr>
		</c:forEach>
		<tbody id="lc_add">
		<tr>					
			<td><input class="form-control" type="text" name="lc_cd" maxlength="9" onkeyup="lcchk()"></td>
			<td><input class="form-control" type="text" name="lc_name"></td>
			<td><input class="form-control" type="text" name="lc_iss_ogz"></td>
			<td colspan="4">
				<button type="button" class="btn btn-primary btn-lg" id="btnAdd" onclick="btnAdd();">추가</button>
				<button type="button" class="btn btn-primary btn-lg" id="btnDel" onclick="btnDel();">삭제</button>
			</td>					
		</tr>
		</tbody>
		<tr>
			<th colspan="4">
				<div id="lc_check"></div>
			</th>
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