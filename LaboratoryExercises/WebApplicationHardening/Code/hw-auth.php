<?php 

$servername = "localhost";
$username = "webapp1";
$password = "webapp1";
$dbname = "test";

$conn = new mysqli($servername,$username,$password,$dbname);

$sql = $conn->prepare("SELECT * FROM employees WHERE name=? AND password=?");

$sql->bind_param("ss",$_GET['user'],$_GET['pass']);

$sql->execute();

$result = $sql->get_result();

if($result->num_rows > 0)
{
	print "Click you name to access your date entry form!<br>";
	while($row = $result->fetch_assoc())
	{
		$n = $row['name'];
		print "<a href='insertdate.php?name=$n'>" . $n . "</a><br><br>";

	}
}
else
{
	header("Location: invalid.html");
}

$conn->close();
?>