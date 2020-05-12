<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<body style="width:900px;margin:0 auto;">
<main class="main">
	<div id="" align="center">
        공지사항 게시판
    </div>
    <div id="" align="right">
        검색
    </div>
    <div id="write" align="right">
    </div>
    <table border="1" width="90%" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>번호</td>
            <td>제목</td>
            <td>내용</td>
            <td>작성일</td>
            <td>조회수</td>
        </tr>
        <c:forEach var="notice" items="notice">
        <tr>
            <td>${notice.nono}</td>
            <td>${notice.notitle}</td>
            <td>${notice.nocontent}</td>
            <td>${notice.nodate}</td>
            <td>${notice.noview}</td>
        </tr>
     </c:forEach>
    </table>
</main>
</body>
</html>