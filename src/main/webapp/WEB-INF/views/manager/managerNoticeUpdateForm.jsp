<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 공지사항 수정</title>
<!-- css 연결 -->
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
	function goBack() {
		history.back();
	}
</script>
</head>
<body>
<form action="managerNoticeUpdate.do" method="post" name="frm" onsubmit="return chk()">
<input type="hidden" name="nt_no" value="${notice.nt_no }">
<input type="hidden" name="pageNum" value="${pageNum }">
<div class="JoinWrapper">
		<div class="form-group">
			<fieldset>
			<h1 align="center">Notice</h1>
			<br>
    		<div class="form-group">
				<h4><label for="subject">Subject</label></h4>
      			<input type="text" class="form-control" id="subject" name="nt_sbjt" required="required" autofocus="autofocus" value="${notice.nt_sbjt }">
    		</div>
    		
    		<div class="form-group">
				<h4><label for="subject">Date</label></h4>
      			<input type="text" class="form-control" id="subject" name="nt_reg_dt" value="${notice.nt_reg_dt }" readonly="readonly">
    		</div>
    		
    		<div class="form-group">
      				<h4><label for="cont">Content</label></h4>
      				<textarea class="form-control" name="nt_cont" id="cont" rows="8" required="required">${notice.nt_cont }</textarea>
    		</div>
    		
			<div align="center">
				<button type="submit" class="btn btn-primary btn-lg">Write</button>
				<button type="button" class="btn btn-primary btn-lg" onclick="goBack();">Back</button>
			</div>
			</fieldset>
		</div>
	</div>
</form>
</body>
</html>