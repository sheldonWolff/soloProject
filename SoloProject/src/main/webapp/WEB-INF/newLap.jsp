<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a New Lap Time</title>
</head>
<body>
	<div style="display:flex; flex-direction:row-reverse">
		<a href="/logout">Logout</a>
		|
		<a href="/home">Home</a>
	</div>
	<h1 style="text-align:center;">Add a New Lap Time</h1>
	<hr/>
	<div style="display:flex; justify-content:center; align-items:flex-end">
		<form:form class="form" action="/create/lap" method="post" modelAttribute="lap">
				<div>
					<form:label path="track">Track:</form:label>
					<form:select path="track">
						<form:option value="Freedom Park"/>
						<form:option value="Hot Rod Hobbies"/>
						<form:option value="Channel Islands Raceway"/>
					</form:select>
				</div>
				<br/>
				<div>
					<form:label path="time">Lap Time (mm.ss):</form:label>
					<form:input type="number" step="0.01" path="time"/>
					<form:errors path="time"/>
				</div>
				<br/>
				<div>
					<form:label path="car">Car Used:</form:label>
					<form:input type="text" path="car"/>
					<form:errors path="car"/>
				</div>
				<br/>
				<input type ="submit" value="Submit"/>
			</form:form>
			<div>
				<a href="/myLaps"><button>Cancel</button></a>
			</div>
	</div>
</body>
</html>