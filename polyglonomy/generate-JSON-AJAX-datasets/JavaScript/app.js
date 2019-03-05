//app.js

var results = document.getElementById('results');
// Create an instance of the XMLHttp object
var r = new XMLHttpRequest();
// Value	State	Description
//0	UNSENT	Client has been created. open() not called yet.
//1	OPENED	open() has been called.
//2	HEADERS_RECEIVED	send() has been called, and headers and status are available.
//3	LOADING	Downloading; responseText holds partial data.
//4	DONE	The operation is complete.
r.open("GET", "http://www.filltext.com?rows=10&f={firstName}", true);
r.onreadystatechange = function () {
  //XMLHttp ready states 0 to 4
  if (r.readyState != 4 || r.status != 200) return;
  var data = JSON.parse(r.responseText);
  for (i=0;i<data.length;i++){
        results.innerHTML += '<li>'+data[i].f+'</li>'
  }
};
r.send();
