$(document).ready(function() {
    $("#Menu").hide();
//	$("#botao").addClass("closed");  
	
	$("#botao").click(function(){
		if($("#botao").hasClass("closed"))
		{
		  $("#Menu").slideDown();
		  $("#botao").attr("src", "/images/menu/top_loginbar_abaup.png");
		  $("#botao").removeClass("closed");
		  $("#botao").addClass("open");
		}
		else
		{
			$("#Menu").slideUp();
		  	$("#botao").attr("src", "/images/menu/top_loginbar_abadown.png");
			$("#botao").removeClass("open");
		  	$("#botao").addClass("closed");
		}
	});
	
	$("#Menu1").hide();
//	$("#botao").addClass("closed");  
	
	$("#botao1").click(function(){
		if($("#botao1").hasClass("closed"))
		{
		  $("#Menu1").slideDown();
		  $("#botao1").attr("src", "/images/menu/top_menu_abaup.png");
		  $("#botao1").removeClass("closed");
		  $("#botao1").addClass("open");
		}
		else
		{
			$("#Menu1").slideUp();
		  	$("#botao1").attr("src", "/images/menu/top_menu_abadown.png");
			$("#botao1").removeClass("open");
		  	$("#botao1").addClass("closed");
		}
	});
	
	 $(".p").mouseover(function() {
      	//alert("a");
	  	$(this).toggleClass("Product_on");
		//alert($(this > "#Buttons"));
		//alert($(this + " .Buttons").html());
    });
	
	$(".p").mouseout(function() {
      	//alert("a");
	  	$(this).toggleClass("Product_on");
		//$(this > ".Buttons").fadeOut("slow");
    });
	
	$("#tabs").tabs();
	
});

