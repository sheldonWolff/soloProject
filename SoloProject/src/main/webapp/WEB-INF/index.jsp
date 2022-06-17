<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register/Log in</title>
</head>
<body>
	<h1 style="color:red; text-align:center;">Welcome to TrackLaps!</h1>
	<hr/>
	<div style="display:flex; justify-content:center;">
		<div style="display:inline-block; width:500px">
			<h2>Sign Up</h2>
			<hr/>
			<form:form class="form" action="/register" method="post" modelAttribute="newUser">
			<div>
					<form:label path="name">Name:</form:label>
					<form:input type="text" path="name"/>
					<form:errors path="name"/>
				</div>
				<br/>
				<div>
					<form:label path="email">Email:</form:label>
					<form:input type="email" path="email"/>
					<form:errors path="email"/>
				</div>
				<br/>
				<div>
					<form:label path="password">Password:</form:label>
					<form:input type="password" path="password"/>
					<form:errors path="password"/>
				</div>
				<br/>
				<div>
					<form:label path="confirm">Confirm Password:</form:label>
					<form:input type="password" path="confirm"/>
					<form:errors path="confirm"/>
				</div>
				<br/>
				<input type ="submit" value="Register"/>
			</form:form>
		</div>
		<div style="display:inline-block; vertical-align:top">
			<h2>Log in</h2>
			<hr/>
			<form:form class="form" action="/login" method="post" modelAttribute="newLogin">
				<div>
					<form:label path="email">Email:</form:label>
					<form:input type="email" path="email"/>
					<form:errors path="email"/>
				</div>
				<br/>
				<div>
					<form:label path="password">Password:</form:label>
					<form:input type="password" path="password"/>
					<form:errors path="password"/>
				</div>
				<br/>
				<input type ="submit" value="Login"/>
			</form:form>
		</div>
	</div>
</body>
</html>