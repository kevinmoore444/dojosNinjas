<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/style.css"/>

</head>
<body>
	<div class="content">
		<h1>${dojo.name} Location Ninjas</h1>
		<table style="margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 20px">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Age</th>
	
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachNinja" items="${dojo.ninjas}">
					<tr>
						<td><c:out value="${eachNinja.firstName}"/></td>
						<td><c:out value="${eachNinja.lastName}"/></td>
						<td><c:out value="${eachNinja.age}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/dojos/new"><button class="btn btn-secondary">Go back</button></a>
	</div>



</body>
</html>