<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>MAIN</title>
    <style>
        .main {float:left}
        .side {float:rigth}
    </style>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69b62909907c366aa67b2e0ae75e9cd0"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main" style="width:68%;height:750px;padding:60px">
    <form name="form1">
    <div id="choice" align="center" style="padding:20px">
        <select name="site" id="site" style="width:68%;height:30px;">
            <option selected>선택하세요</option>
            <option value="13">13개</option>
        </select>
        <script>

        </script>
        <button onclick="sitemove()" style="height:30px;">찾기</button>
    </div>
    </form>
    <p id="button" align="right">
        <button onclick="setOverlayMapTypeId('TRAFFIC')">교통정보</button>
        <button onclick="setOverlayMapTypeId('ROADMAP')">보기</button></p>
    <div id="map" style="width:100%;height:95%" ></div>
    <script src="mapscript.js"></script>
</div>
<form>
<div class="side">
    <div id="logo">
        <img src="https://img.kr.news.samsung.com/kr/wp-content/uploads/2019/10/1017-pr-samsung-1.jpg"
            style="width:15%">
    </div>
    <div id="login">
        <button type="button" id="loginbtn" style="width:15%;height:40px">
            <img src="">로그인</button>
    </div>
    <div id="event">
        <button type="button" id="eventbtn1" style="width:15%;height:40px">
            <img src="">추천 휴게소</button>
        <button type="button" id="eventbtn2" style="width:15%;height:40px">
            <img src=""></button>
        <button type="button" id="eventbtn3" style="width:15%;height:40px">
            <img src=""></button>
    </div>
    <div id="oil">
        오일순위
        <table border="1">
            <tr>
                <td>1</td>
                <td>최저가 어디 얼마</td>
            </tr>
            <tr>
                <td>2</td>
                <td>최저가 어디 얼마</td>
            </tr>
            <tr>
                <td>3</td>
                <td>최저가 어디 얼마</td>
            </tr>
        </table>
    </div>
</div>
</form>
</body>
</html>