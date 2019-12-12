<?php

$servername = "localhost";
$username = "newuser";
$password = "newpass";
$dbname = "test";

$user = $_GET['user'];
$date = $_GET['date'];

$conn = new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error)
{
	die("Connection Failed: " . $conn->connect_error);
}

$sql = "INSERT INTO startdates (name, date) VALUES (\"$user\",\"$date\");";

$conn->query($sql);

?>

<html>
	<body style="background-color: black; color: white">
		<div style="text-align: center">
			<h1>Insert Complete!</h1>
			<button onclick="location.href='index.html'">Return to Login Page</button>
		</div>
	</body>
</html>