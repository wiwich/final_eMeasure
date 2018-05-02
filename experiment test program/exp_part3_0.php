<html>
	<header>
		<title>Title</title>
		<meta name="viewport" content = "width=divice-width, initial-scale=1"> 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</header>
	<body>
		<div class="row" style="text-align:center; margin-top:50px;"><font size="12">Please choose 2 movie</font></div>
		<form action="exp_part3_1.php" id="frmSave">
			<div class="row" style="margin-top:50px;">
				<div class="col-sm-4" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trail3-1_lightOut.mp4" type="video/mp4"></video>
					<br>
					3-1: Light Out
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="5">
				</div>
				<div class="col-sm-4" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trial3-2_The Black Hole.mp4" type="video/mp4"></video>
					<br>
					3-2: The Black Hole
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="7">
				</div>
				<div class="col-sm-4" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trial3-3_The Rediscovery.mp4" type="video/mp4"></video>
					<br>
					3-3: The Rediscovery
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="6">
				</div>				
			</div>
			<div class="row" style="margin-top:200px;">
				<div class="col-sm-3" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trial3-4_Assassinate Lord Regent.mp4" type="video/mp4"></video>
					<br>
					3-4: Assassinate Lord Regent
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="8">
				</div>
				<div class="col-sm-3" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trial3-5_ICELAND travel.mp4" type="video/mp4"></video>
					<br>
					3-5: Travel to Iceland
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="9">
				</div>
				<div class="col-sm-3" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trial3-6_footballShot.mp4" type="video/mp4"></video>
					<br>
					3-6: Top 10 nice shot
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="10">
				</div>
				<div class="col-sm-3" style="text-align:center; ">
					<video id="myVideo" width="250px" controls autoplay loop muted><source src="image/trial3-7_UIoGadget.mp4" type="video/mp4"></video>
					<br>
					3-7: UI o Gadget
					<br> <input class="single-checkbox" type="checkbox" name="movie[]" value="11">
				</div>
			</div>
			<div class="row"  style="margin:100px;">
				<div class="col-sm-12" style="text-align:center; ">
					<input type="button" id="btnNext" value="NEXT">
				</div>
			</div>
		</form>
	</body>
</html>
<script>
var limit = 3;

//$('#btnNext').prop('disabled', true);

$('input.single-checkbox').on('change', function(evt) {
	//alert($("input[name='movie']:checked").length);

   if($("input[name='movie[]']:checked").length >= limit) {
		this.checked = false;
   } 

});


$( "#btnNext" ).click(function() {
   if($("input[name='movie[]']:checked").length >= (limit-1)) {
		//$('#btnNext').prop('disabled', false);

		/*
		alert($("#frmSave").serialize());
		$.ajax({
			method: "POST",
			url: "saveChooseMovies.php",
			dataType: "html",
			data: $("#frmSave").serialize()
			
		})
		.done(function(msg){
			alert(msg);
			//alert("Data Saved: "+msg);
		});
		*/
		$('#frmSave').submit();
   } else {
   		alert("please choose 2 movies");
   		//$('#btnNext').prop('disabled', true);
   }
});

</script>