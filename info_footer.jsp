<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="info.model.Message"%>
<%@ page import="info.service.MessageListView"%>
<%@ page import="info.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>서울 만남의 광장 휴게소</title>
<style>
body {font-family: 'Do Hyeon', sans-serif;
font-family: 'Nanum Gothic', sans-serif;}
#review{height:200px;padding-left:200px;font-size:22px}
#comment{width:60%;height:30px}
#submit{/*float:right;*/}
.fas fa-bed {font: FontAwesome !important;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<footer>
 <%
String pageNumberStr = request.getParameter("page");
int pageNumber = 1;
if (pageNumberStr != null) {
	pageNumber = Integer.parseInt(pageNumberStr);
}

	GetMessageListService messageListService = 
			GetMessageListService.getInstance();
	MessageListView viewData = 
			messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%= viewData %>"/>
    <form name="review" id="review" method="post" action="writeMessage.jsp">
        <div class="review">
            휴게소 만족도
            <input type="radio" name="rating" id="1"> <i class="far fa-angry"> 1</i>
            <input type="radio" name="rating" id="2"> <i class="far fa-frown"> 2</i>
            <input type="radio" name="rating" id="3"> <i class="far fa-meh"> 3</i>
            <input type="radio" name="rating" id="4"> <i class="far fa-smile"> 4</i>
            <input type="radio" name="rating" id="5"> <i class="far fa-laugh"> 5</i>
        </div><br/>
       	 <label for="nickname">닉네임</label>
       	 <input type="text" name="nickname"><br/><br/>
        <label for="comment">댓글</label>
        <textarea id="comment" name="comment"></textarea>
        <input type="submit" value="등록" id="submit">
    </form>
<c:if test="${viewData.isEmpty()}">
등록된 메시지가 없습니다.
</c:if>

<c:if test="${!viewData.isEmpty()}">
<table border="1">
	<c:forEach var="message" items="${viewData.messageList}">
	<tr>
		<td>
		메시지 번호: ${message.id} <br/>
		손님 이름: ${message.guestName} <br/>
		메시지: ${message.message} <br/>
		<a href="confirmDeletion.jsp?messageId=${message.id}">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>

<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>

</c:if>

</footer>   
</body>
</html>