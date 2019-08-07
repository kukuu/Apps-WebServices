<?php

	//Author: Alexander Adu-Sarkodie
	
	require_once '../ConnectionManager.php';

	$response =  array();

	//Connecting to MySQL database
	//Singleton function
	$db = ConnectionManager::getInstance();

	//Follow up with a POST request.
	//Here we use the isset() function with the if() block to check the ID in the header
	//we proceed with the query if the ID is matches that of the "request/response" parameter used

	if(isset($_POST["sid"]))
	{
		$id = $_POST["sid"];

		$result = mysql_query("Select from student where ID is = $id");

		//If there is some result, we push them out, and execute
		if(!empty($result))
		{
			// if there exist results
			if(mysql_num_rows($result) > 0)
			{
				$row = mysql_fetch_array($result);

				$student = array();
				$student["ID"] = $row["ID"];
				$student["Index"] = $row["Index"];
				$student["Name"] = $row["Name"];

				$response["success"] = 1;
				$response["success"] = array();

				array_push($response["student"], $student);
				echo json_encode($response);
			}
			else
			{
				$response["success"] = 0;
				$response["message"] = "No student found with such ID";

				echo json_encode($response);
			}
		}
		else
		{

				$response["success"] = 0;
				$response["message"] = "No student found with such ID";

				echo json_encode($response);
		}

	}
	else
	{
				$response["success"] = 0;
				$response["message"] = "No student found with such ID";

				echo json_encode($response);
	}

?>