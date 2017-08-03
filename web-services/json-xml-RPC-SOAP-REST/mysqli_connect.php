
<?php
//Author: Alexander Adu-Sarkodie
// Application Type : Web Service: 
//Best practice to use variables/constants to hold configuration dependencies. Allows easy maintenance and scalability

	DEFINE ('DB_USER' ,'studentweb');
	DEFINE ('DB_PASSWORD' ,'your-password');
	DEFINE ('DB_HOST' ,'localhost');
	DEFINE ('DB_NAME' ,'your-db');

//Make connection or manage error handling
	$dbc = @mysqli_connect(DB_USER, DB_PASSWORD, DB_HOST, DB_NAME) 
	OR die('Could not connect to MySQL' . mysqli_connect_error());

?>
