<%@ 
page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트</title>
</head>
<body>
	<table style="width: 80%">
		<tr><td style="font-size: 20pt">휴게소</td></tr>
	</table>
	
<!-- admin_top page -->
<%@ 
	include file="admin_top.jsp" 
%>
	<table style="width: 80%">
			<tr style="text-align: center; width=100%;">
				<td style="font-size: 20pt;">
					관리자 로그인중입니다
					<img title="관리자" width="100%" src="../images/admin_index_picture.jpg">
				</td>
			</tr>	
	</table>

<!-- admin_bottom page -->
<%@ 
	include file="admin_bottom.jsp" 
%>
	
</body>
</html>