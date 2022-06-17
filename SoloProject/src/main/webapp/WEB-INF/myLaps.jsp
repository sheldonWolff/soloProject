<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Laps</title>
</head>
<body>
	<div style="display:flex; flex-direction:row-reverse">
		<a href="/logout">Logout</a>
		|
		<a href="/home">Home</a>
	</div>
	<h1 style="text-align:center;">Your Fastest Laps!</h1>
	<hr/>
	<div style="display:flex; flex-flow:column">
		<h2 style="text-decoration-line: underline;text-align:center;">Channel Islands Raceway</h2>
		<table style="border: 1px solid; border-collapse: collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid;">Time</td>
					<td style="border: 1px solid;">Car</td>
					<td style="border: 1px solid;">Date</td>
					<td style="border: 1px solid;">Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lap" items="${track1}">
				<tr>
					<td style="border: 1px solid;"><c:out value="${lap.time}"></c:out></td>
					<td style="border: 1px solid;"><c:out value="${lap.car}"></c:out></td>
					<td style="border: 1px solid;"><fmt:formatDate value="${lap.createdAt}" pattern="MM-dd-yyyy" /></td>
					<td style="border: 1px solid;"><a href="/lap/<c:out value="${lap.id}"/>/edit"><button>edit</button></a> | <form:form action="/lap/${lap.id}/delete" method="post" style="display:inline-block">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" value="delete" style="background-color: red">
						</form:form></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="display:flex; flex-flow:column">
		<h2 style="text-decoration-line: underline;text-align:center;">Freedom Park</h2>
		<table style="border: 1px solid; border-collapse: collapse; collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid;">Time</td>
					<td style="border: 1px solid;">Car</td>
					<td style="border: 1px solid;">Date</td>
					<td style="border: 1px solid;">Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lap" items="${track2}">
				<tr>
					<td style="border: 1px solid;"><c:out value="${lap.time}"></c:out></td>
					<td style="border: 1px solid;"><c:out value="${lap.car}"></c:out></td>
					<td style="border: 1px solid;"><fmt:formatDate value="${lap.createdAt}" pattern="MM-dd-yyyy" /></td>
					<td style="border: 1px solid;"><a href="/lap/<c:out value="${lap.id}"/>/edit"><button>edit</button></a> | <form:form action="/lap/${lap.id}/delete" method="post" style="display:inline-block">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" value="delete" style="background-color: red">
						</form:form></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="display:flex; flex-flow:column">
		<h2 style="text-decoration-line: underline;text-align:center;">Hot Rod Hobbies</h2>
		<table style="border: 1px solid; border-collapse: collapse; collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid;">Time</td>
					<td style="border: 1px solid;">Car</td>
					<td style="border: 1px solid;">Date</td>
					<td style="border: 1px solid;">Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="lap" items="${track3}">
				<tr>
					<td style="border: 1px solid;"><c:out value="${lap.time}"></c:out></td>
					<td style="border: 1px solid;"><c:out value="${lap.car}"></c:out></td>
					<td style="border: 1px solid;"><fmt:formatDate value="${lap.createdAt}" pattern="MM-dd-yyyy" /></td>
					<td style="border: 1px solid;"><a href="/lap/<c:out value="${lap.id}"/>/edit"><button>edit</button></a> | <form:form action="/lap/${lap.id}/delete" method="post" style="display:inline-block">
						<input type="hidden" name="_method" value="delete">
						<input type="submit" value="delete" style="background-color: red">
						</form:form></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<div style="display:flex; flex-direction:row-reverse">
		<a href="/newlap"><button>Add New Lap Time</button></a>
	</div>
</body>
</html>