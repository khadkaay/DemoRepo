<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>All Records!</title>
	<meta charset="utf-8">
	
	<style>
		body{
			background-image:url('images/background.png');
			height:100vh;
			width:100vw;
			background-size:cover;
			margin:0;
			font:15px Montserrat, sans-serif;
			color:#FFEADD;
		}
		
		/* Style the top navigation bar */
		.topnav {
		  overflow: hidden;
		  background-color: #35A29F;
		  position:fixed;
		  width: 100%;
		}
		.topnav a {
		  float: left;
		  display: block;
		  color: #f2f2f2;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		}
		.topnav a:hover {
		  background-color: #ACFADF;
		  color: #C51605;
		}
		.topnav-right{
			float:right;
			padding:5px,15px;
		}
		.container{
			padding:50px;
			text-align:center;
			font:red;
		}
		.container-img{
		}
		.container-login{
			width: 300px;
	        overflow: hidden;
	        margin: auto;
	        margin: 20 0 0 450px;
	        padding:10px;
	        background: #35A29F;
	        border-radius: 15px ;
		}
		.rounded-input{
					
			padding:10px;
			width:80%;
			margin:10px;
			box-shadow:0 0 15px 4px rgba(0,0,0,0.06);
			border-radius:15px;
			border:0;
			border-bottom:2px solid #eee;
			text-align:center;
		}	
		
		.button{
			background-image:liner-gradient(#odccea, #0d10ea);
			border:0;
			border-radius:4px;
			box-shadow:rgba(0,0,0,.3) 0 5px 15px;
			box-sizing:border-box;
			color:#982176;
			margin:5px;
			padding:10px 15px; 
			text-align:center;
			user-select:none;
			-webkit-user-select:none;
			touch-action:manipulation;
			width:10%;
		}
		.button:hover,
		.button:focus{
			background-color: #ACFADF;
		}
		
		.styled-table {
		    border-collapse: collapse;
		    margin-left:auto;
		    margin-right:auto;
		    font-size: 0.9em;
		    font-family: sans-serif;
		    width: 70%;
		    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
		}
		.styled-table thead tr {
		    background-color: #009879;
		    color: #ffffff;
		    text-align: center;
		}
		
		.styled-table th,
		.styled-table td {
		    padding: 12px 15px;
		}
		
		.styled-table tbody tr {
		    border-bottom: 1px solid #dddddd;
		}
		
		.styled-table tbody tr:nth-of-type(even) {
		    background-color: #35A29F;
		}
		
		.styled-table tbody tr:last-of-type {
		    border-bottom: 2px solid #009879;
		}
		.styled-table tbody tr.active-row {
		    font-weight: bold;
		    color: #009879;
		}
		
	</style>
</head>

<body>
	<nav class="topnav">
		<a href="login">Home</a>
		<a href="register">Register</a>
		<div class="topnav-right">
		<a href=""></a>
		</div>
	</nav>
	
	<div class="container">
		<h2>Student Records!</h2>
			<div class="container-img">
					<img src="images/allrecords.png" width="400" height="300" alt="showing all records">
			</div>
		<br>
		<table class="styled-table">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Major</th>
					<th>Age</th>
					<th>Email Address</th>
					<th>Password</th>
					<th colspan=2>Action(Delete/Edit)</th>
				</tr>
			</thead>
			
			<tbody>
			<c:forEach var="temp" items="${sdtolist}">
				<tr>
					<td>${temp.studentid}</td>
					<td>${temp.firstname}</td>
					<td>${temp.lastname}</td>
					<td>${temp.age}</td>
					<td>${temp.email}</td>
					<td>${temp.password}</td>
					<td><a href="deleteUser?studentid=${temp.studentid}">
							<img src="images/delete1.png" 
								title ="Click to Delete a Record" width="20" height="20" class="logo" alt="delete button">
						</a>
					</td>
					<td><a href="updateUser?studentid=${temp.studentid}">
							<img src="images/edit.png" 
								title ="Click to Update a Record" width="20" height="20" class="logo" alt="delete button">
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br><br><br>
		<div>	
			<a href="login"><button class="button">Return</button></a>
			<a href="logoff"><button class="button">Logout</button></a>
		</div>
	</div>	
</body>
</html>

