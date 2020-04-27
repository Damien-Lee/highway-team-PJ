<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지_메인입니다.</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.js"></script>
    <style>
         a:link { color: green; text-decoration: none;}
         a:visited { color: green; text-decoration: none;}
         a:hover { color: green; text-decoration: none;}
    </style>
</head>
<body>
<h3>관리자 페이지 메인 페이지입니다.</h3>
회원의 정보를 확인하는 페이지로 변경할 예정입니다.<p></p>
테이블의 경계선 - border-collapse 지우면 없어집니다.
<form action="#">
	<table border="1" style="border-collapse: collapse; text-align:center; margin-left:auto; margin-right:auto;" width="50%" height="100px" >
		<tr>
			<td>
				<select name="select"><!-- 검색  -->
					<option value="m_id">이메일</option>
					<option value="m_id">닉네임</option>
					<option value="m_id">생년월일</option>
				</select>
				<input type="text" name="sv"><!-- 서치 벨류 -->
				<input type="submit" value="검색버튼">
			</td>
		</tr>
	</table>
	<table border="1" style="border-collspse: collapse; margin-left:auto; margin-right:auto;"width="50%"> 
		<tr height="10px">
			<td>이메일</td>
			<td>닉네임</td>
			<td>생년월일</td>
		</tr>
		<c:forEach begin="1" end="10">
			<tr height="30px">
				<td></td>
				<td></td>
				<td></td>
			<tr/>
		</c:forEach>
	</table>
	
</form>
</body>
</html>