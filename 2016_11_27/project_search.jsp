<%@page contentType="text/html; charset=euc-kr" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
    <title></title>
    <style>
        body {
            background-color: lightpink;
        }

        fieldset {
            width: 500px;
        }
    </style>
</head>
<body>
        <div align="center">
            <fieldset>
                <legend>아이디 찾기</legend>
               		<table>
				<form action="IDSearch.jsp">
                		<tr>
                     	   		<td>이름 : </td>
                       	   		<td><input type="text" name="NAME" /></td>
                    	   	</tr>
                   	   	<tr>
                        		<td>휴대폰 번호Phone : </td>
                       			<td><input type="tel" name="PHONE" /></td>
                    	   	</tr>
                    	   	<tr>
                        		<td>이메일 :  </td>
                        		<td><input type="email" name="EMAIL" /></td>
                    		</tr>
                    		<tr>
                        		<td></td>
                        		<td><input type="submit" value="확인" /></td>
                    		</tr>
				</form>		
                	</table>

            </fieldset><br /><br />
            <fieldset>
                <legend>비밀번호 찾기</legend>
                	<table>
				<form action="PWSearch.jsp">
                    		<tr>
                        		<td>아이디 : </td>
                        		<td><input type="text" name="ID" /></td>
                    		</tr>
                    		<tr>
                        		<td>이름 : </td>
                       			<td><input type="text" name="NAME" /></td>
                    		</tr>
                    		<tr>
                        		<td>이메일 : </td>
                        		<td><input type="email" name="EMAIL" /></td>
                    		</tr>
                    		<tr>
                        		<td>비밀번호 힌트 : </td>
                        		<td>
                            			<select name="PASSWORDHINT">
                                			<option value="school">자신이 나온 고등학교 이름은?</option>
                                			<option value="daddy">아버지 성함은?</option>
                                			<option value="mommy">어머니 성함은?</option>
                                			<option value="pet">애완동물 종류는?</option>
                            			</select>
                       			</td>
                    		</tr>
                    		<tr>
                        		<td></td>
                        		<td><input type="text" name="HINT" /></td>
                    		</tr>
                    			<tr>
                       			<td></td>
                       			<td><input type="submit" value="확인" /></td>
                    		</tr>
				</form>
                	</table>
            </fieldset>
        </div>
</body>
</html>