
function getAllStudents()
{
	let formRequest = newFormData();
	// append to header
	formRequest.append('getStudent', 'getAllStudents');

	//Make an AJAX request
	let xhr = new XMLHttpRequest();
	xhr.addEventListener('load', uplodComplete, false);
	xhr.open('GET', '/StudentService/getAllStudents.php')
	xhr.send(formRequest);
}