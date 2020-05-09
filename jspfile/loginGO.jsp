<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id,pw;
%>
<%
	id=request.getParameter("id");
	pw=request.getParameter("pw");
	
	if(id.equals("id") && pw.equals("pw2")){
		Cookie cookie = new Cookie("id",id);
		cookie.setMaxAge(60);
		response.addCookie(cookie);
		response.sendRedirect("main_body.jsp");
	}else {response.sendRedirect("loginFail.jsp");}
	
%>
</body>
</html>