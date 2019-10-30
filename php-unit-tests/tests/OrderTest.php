<?php  

use PHPUnit\Framework\TestcASE;

/**
* 
*/
class Order extends TestCase
{
	public function testOrderIsProcessed()
	{
		// Payment is a class not available yet. Being stubbed. Can only be a string // as  it does not exist
		$gateway = $this->getMockBuilder('PaymentGateway')
					->setMethods(['charge'])// Explicitly have to set method as the class does not exist
					->getMock();

		//Running assertion
		$gateway->expects($this->once())
				->method('charge')
				->with($this->equalTo(200))
				->willReturn(true);

		//We instantiate an order
		$order = new Order($gateway);

		$order->anount = 200;

		//Inject order into process()
		$this->assertTrue($order->process());
	}


	// function __construct(argument)
	// {
	// 	# code...
	// }
}