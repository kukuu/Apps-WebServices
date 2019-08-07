<?php

/**
Person class
* 
*/
class Person
{
	private $Name;
	private $Age;

	public function setName($name)
	{
		$this->Name = $name;
		return $this;
	}

	public function setAge($age)
	{
		$this->Age =  $age;
		return $this;
	}

	public function getName()
	{
		return $this->Name
	}

	public function getAge()
	{
		return $this->Age
	}

	function __construct(argument)
	{
		# code...
	}
}