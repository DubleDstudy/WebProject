<%@page contentType="text/html; charset=euc-kr" %>
<%
	request.setCharacterEncoding("euc-kr"); 
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type"  content="text/html;charset=euc-kr"/>
    <title>회원신청서</title>
<style>
    body{background-color: pink;}
</style>
</head>
<body>

    <script>
    function checkLength(elem, min, max) {
        var s = elem.value;
        if (s.length >= min && s.length <= max) {
            document.getElementById("ex").innerHTML="적당합니다";
            return true;
        }
        else if (s.length < min) {
            document.getElementById("ex").innerHTML = "패스워드의 길이가 짧습니다!";
        }
        else if (s.length > max) {
            document.getElementById("ex").innerHTML = "패스워드의 길이가 깁니다!";
        }
    }

    function checkEmail(elem, msg) {
        var exp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6](?:\.[a-z]{2})?)$/;
        if (elem.value.match(exp)){
            return true;
        } else {
            document.getElementById("ex2").innerHTML = msg;
            elem.focus();
            return false;
        }
    }

    function checkNumeric(elem, msg) {
        var exp = /^[0-9]+$/;
        if (elem.value.match(exp)) {
            return true;
        } else {
            document.getElementById("ex3").innerHTML = msg;
            elem.focus();
            return false;
        }
    }

    function checkPWLength() {
        var s = document.getElementById('pw').value;
        var sk = document.getElementById('pwck').value;
        if (s == sk) {
            document.getElementById("ex4").innerHTML = "패스워드가 확인되었습니다!";
        }
        else {
            document.getElementById("ex4").innerHTML = "패스워드가 다릅니다!";
        }
    }

    </script>

    <h3 align="center">회원 신청서</h3>
    <form action="AgreeMent.jsp" method="post"> 
        <table align="center">
            <tr>
                <td>이름</td>
                <td><input type='text' id='name' name="name" /> <br /></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input type="radio" name="gender" value="male" />남성<input type="radio" name="gender" value="female" />여성<br /></td>
            </tr>
            <tr>
                <td>휴대폰 번호Phone</td>
                <td><input type='tel' id='phone' name="phone" onkeyup="checkNumeric(document.getElementById('phone'), '숫자만 입력하세요!');"/><span id="ex3"></span></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type='email' id='email' name="email" /></td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type='text' id="add" name="address"></td>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type='text' id='id' name="id" /> <br /></td>
            </tr>
            <tr>
                <td>비밀번호(6-20 글자)</td>
                <td><input type='password' id='pw'  name="password"onkeyup="checkLength(document.getElementById('pw'), 6, 20)"/><span id="ex"></span></td>
            </tr>
            <tr>
                <td>비밀번호 검증</td>
                <td><input type='password' id='pwck' name="password"onkeyup="checkPWLength();"/><span id="ex4"></span></td>
            </tr>
            <tr>
                <td>비밀번호힌트</td>
                <td ><select id="passwordhint" name="passwordhint">
                    <option value="school">자신이 나온 고등학교 이름은?</option>
                    <option value="daddy">아버지 성함은?</option>
                    <option value="mommy">어머니 성함은?</option>
                    <option value="pet">애완동물 종류는?</option>
                </select></td>  
            </tr>
            <tr>
            <td></td>
            <td><input type="text" id="hint" name="hint"></td>
            </tr>
            <tr>
                <td>자동가입방지</td>
                <td><img src="1.png"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="text" id="protectauto"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type='submit' value='제출' />
                </td>
            </tr>
         </table>
    </form>
</body>
</html>