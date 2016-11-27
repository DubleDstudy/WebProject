<%@page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
	<HEAD>
		<TITLE>일기</TITLE>
	</HEAD>
	<BODY>
		<H3>추가</H3>
		<FORM ACTION=diaryplanJ.jsp METHOD=POST>
			날짜: <INPUT TYPE=DATE NAME=DIARYDATE><BR>
			내용: <INPUT TYPE=TEXT NAME=DIARYSUMMARY><BR>
			<INPUT TYPE=SUBMIT VALUE='추가'>
		</FORM>
		<FORM ACTION=diary.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='뒤로가기'>
		</FORM>
	</BODY>
</HTML>