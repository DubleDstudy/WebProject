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
		<FORM ACTION=moneyJ.jsp METHOD=POST>
			날짜: <INPUT TYPE=DATE NAME=MONEYDATE><BR>
			내용: <INPUT TYPE=TEXT NAME=MONEYSUMMARY><BR>
			출금: <INPUT TYPE=TEXT NAME=MONEYWITHDRAW><BR>
			입금: <INPUT TYPE=TEXT NAME=MONEYDEPOSIT VALUE ="0"><BR>
			<INPUT TYPE=SUBMIT VALUE='추가'>
		</FORM>
		<FORM ACTION=money.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='뒤로가기'>
		</FORM>
	</BODY>
</HTML>