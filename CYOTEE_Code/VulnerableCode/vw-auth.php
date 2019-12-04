<?php 

$servername = "localhost";
$username = "newuser";
$password = "newpass";
$dbname = "test";

$conn = new mysqli($servername,$username,$password,$dbname);

$sql = "SELECT * FROM employees WHERE name='" . $_GET["user"] . "' AND password='" . $_GET["pass"] . "';";

$result = $conn->query($sql);

$rows = array();

if($result->num_rows > 0)
{
	while($row = $result->fetch_assoc())
	{
		array_push($rows,$row);
	}
	print "Click your name to access your date entry form!<br>";
	foreach($rows as $r)
	{
		$n = $r['name'];
		print "<a href='insertdate.php?name=$n'>" . $n . "</a><br><br>";
	}
}
else
{
	header("Location: invalid.html");
}

?>