
$(function({

	//cache all fields
	var $orders = $('#orders');// <ul id="orders" /> Cache it and re-use it DRY
	var $name = $('#name');
	var $drink = $('#drink')

	//build a template to  scale increasing html code
	var orderTemplate = ""  + 
	"<li>" +  
	"<p>Name: {{}}    Drink: {{}} </P>" + 
	"<button data-id='{{id}}' class='remove'> X </button>" + 
	"</li>"


	function addOrder(order){
		//$orders.append("<li> name " + newOrder.name + "" + "drink :" + newOrder.drink +  "</li>")
		$orders.append(Mustache.render(orderTemplate, order))
	}


	$.ajax({
		type: "GET",
		url: '/api/orders',
		success: function(orders){
			//console.log( "success", data);
			$.each(orders, function( i, order){
				//$orders.append("<li> name " + newOrder.name + "" + "drink :" + newOrder.drink +  "</li>")
				addOrder(order);
			})
		},
		error: function(){
			alert("error loading orders");
		}
	})

	//adding an order <button id="#add-order" />
	$(#add-order).on("click", function(){

		//build our object to send
		var order = {
			name: $name.val(),
			drink: $drink.val()
		}

		//ajax call

		$.ajax({
			type: "POST",
			url: "/api/orders"
			data: order,
			success: function(newOrder){
				addOrder(newOrder);
			},
			error: function(){
				alert("error saving order...")
			}

		})
	})

	//Note without deleagating the remove function to the parent (#orders - which is cached as $orders) the application will not work
	//because of the non-blocking asynchronous pattern which firest up all the functions in the code without waiting.

	//When the remove function is fired nothing has been added to the remove function as all the functions are
	// fired upand waiting intothe future(problem with asynchronous non blocking events)

	//We rewrite the remove function.
	//('.remove').on("click", function(){
	$orders.delegate("remove", "click", function(){

		//find closest li element up the chain to delete
		var $li = $(this).closest('li');

		$.ajax({
			type: DELETE,
			url: "/api/orders/" + $(this).attr("data-id"),
			success: function(){
				$li.faadeout(300, function(){
					$(this).remove();
				});
			} 

		})
	})
}))