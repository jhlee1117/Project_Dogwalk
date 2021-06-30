<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>ㅁㄴㅇㄻㄴㅇㄹ</title>
	<!-- css 연결 -->
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
  <div class="container">
  <a class="navbar-brand" href="main.do"><img src="/Dogwalk/mainimg/logo.png" alt="logo"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarColor01">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="noticeList.do">Notice</a>
      </li>
<c:if test="${mb_clf_cd == null }">
      <li class="nav-item">
        <a class="nav-link" href="loginRequest.do">Walk!</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Profile</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="loginRequest.do">Dog</a>
          <a class="dropdown-item" href="loginRequest.do">Walker</a>
        </div>
      </li>
      <li class="nav-item">
      	<a class="nav-link" href="loginRequest.do">Reservation</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">To Use</a>
        <div class="dropdown-menu">
          <a class="dropdown-item" href="loginForm.do">Login</a>
          <a class="dropdown-item" href="joinChoice.do">Join</a>
        </div>
      </li>
</c:if>
<c:if test="${mb_clf_cd != null }">
	  <li class="nav-item">
		<a class="nav-link" href="mbList.do">Walk!</a>
	  </li>
	  <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Profile</a>
		<div class="dropdown-menu">
			<a class="dropdown-item" href="dogProfileList.do">Dog</a> 
			<a class="dropdown-item" href="walkerProfileList.do">Walker</a>
		</div>
	  </li>
	  <li class="nav-item">
		<a class="nav-link" href="MyBooking.do">Reservation</a>
	  </li>
	  <li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"	role="button" aria-haspopup="true" aria-expanded="false">My	page</a>
		<c:if test="${mb_clf_cd == '1' }">
			<div class="dropdown-menu">
				<a class="dropdown-item" href="Mypage.do">My Info</a>
				<a class="dropdown-item" href="MypageDog.do">My Dog</a>
				<a class="dropdown-item" href="deleteOwner.do">Leave</a>
			</div>				
		</c:if>	
		<c:if test="${mb_clf_cd == '2' }">
			<div class="dropdown-menu">
				<a class="dropdown-item" href="Mypage.do">My Info</a>
				<a	class="dropdown-item" href="deleteWalker.do">Leave</a>
			</div>					
		</c:if>
	  </li>	
	</ul>
  </div>
	<div>
	<c:if test="${mb_clf_cd == '1' }">
		${sessionScope.own_id }님 안녕하세요
	</c:if>
	<c:if test="${mb_clf_cd == '2' }">
		${sessionScope.wkr_id }님 안녕하세요
	</c:if>
	</div>
	<div>
		<button type="button" class="btn btn-primary" onclick="location.href='logout.do'">Logout</button>
	</div>
</c:if>
<!--     </ul> -->
  </div>
<!-- </div> -->
</nav>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
   integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
   integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>