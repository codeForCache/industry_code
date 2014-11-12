$(document).ready(function(){

	// show hide top user panel
	$("#control").click(function(){
	  $("#control_panel").toggleClass("show");
	});
	$("#control_panel>li:nth-child(4)>a").click(function(e){
		e.preventDefault();
	  $("#control_panel").toggleClass("show");
	});		

	// show hide main navigation links

	$("body, html").on("click",function(e){
		if($(".navigation").find(e.target).length == 0){
			$(".navigation>ul ul").removeClass("show");
		}	
	});


	$(".navigation>ul>li>a").click(function(){
	 	if ($(".navigation>ul ul").hasClass("show")) {
	 		$(".navigation>ul ul").removeClass("show");
	 		// $(this).next().toggleClass("show");
	 	} 	
	 	$(this).next().toggleClass("show");		 	 		 	
	});
	
	

	// show hide panels concerning unit id 
	$(".unit_id").click(function(){
	 	$(".unit_container").toggleClass("show");
	 	$(".edit_unit").toggleClass("show");
	 	$(".tenant_container").toggleClass("show");
	 	$(".tenant_control").toggleClass("show");

	 	$(".work_orders").toggleClass("show");
	 	$(".wo_control").toggleClass("show");
	});

	// work order chat
	$("#tap_here").click(function(){
	 	$("#reply_form").toggleClass("hidden");	 	
	});

	//create wo panels
	$(".unit_id").click(function(){
	 	$(".reply_container").toggleClass("show");	 	
	});


   

});
