<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>매칭게시판 견주</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script>
		var jb = jQuery.noConflict(); // bootstrap의 jquery 와 버전 충돌로 해당 버전에서 사용할 jquery 선택자 변수 지정
	</script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	jb(function() {
		//시작일
		jb('#mbd_str_dt').datepicker({
			// showOn : "both", // 달력을 표시할 타이밍 (both: focus or button)
			dateFormat : "yy-mm-dd", // 날짜의 형식
			changeMonth : true, // 월을 이동하기 위한 선택상자 표시여부
			minDate: 0,  // 선택할수있는 최소날짜, (0: 오늘 이전 날짜 선택 불가)
			onClose : function(selectedDate) { // 시작일(fromDate) datepicker가 닫힐때
				// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				jb("#mbd_fn_dt").datepicker("option", "minDate", selectedDate);
			}
		});
		//종료일
		jb('#mbd_fn_dt').datepicker({
			// showOn : "both",
			dateFormat : "yy-mm-dd",
			changeMonth : true,
			onClose : function(selectedDate) {
				// 종료일(toDate) datepicker가 닫힐때
				// 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
				jb("mbd_str_dt").datepicker("option", "maxDate", selectedDate);
			}
		});
	});
	function goBack() {
		history.back();	
	}
</script>
</head>
<body>
<jsp:include page="../main/mainNav.jsp"></jsp:include><br><br><br><br><br>
<form action="mbWrite.do" method="post" name="frm">
<input type="hidden" name="own_id" value="${own_id}">
<input type="hidden" name="own_reg_no" value="${own_reg_no}"> <!-- 추가 -->
<div class="JoinWrapper">
		<div class="form-group">
			<fieldset>
			<h1 align="center">Write</h1>
			<br>
    		<div class="form-group">
				<h4><label for="subject">Subject</label></h4>
      			<input type="text" class="form-control" id="subject" name="mbd_sbjt" required="required" autofocus="autofocus">
    		</div>
    		
    		<div class="form-group">
    				<div id="datepicker">
      				<h4><label for="mbd_str_dt">Start Date</label></h4>
      				<input type="text" class="form-control" id="mbd_str_dt" name="mbd_str_dt" required="required" value="${mboard.mbd_str_dt }">
      				</div>
    		</div>
    		
    		<div class="form-group">
    				<div id="datepicker">
      				<h4><label for="mbd_fn_dt">End Date</label></h4>
      				<input type="text" class="form-control" id="mbd_fn_dt" name="mbd_fn_dt" required="required" value="${mboard.mbd_fn_dt }">
      				</div>
    		</div>
    		
    		<div class="form-group">
      				<h4><label for="cont">Content</label></h4>
      				<textarea class="form-control" name="mbd_cont" id="cont" rows="8" required="required">${mboard.mbd_cont }</textarea>
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