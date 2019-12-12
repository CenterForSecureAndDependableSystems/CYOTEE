<?php

$servername = "localhost";
$username = "webapp2";
$password = "webapp2";
$dbname = "test";

$user = $_GET['user'];
$date = $_GET['date'];

$regex = "/(\d{2})\/(\d{2})\/(\d{4})/";
preg_match($regex,$date,$matches);

if($matches == NULL)
{
	header("Location: invaliddate.html");
	exit();
}
else
{
	$da = explode("/",$date);
	$m = intval($da[0]);
	$d = intval($da[1]);
	$y = intval($da[2]);

	if($m < 1 || $m > 12)
	{
		header("Location: invaliddate.html");
		exit();
	}

	if($d < 1 || $d > 31)
	{
		header("Location: invaliddate.html");
		exit();
	}

	if($m == 4 || $m == 6 || $m == 9 || $m == 11)
	{
		if($d == 31)
		{
			header("Location: invaliddate.html");
			exit();
		}
	}

	if($m == 2)
	{
		if($d > 29)
		{
			header("Location: invaliddate.html");
			exit();
		}

		if($d == 29)
		{
			if( (($y % 4 == 0) && ($y % 100 != 0)) || ($y % 400 == 0) )
			{
				//this is a leap year, which is valid
			}
			else
			{
				header("Location: invaliddate.html");
				exit();
			}
		}
	}
}


$conn = new mysqli($servername,$username,$password,$dbname);

if($conn->connect_error)
{
	die("Connection Failed: " . $conn->connect_error);
}

$sql = $conn->prepare("INSERT INTO startdates (name,date) VALUES (?,?)");
$sql->bind_param("ss",$user,$date);
$sql->execute();

?>

<html>
	<body style="background-color: black; color: white">
		<div style="text-align: center">
			<h1>Insert Complete!</h1>
			<button onclick="location.href='index.html'">Return to Login Page</button>
		</div>
	</body>
</html>
