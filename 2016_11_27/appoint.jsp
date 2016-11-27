<%@page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
	<HEAD>
		<TITLE>약속추가</TITLE>
	</HEAD>
	<BODY>
		<H3>추가</H3>
		<FORM ACTION=appointJ.jsp METHOD=POST>
			날짜: <INPUT TYPE=DATE NAME=APPODATE><BR>
			내용: <INPUT TYPE=TEXT NAME=APPOSUMMARY><BR>
			<INPUT TYPE=SUBMIT VALUE='추가'>
		</FORM>
		<FORM ACTION=appo.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='뒤로가기'>
		</FORM>
	</BODY>
</HTML>