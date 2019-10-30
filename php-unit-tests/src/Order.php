
<<?php 

 /*
	* Order
	*
	* Order Class

 **/

 class Order
 {
 	
 	/**
	 		* 
	 		* Amount
	 		*@var int 
		*/


	public $amount = 0;

			/**
		 		* 
		 		*  payment gateway dependency
		 		*@var PaymentGateway 
			*/
	 
	 protected $gateway;

		 	/**
		 		* 
		 		*  Constructor
		 		*@return void 
			*/
	 		public function construct(PaymentGateway $gateway)
	 		{

	 			$this->gateway = $gateway;
	 		}


	 		/**
		 		* 
		 		*  Process the order
		 		*@return boolean
			*/

		 	public function process()
		 	{
		 		return $this->gateway->charge($this->amount);
		 	}
 	
 }