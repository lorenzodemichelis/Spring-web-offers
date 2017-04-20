<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" type="text/css">
<title>Login Page</title>
</head>
<body onload='document.f.username.focus();'>

	<c:if test="${param.error != null }">
	
		<p class="login-error">Login Failed! Check your Username and Password!</p>
	
	</c:if>
	
	<h3>Login with Username and Password</h3>
	<form name='f' action='${pageContext.request.contextPath}/login'
		method='POST'>
		<table class="form">
			<tr>
				<td>User:</td>
				<td align="right"><input type='text' name='username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td align="right"><input type='password' name='password' /></td>
			</tr>
			<tr>
				<td>Remeber me</td>
				<td align="right"><input type='checkbox' name='_spring_security_remember_me' checked="checked"/></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="Login" /></td>
			</tr>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		</table>
	</form>
	
	<p><a href='<c:url value="/newaccount"/>'>Create and account!</a></p>
	
</body>
</html>