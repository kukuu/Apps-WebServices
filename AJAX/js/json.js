
//Simple Object

var myCat = {
	"name":"Meaosalot",
	"species":"cat",
	"favfood":"tuna"

}

//Acessing an Object
// to access favfood
myCat.favfood;
// to access nmae
myCat.name;


//2. Acessing simple Array
var myFavColors = ["blue","green","purple"];
//Acessing list in an array using indexes. Zero based
myFavColors[1];//gives green

//3 Using Array of Objects
//Single variable hosts the lists of objects
var thePets = [
	{
		"name":"Meaosalot",
		"species":"cat",
		"favfood":"tuna"
	},
	{
	"name":"Mot",
	"species":"dog",
	"favfood":"bones"

	},
		{
		"name":"Tot",
		"species":"Parrot",
		"favfood":"carrot"

	}
	//no comma after last object
]
//Accessing second objec and third item
thePets[1].favfood;// returns carrot

