<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String admin_id = (String)session.getAttribute("adminOk");
	
	if(admin_id == null) {
%>
	<script>
		alert("관리자 계정이 로그아웃 되었습니다.");
/* 		location.href = "Main.jsp"; 	=> Main 페이지로 이동 */
	</script>
<%
		return;
	}
%>
<table style="width: 80%">
	<tr style="background-color: #ccbbcc; text-align: center;" >
		<td><a href="../main.jsp">메인페이지</a></td>
		<td><a href=".jsp">로그아웃</a></td>
		<td><a href=".jsp">회원관리</a></td>
		<td><a href=".jsp">게시판관리</a></td>
		<td><a href=".jsp">휴게소 판매데이터</a></td>
	</tr>
</table>