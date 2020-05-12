<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.DAO.ReviewDAO"%>
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
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
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

	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%= viewData %>"/>
    <form name="review" id="review" method="post" action="review_write.jsp">
        <div class="review">
            휴게소 만족도
            <input type="radio" name="rating" value="1" id="1"> <i class="far fa-angry"> 1</i>
            <input type="radio" name="rating" id="2"> <i class="far fa-frown"> 2</i>
            <input type="radio" name="rating" id="3"> <i class="far fa-meh"> 3</i>
            <input type="radio" name="rating" id="4"> <i class="far fa-smile"> 4</i>
            <input type="radio" name="rating" id="5"> <i class="far fa-laugh"> 5</i>
            <input type="radio" name="star-input" value="1" id="p1">
	    	<%-- <label for="p1">1</label>
	    	<input type="radio" name="star-input" value="2" id="p2">
	    	<label for="p2">2</label>
	    	<input type="radio" name="star-input" value="3" id="p3">
	    	<label for="p3">3</label>
	    	<input type="radio" name="star-input" value="4" id="p4">
	    	<label for="p4">4</label>
	    	<input type="radio" name="star-input" value="5" id="p5">
	    	<label for="p5">5</label>
  		<output for="star-input"><b>${review.resatis}</b>점</output>		 --%>
        </div><br/>
	    					
</span>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/star.js"></script>
       	 <label for="nickname">닉네임</label>
       	 <input type="text" name="name"><br/><br/>
       	 <label for="nickname">암호</label>
       	 <input type="password" name="password"><br/><br/>
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
		닉네임: ${review.name} <br/>
		작성일자 : ${review.redate}
		만족도 : ★*${review.resatis}
		메시지: ${review.recontent} <br/>
		<a href="confirmDeletion.jsp?messageId=${message.id}">[삭제하기]</a>
		</td>
	</tr>
	</c:forEach>
</table>
<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
<a href="list.jsp?page=${pageNum}">[${pageNum}]</a> 
</c:forEach>
</c:if>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/star.js"></script>
</footer>   
</body>
</html>