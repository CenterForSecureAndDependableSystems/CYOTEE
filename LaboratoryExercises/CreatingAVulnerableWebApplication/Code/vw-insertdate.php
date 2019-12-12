<?php 
	$n = $_GET['name'];
?>

<html>
	<body style="background-color: black; color: white">
		<div style="text-align: center">
			<form action="insert.php" method="get">
				Enter a date in MM/DD/YYYY format<br>
				<input type="text" name="date"><br>
				<input type="text" name="user" value="<?php echo $n; ?>" readonly><br>
				<input type="submit">
			</form>
		</div>
	</body>
</html>
