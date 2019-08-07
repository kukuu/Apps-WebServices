	
//Author: Alexander Adu-Sarkodie

function GetAllStudents()
{
	let formRequest = newFormData();
	// append to header
	formRequest.append('getStudent', 'getAllStudents');

	//Make an AJAX request
	let xhr = new XMLHttpRequest();
	xhr.addEventListener('load', uploadComplete, false);
	xhr.open('GET', '/StudentService/getAllStudents.php')
	xhr.send(formRequest);
}

//Make request for specific IDS

function GetStudentByID(id)
{
	let formRequest = new FormData();

	//attaching key/value to header for recognition
	newFormData.append('sid', id)

	//making AJAX request to DB
	let xhr = new XMLHttpRequest();
	xhr.addEventListener('load', uploadComplete, false);
	xhr.open('POST', 'StudentService/GetStudentByID.php');
	xhr.send(formRequest);
}

function uploadComplete(evt){
	console.log(evt.target.responeText);
}