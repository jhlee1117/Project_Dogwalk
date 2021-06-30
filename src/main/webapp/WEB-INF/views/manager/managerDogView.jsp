<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>관리자 강아지 프로필 상세보기</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<script type="text/javascript">
		function goBack() {
			history.back();	
		}
	</script>
</head>
<body>
<div class="container">
	<div id="content" align="center">
		<h1 align="center">${dog.dog_name } Profile</h1>
		<br>
		<table class="table table-striped">
			<tr align="center">
				<th scope="row">Name</th>
				<td>${dog.dog_name }</td>
			</tr>
			<tr align="center">
				<th scope="row">Gender</th>
				<td>${dog.dog_gdr }</td>
			</tr>
			<tr align="center">
				<th scope="row">Size</th>
				<td>${dog.dog_size }</td>
			</tr>
			<tr align="center">
				<th scope="row">Age</th>
				<td>${dog.dog_age }</td>
			</tr>
			<tr align="center">
				<th scope="row">Length</th>
				<td>${dog.dog_len }</td>
			</tr>
			<tr align="center">
				<th scope="row">Weight</th>
				<td>${dog.dog_wgt }</td>
			</tr>
			<tr align="center">
				<th scope="row">Neutralization</th>
				<td>${dog.dog_ntl_chk }</td>
			</tr>
			<tr align="center">
				<th scope="row">Aggression</th>
				<td>${dog.dog_agg }</td>
			</tr>
			<tr align="center">
      			<th scope="row" class="align-middle">Character</th>
		      	<td><textarea rows="10" cols="70" style="border:none;" readonly="readonly">${dog.dog_chr }</textarea></td>
    		</tr>
    		<tr align="center">
      			<th scope="row" class="align-middle">Medical History</th>
		      	<td><textarea rows="10" cols="70" style="border:none;" readonly="readonly">${dog.dog_md_hst }</textarea></td>
    		</tr>
    		<tr align="center">
				<th scope="row">Owner</th>
				<td><a href="managerOwnerView.do?own_id=${dog.own_id }">${dog.own_id }</a></td>
			</tr>
		</table>
	</div>
	
	<br>
	
	<div align="center">
		<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
	</div>

</div>

<br>
</body>
</html>