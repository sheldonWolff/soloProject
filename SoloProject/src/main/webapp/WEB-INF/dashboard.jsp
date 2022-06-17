<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to TrackLaps!</title>
</head>
<body>
	<div style="display:flex; flex-direction:row-reverse">
		<a href='/logout'>Logout</a>
	</div>
	<br/>
	<h1 style="text-align:center;">Welcome, <c:out value="${user.name}"/>!</h1>
	<h2 style="text-align:center;">Here are the fastest lap times:</h2>
	<hr/>
	<div style="display:flex; flex-flow:column">
		<h3 style="text-decoration-line: underline;text-align:center;"><a href="/show/track/<c:out value='${track1.id}'/>"><c:out value="${track1.track}"/></a></h3>
		<table style="border: 1px solid; border-collapse: collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid; font-weight: bold;">Name</td>
					<td style="border: 1px solid; font-weight: bold;">Lap Time (mm.ss)</td>
					<td style="border: 1px solid; font-weight: bold;">Date</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="border: 1px solid;"><c:out value="${track1.user.name}"/></td>
					<td style="border: 1px solid;"><c:out value="${track1.time}"/></td>
					<td style="border: 1px solid;"><fmt:formatDate value="${track1.createdAt}" pattern="MM-dd-yyyy" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="display:flex; flex-flow:column">
		<h3 style="text-decoration-line: underline;text-align:center;"><a href="/show/track/<c:out value='${track2.id}'/>"><c:out value="${track2.track}"/></a></h3>
		<table style="border: 1px solid; border-collapse: collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid; font-weight: bold;">Name</td>
					<td style="border: 1px solid; font-weight: bold;">Lap Time (mm.ss)</td>
					<td style="border: 1px solid; font-weight: bold;">Date</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="border: 1px solid;"><c:out value="${track2.user.name}"/></td>
					<td style="border: 1px solid;"><c:out value="${track2.time}"/></td>
					<td style="border: 1px solid;"><fmt:formatDate value="${track2.createdAt}" pattern="MM-dd-yyyy" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div style="display:flex; flex-flow:column">
		<h3 style="text-decoration-line: underline;text-align:center;"><a href="/show/track/<c:out value='${track3.id}'/>"><c:out value="${track3.track}"/></a></h3>
		<table style="border: 1px solid; border-collapse: collapse; text-align:center">
			<thead style="border: 1px solid;">
				<tr>
					<td style="border: 1px solid; font-weight: bold;">Name</td>
					<td style="border: 1px solid; font-weight: bold;">Lap Time (mm.ss)</td>
					<td style="border: 1px solid; font-weight: bold;">Date</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="border: 1px solid;"><c:out value="${track3.user.name}"/></td>
					<td style="border: 1px solid;"><c:out value="${track3.time}"/></td>
					<td style="border: 1px solid;"><fmt:formatDate value="${track3.createdAt}" pattern="MM-dd-yyyy" /></td>
				</tr>
			</tbody>
		</table>
	</div>
	<br>
	<div style="display:flex; flex-direction:row-reverse">
		<a href="/myLaps"><button>My Lap Times</button></a>
	</div>
</body>
</html>