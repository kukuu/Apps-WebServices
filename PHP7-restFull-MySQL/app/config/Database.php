<?php  
	
	/**
	Author: Alexander Adu-SAarkodie
	Config file for  REST API with PHP7 and MySQL
	* 
	*/


	class Database {
		
		/**
	*  Database params
	*/
		private $host = 'local';
		private $db_name 'myblog';
		private $username = 'root';
		private $password = '12345';
		private $conn;

		//DB Connect
		public function connect() {
			
			$this->conn = null;

			try {
				//Instantiate  a PDO connection object
				$this->conn = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->db_name, $this->username, $this->password);

				//Set error mode, and trigger exception
				$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			} catch(PDOException $e) {
				echo 'Connection Error: ' . $e->getMessage();			}

			return $this->conn;
		}
	}

