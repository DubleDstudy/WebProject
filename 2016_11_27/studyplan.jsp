<%@page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
	<HEAD>
		<TITLE>공부계획추가</TITLE>
	</HEAD>
	<BODY>
		<H3>추가</H3>
		<FORM ACTION=studyplanJ.jsp METHOD=POST>
			날짜: <INPUT TYPE=DATE NAME=STUDYDATE><BR>
			내용: <INPUT TYPE=TEXT NAME=STUDYSUMMARY><BR>
			<INPUT TYPE=SUBMIT VALUE='추가'>
		</FORM>
		<FORM ACTION=study.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='뒤로가기'>
		</FORM>
	</BODY>
</HTML>