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


	<a href="/shows"><button class="btn btn-success shadow">Home</button></a>			
		</div>	
	</div>
<div class="container">
		<div class="row">
			<div class="col">
						<h2>Package:  ${pack.name}</h2>
						
						<form:form action="/packages/${pack.id}/edit" method="POST" modelAttribute="pack">
							<input type="hidden" name="_method" value="put">
						
							<p>
								<form:label path="name" cssClass="h5 font-weight-normal">Show:</form:label>
								<form:input path="name" cssClass="form-control border border-secondary col-8"/>
							</p>
							<p>
								<form:label path="cost" cssClass="h5 font-weight-normal">network:</form:label>
								<form:input path="cost" cssClass=cssClass="form-control border border-secondary col-8"/>
							</p>
							<p>
							<br>
							<div class="text-center pr-5">
								<input class="btn btn-warning " type="submit" value="Edit"/>
							</div>
	
						</form:form>
						<form action="packages/${pack.id}/delete)">
							<input type="submit" value=" Delete">
						</form>
			</div>
			<div class="col">
				<form:errors path="pack.*" element="p" cssClass="alert alert-danger"/>
			</div>
		</div>
	</div>
	


	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>