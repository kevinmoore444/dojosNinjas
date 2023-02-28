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
	<div class="form">
		<h1>Create Dojo</h1>
		<form:form action="/dojos/new" method="post" modelAttribute="newDojo">
		    <p>
		        <form:label path="name">Dojo Name:</form:label>
		        <form:errors path="name"/>
		        <form:input path="name"/>
		    </p>
		    <button class="btn btn-primary" type="submit" value="Submit">Add Dojo</button>
		</form:form>
	</div>
	
	
	<div style="margin-top: 30px" class="content">
		<h1>Dojos</h1>
		<table  class="content">
			<thead>
				<tr>
					<th>Name</th>
					<th>Students</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="eachDojo" items="${dojoList}">
					<tr>
						<td><a href="/dojos/${eachDojo.id}"><c:out value="${eachDojo.name}"/></a></td>
						<td>
							<c:choose>
								<c:when test="${eachDojo.ninjas == null}">
									<td>0</td>
								</c:when>
								<c:otherwise>
									<c:out value="${eachDojo.ninjas.size()}"/>
								</c:otherwise>
							</c:choose>
						</td> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/ninjas/new"><button style="margin-top: 20px" class="btn btn-primary">Add Ninja</button></a>
	</div>

</body>
</html>