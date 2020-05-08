<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>공지사항,Q&A게시판</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<div class="container">
		<div class="row">
		<form method="post" action="write.do">
			<table class="table" style="text-align: center; border: 1px" ;width:800px">
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align:center;">Q&A 게시판</th>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="qWriter" maxlength="50" style="width:900px;height:20px;" ></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="qTitle" maxlength="50" style="width:900px;height:20px;" ></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2"><textarea name="qContent" maxlength="2048" style="width:900px;height:350px;"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="right"><input type="submit" class="btn" value="등록">&nbsp;
						<input type="submit" class="btn" value="수정">&nbsp;
						<input type="submit" class="btn" value="삭제">&nbsp;
						<a href="list.do">목록으로</a>
						</td>
					</tr>
			</table>
			</form>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>