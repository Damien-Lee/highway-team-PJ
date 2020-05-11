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
	//id=request.getParameter("id");
  //pw=request.getParameter("pw");
  String id=request.getParameter("id");
	String pw=request.getParameter("pw");  //파라미터 id,pw받기. -login.jsp에서 받음
	
	if(id.equals("id") && pw.equals("pw")) //만약 ,id와 pw의 값이 id, pw라면
	{
		Cookie cookie = new Cookie("id",id); //쿠키생성
		cookie.setMaxAge(60*60);                    //쿠키의 시간 60분으로 저장.
		response.addCookie(cookie);					 //쿠키를 클라이언트에 저장.
		response.sendRedirect("main.jsp"); // main_body.jsp에 쿠키를 리다이렉트
	}
	else {response.sendRedirect("loginFail.jsp");} // 아닐경우 loginFail.jsp파일로 이동.
	
%>
<%//페이지에 영향을 끼치지 않는 내용입니다. -쿠키를 이용하여 로그인하는 내용.
Cookie[] cookies = request.getCookies();
if(cookies!=null){
	for(Cookie tempCookie: cookies){
		if(tempCookie.getName().equals("id")){
			//쿠키값으로 대신 로그인처리함.
			session.setAttribute("id",tempCookie.getValue());
		}
	}
}

	id =(String)session.getAttribute("id");
%>

</body>
</html>