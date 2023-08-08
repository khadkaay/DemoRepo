<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
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
		img{
			border-radius:10%;
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
		.link{
			color:#FFEADD;
			font-size: 15px;
		}
		.link:hover{
			color:#982176;
		}
	</style>
</head>

<body>
	<nav class="topnav">
		<a href="login">Home</a>
		<a href="register">Register</a>
		<div class="topnav-right">
		<a href="login"></a>
		</div>
	</nav>
	
	<div class="container">
		<h2>Admin Login!</h2>
			<div class="container-login">
				<div class="container-img">
					<img src="images/adminsuccess.jpeg" width="300" height="270" alt="admin login">
				</div>
				<p>${faillogin}</p>
				<form action="adminValidate" method="post">
				  <input class="rounded-input" type="text" id="email" placeholder="Email ID" name="email" autocomplete="off"><br>
				  
				  <input class="rounded-input" type="password" id="password" placeholder="Password" name="password" autocomplete="off"><br>
				  
				  <br><br><br>
	
					<div>	
						<button class="button">Submit</button>
						<button type="reset" class="button">Reset</button> 
						<a href="login"><button class="button">Back</button></a>
					</div>
				</form>	
			</div>
	</div>	
</body>
</html>

