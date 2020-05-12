<%@ page contentType="text/html; charset=utf-8" %>
<%@ page errorPage="errorView.jsp" %>
<%@ page import="restarea.review.model" %>
<%@ page import="restarea.service.WriteReviewService" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="review" class="restarea.review.model">
	<jsp:setProperty name="review" property="*" />
</jsp:useBean>
<%
	WriteReviewService writeService = WriteReviewService.getInstance();
	writeService.write(message);
%>
<html>
<head>
	<title>방명록 메시지 남김</title>
</head>
<body>
방명록에 메시지를 남겼습니다.
<br/>
<a href="info_review.jsp">[목록 보기]</a>
</body>
</html>