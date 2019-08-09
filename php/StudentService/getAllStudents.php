
<?php

	//Author: Alexander Adu-Sarkodie
	
	require_once '../ConnectionManager.php';

	$response =  array();//initialise result. Array type

	//Connecting to MySQL database
	//Singleton function
	$db = ConnectionManager::getInstance();

	$result = mysql_query("Select from Student") or die(mysql_error());

	if(mysql_num_rows($result) > 0) 
	{
		$response['student'] = array(); //populate arrary from $response = array() to $response['student']= array()

		while($row = mysql_fetch_array($result))
		{
			$student = array();
			$student["ID"] = $row["ID"];
			$student["Index"] = $row["Index"];
			$student["Name"] = $row["Name"];

			array_push($response["student"], $student)	
		}

		$response["success"] = 1;

		//send back JSON response
		echo json_encode(($response));
	}

	else
	{
		$response["success"] = 0;
		$response["message"] = "No student found!";

		echo json_encode($response);
	}
?>
