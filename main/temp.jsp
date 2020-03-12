<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String date=request.getParameter("date");
		if(date==null)     date="2020-01-20";
		request.setAttribute("date", date);
	%>
	<!--<jsp:forward page="index.jsp" ></jsp:forward>-->
	
	<script>
		function a(){
			
			window.location.href="http://localhost:8080/InfectStaticTest1/index.jsp";
			
		}
		a();
	</script>
</body>
</html>