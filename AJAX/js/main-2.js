// Author: Alexander Adu-Sarkodie
//Web Browsers have a built in tool called XMLHttpRequest
//This tool communicates between the browser and the server, does the heavy lifting
//Allows you to send and receive data
//To use it you create an instance of it
//This script runs exactly when the page loads
//In our next exercise we will load the data by clicking the button. Adding an event to the button

var ourRequest = new XMLHttpRequest;
//We can GET data from the server or POST  data to it. In our case we ar getting
//we use the open() http method which accepts 2 arguments HTTP VERB  and URL to the resource.
ourRequest.open('GET','https://learnwebcode.github.io/json-example/animals-1.json'); 

//Now we have to fabricate the data. what should happen when data is loaded. we assign it to an annonymous
//function and process the data. For sake of best practices first console.log it
ourRequest.onload = function(){
	console.log(ourRequest.responseText);

	//we create a variable and store the response here
	//have to tell the browser to interprete the data as JSON data
	//using JSON.parse filter
	//Tell the browser not to interprete the data as a giant text string
	var ourData = JSON.parse(ourRequest.responseText);

	//task lets log out the first object set in the array

	console.log(ourData[0])
};

//Finally, we send the request
ourRequest.send();