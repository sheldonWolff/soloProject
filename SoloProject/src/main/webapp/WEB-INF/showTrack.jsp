<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="${lap.track}"/></title>
</head>
<body>
	<div style="display:flex; flex-direction:row-reverse">
		<a href="/logout">Logout</a>
		|
		<a href="/home">Home</a>
	</div>
	<h1 style="text-align:center;"><c:out value="${lap.track}"/></h1>
	<hr/>
	<div style="display:flex; flex-flow:column">
		<h2 style="text-decoration-line: underline;text-align:center;">Leaderboard</h2>
		<table style="border: 1px solid; border-collapse: collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid;">Name</td>
					<td style="border: 1px solid;">Time</td>
					<td style="border: 1px solid;">Date</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${track}" var="lap">
					<tr>
						<td style="border: 1px solid;"><c:out value="${lap.user.name}"/></td>
						<td style="border: 1px solid;"><c:out value="${lap.time}"/></td>
						<td style="border: 1px solid;"><fmt:formatDate value="${lap.createdAt}" pattern="MM-dd-yyyy" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br/>
	<div style="display:flex; flex-direction:row-reverse">
		<a href="/newlap"><button>Add New Lap Time</button></a>
	</div>
</body>
</html>