<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header22</title>
<link rel="stylesheet" href="headerstyle.css">
</head>
<body class="body">
<header class="header">
	<form name="form1">
	<span><h1 class="logo">휴~식</h1></span>
  <div id="choice" align="center">
    <select name="site" id="site" style="width:50%;height:30px;">
    	<option selected>휴게소를 선택하세요</option>
      <option value="13">13개</option>
    </select>
		<button onclick="sitemove()" style="height:30px;">찾기</button>
	</div>
	</form>
	<div class="container">
		<nav class="nav">
			<ul class="list">
				<li class="list-item"><a href="https://www.naver.com/">공지/문의 사항 </a></li>
				<li class="list-item"><a href="#">도로 교통 상황</a></li>
				<li class="list-item"><a href="#">추천휴게소</a></li>
				<li class="list-item"><a href="#">마이페이지</a></li>
				<li class="list-item"><a href="#">로그아웃</a></li>
			</ul>
		</nav>
	</div>
</header>
</body>
</html>