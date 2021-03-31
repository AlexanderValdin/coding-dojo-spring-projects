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
	<form method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="logout" />
    </form>


	<h1>Admin Dashboard</h1>
    <h3>Customers</h3>
    <table>
    		<thead>
    		<tr>
    			<th>Name</th>
    			<th>Next Due Date</th>
    			<th>Amount Due</th>
    			<th>Subscription Type</th>
    	
    		</tr>
    		</thead>
    		<tbody>
    		<c:forEach items="${users}" var="user">
			  	<tr>
			  		<td>${user.name}</td>
			  		<td>${user.getDueDate}</td>
			  		<td> ${user.getPack().getCost()}</td>
			  		<td> ${user.getPack().getName()}</td>		
			  	</tr>
			</c:forEach>
		  </tbody>
    </table><br>
    <h3>Packages</h3>
    <table>
    	<thead>
    		<tr>
    			<th>Package Name</th>
    			<th>Cost</th>
    			<th>Available</th>
    			<th>Users</th>
    			<th>Actions</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach items="${packs}" var="pack">
    		<tr>
    			<td>${pack.name}</td>
    			<td>${pack.cost}</td>
    			<% if(pack.getAvailable(true)) { %>
    						<td>Available</td>
    					<% } else { %>
    						<td>Unavailable</td>
    					<% } %>
    			<td>${pack.getUsers().size()}</td>
    					<% if(pack.isAvailable()){%>
    						<% if(pack.getUsers().size() == 0) { %>
    							<td><a href="/pack/deactivate/${pack.id}">Deactivate</a> || <a href="/pack/${pack.id }/edit">Edit</a></td>
    						<% } else { %>
    							<td><a href="/pack/deactivate/${pack.id }">Deactivate</a></td>
    						<% } %>
    					<% } else if(!pack.isAvailable()){ %>
    						<td><a href="/pack/activate/${pack.id}">Activate</a></td>
    				<% } %>
    		<% } %>
 
    		</tr>
    	</tbody>
    </table>
    
    <h3>Create Package</h3>
    <form:form method="POST" modelAttribute="package" action="/createpack">
    	<p>
    		<form:label path="name">Package Name:
    		<form:errors path="name"/>
    		<form:input path="name" type="text"/>
    		</form:label>
    	</p>
    	<p>
    		<form:label path="cost">Package Cost:
    		<form:errors path="cost"/>
    		<form:input path="cost" type="number"/>
    		</form:label>
    	</p>
    		<input type="submit"/>
    </form:form>
    
   

	<!-- JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>