<?php
require "Person.php";

//Instantiate Person class. Create an object

$person = new Person("Luca", 33);

var_dump($person);

echo "Name " . $person->getName(). " , Age: " . $person->getAge();


?>