<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if(frm.id.value == "" || frm.pass.value == "") {
			alert("자료를 입력하시오");
			return;
		} else {
			frm.submit();
		}
	}
</script>
</head>
<body>
	<form action="admin_login_action.jsp" name="frm" method="post">
		<table style = "width:100%">
		<%
			String admin = (String)session.getAttribute("adminOk");
			if(admin != null)  {
		%>
			<tr>
				<td>
					<script>
						window.opener.location.href="admin_index.jsp";
					</script>
					관리자 로그인 중입니다
					<br/>
					[<a href="admin_login_out.jsp">로그아웃</a>]
					[<a href="javascript:window.close( )">창닫기</a>]
				</td>				
			</tr> 
		<%
			}  else  {
		%>
			<tr><td>아이디 : <input type="text" name="id" style="width: 80%" /></td></tr>
			<tr><td>패스워드 : <input type="text" name="password" style="width: 80%" /></td></tr>
			<tr>
				<td>
					[<a href="#" onclick="check( )">로그인</a>]
					[<a href="javascript:window.close( )">창닫기</a>]
				</td>
			</tr>
		<%
			}
		%>
		</table>
	</form>
</body>
</html>