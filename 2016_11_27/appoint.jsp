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
		<FORM ACTION=appointJ.jsp METHOD=POST>
			��¥: <INPUT TYPE=DATE NAME=APPODATE><BR>
			����: <INPUT TYPE=TEXT NAME=APPOSUMMARY><BR>
			<INPUT TYPE=SUBMIT VALUE='�߰�'>
		</FORM>
		<FORM ACTION=appo.jsp METHOD=POST>
			<INPUT TYPE=SUBMIT VALUE='�ڷΰ���'>
		</FORM>
	</BODY>
</HTML>