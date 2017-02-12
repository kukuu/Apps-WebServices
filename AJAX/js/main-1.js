// Author: Alexander Adu-Sarkodie
//Web Browsers have a built in tool called XMLHttpRequest
//This tool communicates between the browser and the server, does the heavy lifting
//Allows you to send and receive data
//To use it you create an instance of it

var ourRequest = new XMLHttpRequest;
//We can GET data from the server or POST  data to it. In our case we ar getting
//we use the open() http method which accepts 2 arguments HTTP VERB  and URL to the resource.
ourRequest.open('GET','https://learnwebcode.github.io/json-example/animals-1.json'); 

//Now we have to fabricate the data. what should happen when data is loaded. we assign it to an annonymous
//function and process the data. For sake of best practices first console.log it
ourRequest.onload = function(){
	console.log(ourRequest.responseText);
};

//Finally, we send the request

ourRequest.send();