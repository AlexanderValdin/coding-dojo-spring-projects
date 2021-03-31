<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">    
	<link rel="stylesheet" href="css/style.css">
	<!-- CSS only -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title></title>
</head>
<body>
<div class="header"></div>
	<div class="container">
		<div class="row">
			<div class="col formContent">
				<p class="h3 text-left">Register</p>
				<p><form:errors path="user.*"></form:errors>
				<form:form action="/register" method="POST" modelAttribute="userRegister">
				
					<div >
						<form:label path="name" >Name:</form:label>
						<form:errors path="name"/>
						<form:input path="name" class="form-control border border-secondary col-8"/>
					</div>
					<div >
						<form:label path="email" >E-mail:</form:label>
						<form:errors path="email"/>
						<form:input path="email" type="email" class="form-control border border-secondary col-8"/>
					</div>
					<div >
						<form:label path="password" >Password:</form:label>
						<form:errors path="password"/>
						<form:password path="password" class="form-control border border-secondary col-8" />
					</div>
					<div >
						<form:label path="passwordConf" >Password Confirmation:</form:label>
						<form:errors path="passwordConf"/>
						<form:password path="passwordConf"  cssClass="form-control border border-secondary col-8"/>
					</div>
					<br>
					<div class="button">
						<Button type="submit" class="btn btn-primary">Register</Button>
					</div>	
				</form:form>
			</div>
			<div class="col">
				<p class="h3 text-left">Login</p>
				<p><c:out value="${error}"></c:out></p>
				<form method="POST" action="/login">
					<p>
						<label >Email</label>
						<input type="text" id="email" name="email" class="form-control border border-secondary col-8" type="text" name="email">
					</p>
					<p>
						<label >Password</label>
						<input type="password" id="password" name="password" class="h4 text-dark font-weight-normal form-control border border-secondary col-8" type="password" name="password">
					</p>
					<div class="button">
						<Button type="submit" class="btn btn-primary">Login</Button>
					</div>
				</form>
			</div>
			
		</div>
	</div>




	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>