<?php 

	/**
	Author: Alexander Adu-Sarkodie
	Config file for  REST API with PHP7 and MySQL
	* 
	*/
	
	//Set Headers for security and protocol compatibility
	header('Access-Control-Allow-Origin: *');//Set for public access [*]
	header ('Content-Type: application/json')//Data format expected by client


	//Best pracrices to avoid redundancies
	include_once '../../config/Database.php';
	include_once '../../models/Post.php';

	//Instantitiate DB and connect. Cache !
	$database = new Database(); // Create an object from the blue print class Database.php
	$db = $database->connect(); //Create a connection object

	//Instantiate blog post object. Cache!
	$post = new Post($db);


	//Attacch request to PDO api methods :read(), rowCounct()
	//Blog post query
	$result = $post->read();
	//Get row Counts
	$num = $result->rowCounct();

	//Processing nodes for posts. Note we hit the array data for values directly, in case we want to extend and add refinement like pagination.
	//Check if any posts
	//Make call to DB and fetch
	if( num > 0 ){
		$posts_arr = array();
		$posts_arr['data'] =  arra();

		while( $row = $result->fetch()) {

			//Destructuring with extract()
			extract(row);

			//catch request params into an array and cache
			//returning params
			$post_item = array(
				'id' => $id,
				'title' => $title,
				'body' => $html_entity_decode($body),
				'author' => $author,
				'category_id' => $category_id,
				'category_name' => $category_name //from join table
			);

			//push to 'data' as php array
			array_push($post_att['data']. $post_item);
		}

		//Turn to JSON & output
		echo json_encode($posts_arr);

	} else {
		//No Posts
		echo json_encode(
				array('message' => 'No Posts Found')
		);
	}




