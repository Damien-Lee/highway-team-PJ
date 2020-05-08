<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String date = request.getParameter("date");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
	

		/*if(title==null || content==null || title.trim().equals("")||content.trim().equals("")){
			out.println("공지 내용과 제목을 입력하세요!!!");
			out.println("<a href=notice_write.jsp>돌아가기</a>");
			return;
		}*/

	%>
	<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table" style="text-align: center; border: 1px solic #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;width:1000px">공지사항 게시판 글쓰기</th>
					</tr>
				</thead>
				<tbody>
				
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" style="width:1000px;height: 20px;" ></td>

					<tr>
						<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="width:1000px;height: 350px;"></textarea></td>
					</tr>
				</tbody>
			</table>
				<input type="submit" class="btn" value="글쓰기">
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>