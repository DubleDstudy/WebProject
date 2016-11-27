<%@page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
<META CHARSET="euc-kr">
	<HEAD>
		<TITLE>기념일추가</TITLE>
	</HEAD>
	<BODY>
		<H3>추가</H3>
		<FORM ACTION=anniverJ.jsp METHOD=POST>
			날짜: <INPUT TYPE=DATE NAME=ANNIDATE><BR>
			내용: <INPUT TYPE=TEXT NAME=ANNISUMMARY><BR>
			<INPUT TYPE=SUBMIT VALUE='추가'>
		</FORM>
		<FORM ACTION=anni.jsp METHOD=POST>
		<INPUT TYPE=SUBMIT VALUE='뒤로가기'>
		</FORM>
	</BODY>
</HTML>