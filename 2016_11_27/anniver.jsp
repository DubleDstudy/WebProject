<%@page contentType="text/html; charset=euc-kr"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<HTML>
<META CHARSET="euc-kr">
	<HEAD>
		<TITLE>������߰�</TITLE>
	</HEAD>
	<BODY>
		<H3>�߰�</H3>
		<FORM ACTION=anniverJ.jsp METHOD=POST>
			��¥: <INPUT TYPE=DATE NAME=ANNIDATE><BR>
			����: <INPUT TYPE=TEXT NAME=ANNISUMMARY><BR>
			<INPUT TYPE=SUBMIT VALUE='�߰�'>
		</FORM>
		<FORM ACTION=anni.jsp METHOD=POST>
		<INPUT TYPE=SUBMIT VALUE='�ڷΰ���'>
		</FORM>
	</BODY>
</HTML>