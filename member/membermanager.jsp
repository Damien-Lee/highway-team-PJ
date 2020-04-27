<%@ 
page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>

<%@ page import="member.MemberDto" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanager" class="member.MemberManager.java"/>

<!-- 회원 관리 구분
1) 아이디(이메일) -  Id / id
2) 비밀번호 		   - Password / password 
3) 닉네임			   - Nickname / nickname
4) 생년월일        - Birthday / birthday
-->
<!-- membermanager.jsp 관련
상단 : admin_top.jsp
본문 : membermanager.jsp
하단 : admin_bottom.jsp
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 페이지</title>
<script src="#"></script>
</head>
<body>
	<h2> ** 관리자 - 전체 회원 관리 ** </h2>
	<%@ include file="admin_top.jsp" %>
	<table style="width:80%">
		<tr style="background-color: cyan">
			<th>아이디(이메일)</th><th>닉네임</th><th>생년월일</th><th>수정</th>
		</tr>
	<%
		ArrayList<MemberDto> list = membermanager.getMemberAll( );
		for(MemberDto dto : list){
	%>
			<tr>
				<td><%=dto.getId( ) %></td>
				<td><%=dto.getNickname( ) %></td>
				<td><%=dto.getBirthday( ) %></td>
				<td><a href="javascript:admin_modify_member('<%=dto.getId( ) %>')">수정하기</a></td>
			</tr>
	<%
		}
	%>
	</table>	
	
<%@ 
include file="admin_bottom.jsp" 
%>
	
	<form action="member_modify_admin_form.jsp" name="modifyFrm" method="post">
		<input type="hidden" name="id">
	</form>
</body>
</html>