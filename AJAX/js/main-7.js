// Author: Alexander Adu-Sarkodie
//Note: Refer to previous notes from main-1.js to main-5.js
//Next we control the number of data that can be loaded each time you click the button.
//Eventually we will terminate or hide the button when all our records are returned
//We resolve this with say a page counter:Paginating through data
//we manipulate the URL to the external data source with this variable. Making it dynamic
//we initially set to 1
// we replace the current 1 with the variable pageCounter
//next after we send the request we call the pageCounter. Inserting it after the send().
//see line 57
//Finally we disable the counter when maximum is reached.
//In our case we run a check to the counter when we get to the maximum and hide it
//See further below. After the pageCounter inside the event listener

var pageCounter = 1;

// Pointer to the container that will host the data fetched
var animalContainer = document.getElementById("animal-info");

// Pointer to the button that will fetch the data
var btn = document.getElementById("btn");

//Next we setup an even listener when the button get clicked together with a callback function
//These 2 arguments are passed to the event listener
//Inside it we paste the AJAX call we have deduced from main-1js and main-2.js
//The second argument is an anonymous function
//The console should be empty by default. When you click the button, you should now see the data in the console
btn.addEventListener("click",function(){

	var ourRequest = new XMLHttpRequest;
	//We can GET data from the server or POST  data to it. In our case we ar getting
	//we use the open() http method which accepts 2 arguments HTTP VERB  and URL to the resource.
	ourRequest.open('GET','https://learnwebcode.github.io/json-example/animals-' + pageCounter + '.json'); 

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

		//**************//
			// We bbuild a function to render the html and the data. This function is 
			//created outside the event listener and referenced here.
			//we pass the variable ourData as signature to the function
			renderHTML(ourData);
		//**************//

		//console.log(ourData[0])
	};
	//Finally, we send the request
	ourRequest.send();

	//Counter
	pageCounter++;

	// Disabling AJAX call after maximum request is reached
	//if pageCounter in our case is greater than 3 we add a css class that will add style property to hide it.
	if(pageCounter > 3){
		btn.classList.add("hide-me");
	}
})

//We construct function renderHTML
//in the signature of our function we use any arbitrary argument say data
// we create a pointer further above to the html div that will host the  rendered data
// animalContainer. See first statement  further above.
function renderHTML(data){
	//we target the insertion point of the data in the html page using the host
	//variable animalContainer. Using it as set point to 
	//traverse through the Object data model of the json object data
	//we use the "insertAdjacentHTML" DOM Method and add elements just before the end of this element "beforeend".
	//the next argument will be the dta to be inserted
	//animalContainer.insertAdjacentHTML("beforeend"," 1234");
	
	//let us create a variable  and store the data into it. Pointing to it from within our function
	//the purpose of this test data is to enable us create a loop over all our data set and return it
	// First we set htmlString to empty, and then tell the loop to add on to it each time it returns a 
	//record from the data set
	var htmlString = "";

	for(i = 0; i < data.length; i++){

		//each dimensional array will be associated with a for loop.
	//adding returned record to our pre-set empty string
		htmlString += "<p>" + data[i].name + " is a " + data[i].species + " that likes to eat ";

		// next, we will extract data from multi-dimensional array from an object
	// of this type:
	/*

	{
    "name": "Meowsy",
    "species" : "cat",
    "foods": {
      "likes": ["tuna", "catnip"],
      "dislikes": ["ham", "zucchini"]
    }
	*/
		//Next nested for loop, using ii instead

		for(ii = 0 ; ii < data[i].foods.likes.length ; ii++){
			htmlString += data[i].foods.likes[ii];
		}

		//Finally we seem to have a problem with spacing following
//evaluating the multidimensional array.
//we fix it be checking for the existence of a multi dimensional array
// and then introducing a blank white space before adding the additional data.
// We do this by wraping the final output statement in the nested for loop
//in an if statement.
		
		
		htmlString += '.</p>'
	}

	//We begin our loop of our Array of item objects
	animalContainer.insertAdjacentHTML("beforeend", htmlString);

}




