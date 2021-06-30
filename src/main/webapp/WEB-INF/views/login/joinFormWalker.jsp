<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>도우미 회원가입</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
<!-- jquery 경로 지정 주의!!! -->
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
</script>
<script type="text/javascript">
	
	// 자격증 중복체크
	function lcchk() {		
		jb.post("confirmLicense.do", "lc_cd=" + frm.lc_cd.value, function(data) {
			jb("#lc_check").html(data);
		})
	}
	// ID 중복 체크기능
	function idchk() {
		if (!frm.wkr_id.value) {
			alert('아이디를 입력하고 체크하세요.');
			frm.wkr_id.focus();
			return false;
		}
		jb.post("confirmWalker.do", "wkr_id=" + frm.wkr_id.value, function(data) {
			jb("#id_check").html(data);
		})
	}

	// jquery 적용한 비밀번호 중복확인 기능
	jb(function() {
		jb("#alert-success").hide();
		jb("#alert-danger").hide();
		jb(".passchk").keyup(function() {
			var pass = jb("#pass").val();
			var confirmPass = jb("#confirmPass").val();
			if (pass != "" || confirmPass != "") {
				if (pass == confirmPass) {
					jb("#alert-success").show();
					jb("#alert-danger").hide();
					jb("#submit").removeAttr("disabled");
				} else {
					jb("#alert-success").hide();
					jb("#alert-danger").show();
					jb("#submit").attr("disabled", "disabled");
				}
			}
		});
	});

	// jquery 적용한 버튼 추가 기능
	jb(function() {
		jb('#btnAdd').click(function() { // 각 입력자 추가
			jb('#lc_add').append('<tr class="lc_row"><td><input type="text" class="form-control" name="lc_cd" required="required" maxlength="9" onkeyup="lcchk()"></td><td><input type="text" class="form-control" name="lc_name" required="required"></td><td><input type="text" class="form-control" name="lc_iss_ogz" required="required"></td></tr>');
			jb('#btnDel').on('click', function() { // 각 입력자 삭제
				jb('.lc_row').last().remove();
			});
		});
	});
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="joinWalker.do" method="post" enctype="multipart/form-data" name="frm">
	<div class="JoinWrapper">
		<div class="form-group">
			<fieldset>
				<h1 align="center">Walker Profile</h1>
				<br>
				<div class="form-group">
      				<h4><label for="id">Walker ID</label></h4>
      				<input type="text" class="form-control" id="id" name="wkr_id" required="required" autofocus="autofocus">
      				<button type="button" class="btn btn-outline-primary" onclick="idchk()">Check</button>
      				<div id="id_check"></div>
    			</div>
    			
    			<div class="form-group">
				    <h4><label for="pass">Password</label></h4>
				    <input type="password" class="form-control passchk" id="pass" name="password" required="required">
    			</div>
  
    			<div class="form-group">
				    <h4><label for="confirmPass">Password(Confirm)</label></h4>
				    <input type="password" class="form-control passchk" id="confirmPass" name="confirmPass" required="required">
				    <div class="alert_msg" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert_msg" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="name">Name</label></h4>
      				<input type="text" class="form-control" id="name" name="name" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="birth">Birth Date</label></h4>
      				<input type="date" class="form-control" id="birth" name="birth_date" required="required">
    			</div>
    			
    			<br>
    			<fieldset class="form-group">
			      	<h4>Gender</h4>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="gender" id="male" value="M">Man</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="gender" id="female" value="F">Woman</label>
			      		</div>
    			</fieldset>
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="addr">Address</label></h4>
      				<input type="text" class="form-control" id="addr" name="address" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="email">E-mail</label></h4>
      				<input type="text" class="form-control" id="email" name="email" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="tel">Tel</label></h4>
      				<input type="tel" class="form-control" id="tel" name="tel" required="required" 
      				title="전화형식 3-3,4-4" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-1111-1111">
    			</div>
    			
    			<div class="form-group">
    				<h4>License</h4>
    				<table class="table table-hover">
						<thead>
					    	<tr class="lc_info" align="center">
					      		<th scope="col">LC.NO</th>
					      		<th scope="col">LC.NAME</th>
					      		<th scope="col">ISSUER</th>
					      		<th scope="col">ADD/DELETE</th>
					    	</tr>
  						</thead>
  						<tbody id="lc_add">
  							<tr align="center">
							    <td>
							    	<input type="text" class="form-control" name="lc_cd" maxlength="9" required="required" onkeyup="lcchk()"> <!--  lcalert()" -->
							    </td>
							    <td>
							    	<input type="text" class="form-control" name="lc_name" required="required">
							    </td>
							    <td>
							    	<input type="text" class="form-control" name="lc_iss_ogz" required="required">
							    </td>
							    <td>
									<div class="btn-group mr-2" role="group" aria-label="Second group">
										<button type="button" class="btn btn-outline-primary" id="btnAdd" value="추가">+</button>
										<button type="button" class="btn btn-outline-primary"id="btnDel" value="삭제">-</button>
									</div>
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
    			
    			<div class="form-group">
      				<h4><label for="rp">Rearing Period(Year)</label></h4>
      				<input type="number" class="form-control" id="rp" name="wkr_rs_cnt" max="100" min="0" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="re">Rearing Experience</label></h4>
      				<textarea class="form-control" name="wkr_rs_ex" id="re" rows="8" placeholder="Rearing Experience"></textarea>
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="career">Walker Career</label></h4>
      				<textarea class="form-control" name="wkr_career" id="career" rows="8" placeholder="Career"></textarea>
    			</div>
    			
    			<div class="form-group">
			      	<h4><label for="picture">Walker Picture</label></h4>
			      	<input type="file" class="form-control-file" name="walker_image" id="picture" required="required" aria-describedby="fileHelp">
					 <small id="fileHelp" class="form-text text-muted">This is some placeholder block-level help text for the above input.</small>
   				</div>
   				
   				<br>
   				<br>
   				
   				<div align="center">
   					<button type="submit" class="btn btn-primary btn-lg">Submit</button>
   				</div>
    			
			</fieldset>
		</div>
	</div>
</form>
</body>
</html>