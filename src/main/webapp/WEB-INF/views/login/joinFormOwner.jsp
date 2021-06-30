<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>견주 회원가입</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
<!-- jquery 경로 지정 주의!!! -->
<script type="text/javascript" src="js/jquery.js"></script>
<script>
	var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
</script>
<script type="text/javascript">
	// ID 중복 체크기능
	// 헷갈릴 수 있으니 id-> own_id로 통일할 것!
	function idchk() {
			if (!frm.own_id.value) {
				alert('아이디를 입력하고 체크하세요.');
				frm.own_id.focus();
				return false;
			}
			jb.post("confirmOwner.do", "own_id=" + frm.own_id.value, function(data) {
				jb("#id_check").html(data);
			})
		}
	// jquery 적용한 비밀번호 중복확인 기능
	jb(function () {
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
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="joinOwner.do" method="post" enctype="multipart/form-data" name="frm">
	<div class="JoinWrapper">
		<div class="form-group">
    		<fieldset>
    			<h1 align="center">Owner Profile</h1>
    			<br>
    			<div class="form-group">
      				<h4><label for="id">Owner ID</label></h4>
      				<input type="text" class="form-control" id="id" name="own_id" required="required" autofocus="autofocus">
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
    			
    			<br>
    			<br>
    			<br>
    			<br>
    			<br>
    			<h1 align="center">Dog Profile</h1>
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="dog_name">Dog Name</label></h4>
      				<input type="text" class="form-control" id="dog_name" name="dog_name" required="required">
    			</div>
    			
    			<br>
    			<fieldset class="form-group">
			      	<h4>Dog Gender</h4>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_gdr" id="dog_male" value="M">Man</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_gdr" id="dog_female" value="F">Woman</label>
			      		</div>
    			</fieldset>
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="kind">Dog Kind</label></h4>
      				<input type="text" class="form-control" id="kind" name="dog_kind" required="required">
    			</div>
    			
    			<br>
    			<fieldset class="form-group">
			      	<h4>Dog Size</h4>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_size" id="dog_small" value="SMALL">SMALL</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_size" id="dog_medium" value="MEDIUM">MEDIUM</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_size" id="dog_big" value="BIG">BIG</label>
			      		</div>
    			</fieldset>
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="age">Dog Age</label></h4>
      				<input type="number" class="form-control" id="age" name="dog_age" max="50" min="0" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="length">Dog Length(Centimeter)</label></h4>
      				<input type="number" class="form-control" id="length" name="dog_len" max="250.0" min="0.0" step="0.1" required="required">
    			</div>
    			
    			<div class="form-group">
      				<h4><label for="weight">Dog Weight(Kg)</label></h4>
      				<input type="number" class="form-control" id="weight" name="dog_wgt" max="100.00" min="0.00" step="0.1" required="required">
    			</div>
    			
    			<br>
    			<fieldset class="form-group">
			      	<h4>Dog Neutralization</h4>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_ntl_chk" id="dog_ntl_y" value="Y">YES</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_ntl_chk" id="dog_ntl_n" value="N">NO</label>
			      		</div>
    			</fieldset>
    			
    			<br>
    			
    			<fieldset class="form-group">
			      	<h4>Dog Aggression</h4>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_agg" id="dog_agg_low" value="LOW">Low</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_agg" id="dog_agg_medium" value="AVERAGE">Average</label>
			      		</div>
			      		<div class="form-check">
			        		<label class="form-check-label">
			          		<input type="radio" class="form-check-input" name="dog_agg" id="dog_agg_big" value="HIGH">High</label>
			      		</div>
    			</fieldset>
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="mh">Dog Character</label></h4>
      				<textarea class="form-control" name="dog_chr" id="mh" rows="8" placeholder="Write Dog Character"></textarea>
    			</div>
    			
    			<br>
    			
    			<div class="form-group">
      				<h4><label for="mh">Medical History</label></h4>
      				<textarea class="form-control" name="dog_md_hst" id="mh" rows="8" placeholder="Write Medical History"></textarea>
    			</div>
    			
    			<br>
    			
    			<div class="form-group">
			      	<h4><label for="picture">Dog Picture</label></h4>
			      	<input type="file" class="form-control-file" name="dog_image" id="picture" required="required" aria-describedby="fileHelp">
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