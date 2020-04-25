<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>loginForm</title>
    <style>
        #headtext{color: blue;}
        #idtable {margin-top:5%}
        #headtext{margin-top:10%; font-size:50px}
    </style>
</head>
<body>
    <div id="headtext" align="center" ondrop="10%" >로그인 폼 입니다.</div>
     <table align="center" id="idtable" >
        <tr height="50px">
            <td>아이디 : </td>
            <td id="idtext">
               <input type="text" height="100px" style="width:300px; height:30px"/>
            </td>
        </tr>
        <tr>
            <td>
                패스워드:
            </td>
            <td id="pwtext">
               <input type="password" style="width:300px; height:30px"/>
            </td>
        </tr>
         <tr>
             <td>

             </td>
             <td>
                 <input type="submit" id="emaillogin" value="이메일 로그인"> 
                 <input type="submit" id="kakaologin" value="카카오 로그인"> 
                 <input type="submit" id="naverlogin" value="네이버 로그인">
             </td>
         </tr>
         <tr>
             <td>
             </td>
         		<td>
		         		<input type="reset" value="취소"> 
		         		<input type="button" id="joinmember"value="회원가입"/>
       			</td>
         </tr>
         

    </table>

</body>
</html>