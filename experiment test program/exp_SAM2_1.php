<?php
	session_start();

	if(isset($_REQUEST['chkData'])) {

		require_once "conn.php";
		//estimation
		//user_id,vdo_id,est_arousal,est_valence
		$sql = "INSERT INTO estimation 
				(user_id,vdo_id,est_arousal,est_valence)
				VALUES
				('".$_SESSION['userID']."','2','".$_REQUEST['arousal']."','".$_REQUEST['valence']."')";
		$conn->query($sql) or die($conn->error);


		echo "<script>window.location = 'exp_part2_2.php'</script>";
		exit();

	}
?>
<html>
<style>
	body{ <!--background-color: #000000;-->	}
</style>
<script type="text/javascript">
  var count = 10; // Timer
  var redirect = "exp_part2_2.php"; // Target URL

  function countDown() {
    var timer = document.getElementById("timer"); // Timer ID
    if (count > 0) {
      count--;
      timer.innerHTML = "This page will redirect in " + count + " seconds."; // Timer Message
      setTimeout("countDown()", 1000);
    } else {
      //window.location.href = redirect;
      $('#frmSave').submit();
    }
  }
</script>
<header>
	<title>Title</title>
	<meta name="viewport" content = "width=divice-width, initial-scale=1"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</header>

<body>
	<form id="frmSave" action="" method="post"> 
		<div class="wrap" style="text-align:center; margin-top:20px;">
			Valence (negative-positive)
			<div class="row" name"valence" style="margin-top:20px; margin-left:70px;">
				<div class="col-sm-2">
					<img src="image/valence_1.jpg">
					<br>
					<input type="radio" name="valence" value="1">
				</div>
				<div class="col-sm-2">
					<img src="image/valence_3.jpg">
					<br>
					<input type="radio" name="valence" value="3">
				</div>
				<div class="col-sm-2">
					<img src="image/valence_5.jpg">
					<br>
					<input type="radio" name="valence" value="5">
				</div>
				<div class="col-sm-2">
					<img src="image/valence_7.jpg">
					<br>
					<input type="radio" name="valence" value="7">
				</div>
				<div class="col-sm-2">
					<img src="image/valence_9.jpg">
					<br>
					<input type="radio" name="valence" value="9">
				</div>
			</div>
		</div>
		
		<div class="wrap" style="text-align:center; margin-top:20px;">
			Arousal (quite-active)
			<div class="row" name="arosal" style="margin-top:20px; margin-left:70px;">
				<div class="col-sm-2">
					<img src="image/arousal_1.jpg">
					<br>
					<input type="radio" name="arousal" value="1">
				</div>
				<div class="col-sm-2">
					<img src="image/arousal_3.jpg">
					<br>
					<input type="radio" name="arousal" value="3">
				</div>
				<div class="col-sm-2">
					<img src="image/arousal_5.jpg">
					<br>
					<input type="radio" name="arousal" value="5">
				</div>
				<div class="col-sm-2">
					<img src="image/arousal_7.jpg">
					<br>
					<input type="radio" name="arousal" value="7">
				</div>
				<div class="col-sm-2">
					<img src="image/arousal_9.jpg">
					<br>
					<input type="radio" name="arousal" value="9">
				</div>
			</div>
		</div>
		

		<div class="row" name="nextPage" style="text-align: center; margin-top: 100px;">
			<p id="timer">
				<script type="text/javascript">
					countDown();
				</script>
			</p>
			<!-- <button type="button"><a href="exp_part2_1.php">Next</button> -->
		</div>	
		<input type="hidden" name="chkData" value="yes">		
	</form>
</body>
</html>
