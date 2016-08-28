<?php
//connect to mysql
$mysqli = new mysqli("localhost", "danie393_admin", "uhacktas", "danie393_uhack");

if (mysqli_connect_errno()) {
	    printf("Connect failed: %s\n", mysqli_connect_error());
	    exit();
	}
	
?>
