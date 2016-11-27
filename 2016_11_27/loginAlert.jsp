<%@page contentType="text/html; charset=euc-kr"%>
<%
	response.setContentType("text/html; charset=euc-kr");
	String result = request.getParameter("RESULT");
%>
<html>
	<head>
		<title>login</title>
	</head>
	<body>
		<script>
			var result = "<%= result %>";
			if (result == "DISCORD") {
				alert("비밀번호가 일치하지 않습니다");
				window.location = "login.html";
			}
			else {
				alert("아이디가 존재하지 않습니다.");
				window.location = "login.html";
			}
		</script>
	</body>
</html>