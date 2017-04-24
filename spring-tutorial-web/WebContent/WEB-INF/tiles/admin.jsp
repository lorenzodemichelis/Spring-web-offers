<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h3>Admin Page</h3>

<table class="form">

	<tr>
		<td>Username</td>
		<td>Email</td>
		<td>Authority</td>
		<td>Enabled</td>
	</tr>

	<c:forEach var="user" items="${users}">
		<tr>
			<td><c:out value="${user.username}"></c:out></td>
			<td><c:out value="${user.email}"></c:out></td>
			<td><c:out value="${user.authority}"></c:out></td>
			<td><c:out value="${user.enabled}"></c:out></td>
		</tr>
	</c:forEach>

</table>
