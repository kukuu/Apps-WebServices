<?php
	
	/**
	Connection class for authentication and access to database
	* 
	*/
	class Connection
	{
		
		function __construct()
		{
			$this ->connect();
		}

		function __destruct()
		{
			$this->close();
		}

		function connect()
		{
			//import database connections from PHP file
			require_once_DIR_ . '/db_config.php';

			//User Authentication to  to MySQL database
			$connection = mysql_pconnect(SERVER, USER, PASSWORD) or die(mysql_error());

			//Connect to DB
			$dbconnect = mysql_select_db(DATABSE) or die(mysql_error()) or die(mysql_error());

			return $connection;
		}

		function close()
		{
			mysql_close();
		}
	}


?>