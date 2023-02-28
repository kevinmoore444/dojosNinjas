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
		<h1>New Ninja</h1>
			<form:form action="/ninjas/new" method="post" modelAttribute="newNinja">
			    <p>
			        <form:errors path="firstName"/>
			        <form:input style="text-align: center" path="firstName" placeholder="First Name"/>
			    </p>
			    <p>
			        <form:errors path="lastName"/>
			        <form:input style="text-align: center" path="lastName" placeholder="Last Name"/>
			    </p>
			    <p>
			        <form:errors path="age"/>     
			        <form:input style="text-align: center" type="number" path="age" placeholder="Age"/>
			    </p>
			    <p>
			    <form:label path="dojo">Dojo:</form:label>
			    <form:select path="dojo">
			        	<c:forEach var="eachDojo" items="${dojoList}">
			    		<form:option value="${eachDojo.id}">${eachDojo.name}</form:option>
			    		</c:forEach>
			    </form:select>
			    <form:errors path="dojo"/>
				</p>
			    <button class="btn btn-warning" type="submit">Add New Ninja</button>
			</form:form>  
				<a href="/dojos/new"><button style="margin-top: 15px" class="btn btn-secondary">Back</button></a>
	</div>
</body>
</html>