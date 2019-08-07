<?php
require "Person.php";

//Instantiate Person class

$person = new Person("Luca", 33);

echo "Name " . $person->getName(). " , Age: " . $person->getAge();


?>