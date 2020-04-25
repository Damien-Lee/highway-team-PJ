<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<table  border="1"style="border-collapse:collapse; border:1px gray solid;" align="center">
            <tr><!--1s-->
                <td colspan="3" bgcolor="33ffcc" align="center">
                    <font size="5"><B>기본 정보</B></font></td>
            </tr><!--1e-->
                
            <tr><!--2s-->
                    <td  bgcolor="D5D5D5" align="center"><strong>아이디(이메일)</strong></td>
                    <td colspan="2"> <input type="text" name="id">이메일을 입력해주세요.</td>
            </tr><!--2e-->
 
            <tr><!--3s-->
                    <td bgcolor="D5D5D5" align="center"><strong>비밀번호</strong></td>
                    <td colspan="2"> <input type="password" name="password">
                    4~12자의 영문 대소문자와 숫자로만 입력해주세요</td>
            </tr><!--3e-->
 
            <tr><!--4s-->
                    <td bgcolor="D5D5D5" align="center"><strong>비밀번호확인</strong></td>
                    <td colspan="2"> <input type="password" name="password">
                    </td>
            </tr><!--4e-->
 
            <tr><!--5s-->
                    <td  bgcolor="D5D5D5" align="center"><strong>닉네임</strong></td>
                    <td colspan="2"> <input type="text" name="id">닉네임을 입력해주세요.</td>
            </tr><!--5e-->
 
            <tr><!--6s-->
                    <td bgcolor="D5D5D5" align="center" ><strong>생년월일</strong></td>
                    <td colspan="2">
                        <input type="text" name="year" size="3">년
                        <select>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>월
                        <select>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                            <option>24</option>
                            <option>25</option>
                            <option>26</option>
                            <option>27</option>
                            <option>28</option>
                            <option>29</option>
                            <option>30</option>
                            <option>31</option>
                        </select>일 
                    </td>
                    </tr><!--6e-->
 
                <tr>
                    <td bgcolor="D5D5D5" align="center"><STRONG>관심분야</STRONG></td>
                    <td>
                    	 <input type="CheckBox" name="kyou">1
                   		 <input type="CheckBox" name="kyou">2
                  	  	 <input type="CheckBox" name="kyou">3
                   		 <input type="CheckBox" name="kyou">4
                   		 <input type="CheckBox" name="kyou">5
                    </td>
                </tr>

                </table>
              
                <p align="center">
                <input type="submit" name="mali" value="회원가입" >
                <input type="reset" value="다시입력">
                </p>

</body>
</html>