
<?php 
	/**
	Author: Alexander Adu-SAarkodie
	Config file for  REST API with PHP7 and MySQL
	* 
	*/
	class Post
	{
		
		//DB Stuff

		private $conn;
		private $table = 'posts';

		//Post properties
		public $id;
		public $category_id;
		public $category_name;
		public $title;
		public $body;
		public $author;
		public $created_at;

		//Constructor with DB
		public function __construct($db){
			$this->conn = $db;
		}

		//Get Posts
		public function read(){
			//Create query associated with aliases
			$query =  'SELECT 
				c.name as category_name,
				p.id,
				p.category_id,
				p.title,
				p.body,
				p.autor,
				p.created_at,
				FROM
					' . $this->table . ' p 
				LEFT JOIN
					categories c ON p.category_id = c.id 
				ORDR BY 
				p.created_at DESC';

				//Prepare statement
				$stmt = $this->conn->prepare($query);

				//Execute query
				$stmt->execute();

				return $stmt;
		}
	}
