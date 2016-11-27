<%@page contentType="text/html; charset=euc-kr"%>
<%
	response.setContentType("text/html; charset=euc-kr");
	String pw = request.getParameter("PASSWORD");
%>
<html>
	<head>
		<title>PWSearch</title>
	</head>
	<body>
		<script>
			var pw = "<%= pw %>";
			if (pw == "NULL") {
				alert("입력하신 내용과 일치하는 회원정보가 없습니다. 다시 확인 후 입력해주세요.");
				window.location = "project_search.jsp";
			}
			else {
				alert("비밀번호는 '" + pw + "'입니다.");
				window.location = "project_search.jsp";
			}
		</script>
	</body>
</html>