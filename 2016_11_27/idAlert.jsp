<%@page contentType="text/html; charset=euc-kr"%>
<%
	response.setContentType("text/html; charset=euc-kr");
	String id = request.getParameter("ID");
%>
<html>
	<head>
		<title>IDSearch</title>
	</head>
	<body>
		<script>
			var id = "<%= id %>";
			if (id == "NULL") {
				alert("입력하신 내용과 일치하는 회원정보가 없습니다. 다시 확인 후 입력해주세요.");
				window.location = "project_search.jsp";
			}
			else {
				alert("아이디는 '" + id + "'입니다.");
				window.location = "project_search.jsp";
			}
		</script>
	</body>
</html>