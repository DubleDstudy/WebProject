<%@page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
	<HEAD>
		<TITLE>����߰�</TITLE>
	</HEAD>
	<BODY>
		<H3>�߰�</H3>
		<FORM ACTION=moneyJ.jsp METHOD=POST>
			��¥: <INPUT TYPE=DATE NAME=MONEYDATE><BR>
			����: <INPUT TYPE=TEXT NAME=MONEYSUMMARY><BR>
			���: <INPUT TYPE=TEXT NAME=MONEYWITHDRAW><BR>
			�Ա�: <INPUT TYPE=TEXT NAME=MONEYDEPOSIT VALUE ="0"><BR>
			<INPUT TYPE=SUBMIT VALUE='�߰�'>
		</FORM>
		<FORM ACTION=money.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='�ڷΰ���'>
		</FORM>
	</BODY>
</HTML>