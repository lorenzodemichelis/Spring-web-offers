<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<form:form method="post"
		action="${pageContext.request.contextPath}/docreate"
		commandName="offer">

		<table class="form">
			<tr>
				<td class="label">Name:</td>
				<td><form:input class="control" type="text" name="name"
						path="name" /> <br /> <form:errors path="name" cssClass="error"></form:errors></td>

			</tr>
			<tr>
				<td class="label">Email:</td>
				<td><form:input class="control" type="text" name="email"
						path="email" /> <br /> <form:errors path="email"
						cssClass="error"></form:errors></td>
			</tr>
			<tr>
				<td class="label">Text:</td>
				<td><form:textarea class="control" name="text" path="text"
						rows="10" cols="10"></form:textarea> <br /> <form:errors
						path="text" cssClass="error"></form:errors></td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input class="control" type="submit" value="Create advert" /></td>
			</tr>
		</table>

	</form:form>

</body>
</html>