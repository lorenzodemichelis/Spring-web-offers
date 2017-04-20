<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/static/css/main.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/script/jquery.js"></script>

<script type="text/javascript">
	
	function onLoad() {
		$("#password").keyup(checkPasswordMatch);
		$("#confirmpass").keyup(checkPasswordMatch);
		$("#details").submit(canSubmit);
	}
	
	function canSubmit() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		
		if(password != confirmpass) {
			return false;
		} else {
			return true;
		}
	}

	function checkPasswordMatch() {
		var password = $("#password").val();
		var confirmpass = $("#confirmpass").val();
		
		if(password.length < 3){
			return;
		} 
		if(password == confirmpass) {
			$("#matchpass").text("<fmt:message key='MatchedPasswords.user.password'></fmt:message>");
			$("#matchpass").addClass("valid");
			$("#matchpass").removeClass("error");
		} else {
			$("#matchpass").text("<fmt:message key='UnmatchedPasswords.user.password'></fmt:message>");
			$("#matchpass").addClass("error");
			$("#matchpass").removeClass("valid");
		}
	}
	
	$(document).ready(onLoad);
	
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>

	<h2>Create a new Account</h2>

	<form:form id="details" method="post"
		action="${pageContext.request.contextPath}/createaccount"
		commandName="user">

		<table class="form">
			<tr>
				<td class="label">Username:</td>
				<td>
					<form:input class="control" type="text" name="username" path="username" /> <br /> 
					<div class="error">
						<form:errors path="username"></form:errors>
					</div>
				</td>

			</tr>
			<tr>
				<td class="label">Email:</td>
				<td>
					<form:input class="control" type="text" name="email" path="email" /> <br /> 
					<div class="error">
						<form:errors path="email"></form:errors>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Password:</td>
				<td>
					<form:input class="control" id="password" type="password" name="password" path="password" /> <br />
					<div class="error">  
						<form:errors path="password"></form:errors>
					</div>
				</td>
			</tr>
			<tr>
				<td class="label">Confirm Password:</td>
				<td><input class="control" id="confirmpass" type="password" name="confirmpassword" />
					<div id="matchpass">
					</div>	
				</td>
			</tr>
			<tr>
				<td class="label"></td>
				<td><input class="control" type="submit" value="Create account" /></td>
			</tr>
		</table>

	</form:form>

</body>
</html>