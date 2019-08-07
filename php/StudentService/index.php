<?php
require "Person.php";

//Instantiate Person class. Create an object

$person = new Person("Luca", 33);

echo "Name " . $person->getName(). " , Age: " . $person->getAge();


?>