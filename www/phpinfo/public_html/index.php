<!DOCTYPE html>
<html lang="de">
<head>
	<title>PHPINFO</title>
	<meta charset="utf-8">
</head>
<body>
	<?php	
		echo 'Thomas'; 
		$link = mysql_connect('localhost', 'root', 'password');
		echo $link . 'Test';
	?>
</body>
</html>