<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MAIN</title>
<link rel="stylesheet" href="http://localhost:8090/kim/header/headerstyle.css">
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69b62909907c366aa67b2e0ae75e9cd0"></script>
</head>
<body class="body">
<div class="main" style="width:90%;height:750px;padding:20px">
	<p id="button" align="right">
		<button onclick="setOverlayMapTypeId('TRAFFIC')">교통정보</button>
		<button onclick="setOverlayMapTypeId('ROADMAP')">보기</button></p>
	<div id="map" style="width:100%;height:95%" ></div>
	<script src="mapscript.js"></script>
</div>
</body>
</html>