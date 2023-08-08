<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Page</title>
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
		img{
			border-radius:10%;
		}
		.container-login{
			width: 350px;
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
			width:40%;
		}
		.button:hover,
		.button:focus{
			background-color: #ACFADF;
		}
		
	</style>
</head>

<body>
	<nav class="topnav">
		<a href="login">Home</a>
		<div class="topnav-right">
		<a href="admin">Admin</a>
		</div>
	</nav>
	
	<div class="container">
		<h2>Please alter the fields you wish to Edit!!!</h2>
			<div class="container-login">
				<div class="container-img">
					<img src="images/user_edit.png" width="250" height="220" alt="registration image">
				</div>
				<p>${updatemessage}</p>
				<br>
				<form 
				action="updatedUser" method="post">
				  <input class="rounded-input" type="hidden" id="email" placeholder="${sdto.studentid}" name="studentid" autocomplete="off" value="${sdto.studentid}"><br>
				  <input class="rounded-input" type="text" id="email" placeholder="${sdto.email}" name="email" autocomplete="off" value="${sdto.email}" ><br>
				  <input class="rounded-input" type="password" id="password" placeholder="${sdto.password}" name="password" autocomplete="off" value="${sdto.password}"><br>
				  <input class="rounded-input" type="text" id="firstname" placeholder="${sdto.firstname}" name="firstname" autocomplete="off" value="${sdto.firstname}" ><br>
				  <input class="rounded-input" type="text" id="lastname" placeholder="${sdto.lastname}" name="lastname" autocomplete="off" value="${sdto.lastname}"><br>
				  <input class="rounded-input" type="text" id="age" placeholder="${sdto.age}" name="age" autocomplete="off" value="${sdto.age}"><br>
				
				  <br>
					<div>	
						<button type="submit" class="button">Submit</button>
						<button type="reset" class="button">Reset</button>
					</div>
				</form>	
			</div>
	</div>	
</body>
</html>

