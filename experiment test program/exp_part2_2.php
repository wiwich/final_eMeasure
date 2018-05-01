<html>
<style>
	body{
		<!--background-color: #000000;-->
	}
</style>
<header>
	<title>Title</title>
	<meta name="viewport" content = "width=divice-width, initial-scale=1"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</header>
<style>
	.mySlide {display:none;}
</style>
<body onLoad = "initClock()">

	
	<img id="pressImg" src=" image/pressSpacebar.jpg">

	<div class="w3-content w3-section">		
		<img class="mySlide" src="image/wait.jpg">
		<img class="mySlide" src="image/img_3.jpg">
		<img class="mySlide" src="image/img_2.jpg">
		<img class="mySlide" src="image/img_1.jpg">
		<video id="myVideo" class="mySlide">
			<source src="image/part2_eyeOperation.mp4" type="video/mp4">
		</video>	
	</div>
	<div id="dateRun" style="display: none;"></div>
</body>
</html>


<script>
		var myIndex = 0;
		function carousel(){
			var i;
			var x = document.getElementsByClassName("mySlide");
			for (i=0; i<x.length; i++){
				x[i].style.display = "none";
			}
			if(myIndex<=x.length){myIndex++;}
			//else if(myIndex>x.length){	}
			
			x[myIndex-1].style.display = "block";

			if(myIndex==x.length) {
				document.getElementById('myVideo').play();
				document.getElementById('myVideo').addEventListener('ended', myHandler,false);
				function myHandler(e){
					window.location = 'exp_SAM2_2.php';
				}
			} else if(myIndex==1){
				setTimeout(carousel,2000)
			}else {

				setTimeout(carousel, 1000); //change image every 1 seconds
			}

			
		}
	</script>	

	<script>
	//Start Clock Script
		Number.prototype.pad = function(n){
			for(var r = this.toString(); r.length<n; r=0+r);
			return r;
		};

		function updateClock(){
			var now = new Date();
			var milli = now.getMilliseconds(),
				sec = now.getSeconds(),
				min = now.getMinutes(),
				hou = now.getHours(),
				mo = now.getMonth(),
				day = now.getDate(),
				year = now.getFullYear();
			var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September","October", "November","December"];
			var tags = ["mm", "dd", "yy", "hh", "mm","ss","ms"],
			corr = [months[mo],day,year,hou.pad(2), min.pad(2),sec.pad(2),milli];
			tmp = "";

			for(var i=0; i<tags.length;i++)
				tmp+=corr[i]+" ";

			document.getElementById('dateRun').innerHTML = tmp;

		}

		function initClock(){
			updateClock();
			window.setInterval("updateClock()",1);
		}

		var space = false;
		$(function(){
			$(document).keyup(function(e){
				if(e.keyCode == 32) space =false;
			}).keydown(function(e){
				if(e.keyCode == 32){
					$("#pressImg").hide();
					space=true;
					carousel();
					content = document.getElementById('dateRun').innerHTML
					$.ajax({
						method: "POST",
						url: "date.php",
						data:{dateData: content}
					})
					.done(function(msg){
						//alert("Data Saved: "+msg);
					});

				}
			});
		});



	</script>