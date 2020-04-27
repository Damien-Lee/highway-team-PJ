<%@ page import="member.MemberDto" %>
<%@ 
page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanager" class="member.MemberManager"/>

<%
	String id = request.getParameter("id");
	MemberDto dto =  membermanager.getData(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 Form</title>
<script src="#"></script>
<script type="text/javascript">
window.onload = function( )  {
	//닉네임 가저오기
	var nickname = document.getElementsByName("nickname")[0];
	for(var i = 0; i<nickname.length; i++)  {
		if(job[i].value ==="<%= dto.getJob( ) %>")  
		{
			nickname[i].selected = true;
		}
	}
	document.getElementById("btnModify").onclick = admin_modify_member_action;
	document.getElementById("btnModifyCancel").onclick = admin_modify_member_cancel;
	document.getElementById("btnDelete").onclick = function( )  
	{
		admin_modify_member_delete("<%= dto.getId( ) %>");
	}
}
</script>
</head>
<body>
<br/>

<table class="table">
<tr>
	<td align="center" valign="middle" style="background-color: #FFFFCC">
		<form name="modifyFormAdmin" method="post" action=member_modify_admin_action.jsp>
			<table border="1">
				<tr align="center" style="background-color: #8899aa">
					<td colspan="2"><b style="color: #FFFFFF"><%= dto.getNickname( ) %>님의 정보를 수정했습니다.(관리자)</b></td>
				</tr>
				<tr>
					<td width="16%">아이디(이메일)</td>
					<td width="57%">
						<%= dto.getId( ) %>
						<input type="hidden" name="id" value="<%= dto.getId( ) %>" />
					</td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" name="password" size="15" value="<%= dto.getPassword( ) %>"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nickname" size="15" value="<%= dto.getNickname( ) %>"></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="text" name="birthday" size="20" value="<%=dto.getBirthday( )%>"> 
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정완료" id="btnModify" />
						&nbsp;&nbsp;
						<input type="button" value="수정취소" id="btnModifyCancel" />
						<input type="button" value="회원삭제" id="btnDelete" />
					</td>
				</tr>
			</table>
		</form>
	</td>
</tr>
</table>
</body>
</html>