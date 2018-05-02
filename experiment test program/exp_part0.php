<?php
	session_start();

	//$_SESSION['name'] = 

	require_once"conn.php";

	if(isset($_REQUEST['firstname'])) {

		$sql = "INSERT INTO user 
				(user_name, user_surname, user_gender, user_birthday, user_nowValence, user_nowArousal) 
				VALUES 
				('".$_REQUEST['firstname']."', '".$_REQUEST['lastname']."', '".$_REQUEST['gender']."', '".$_REQUEST['dob']."','','')";

		//exit();
		$conn->query($sql) or die($conn->error);

		$_SESSION['userID'] = $conn->insert_id;


		echo "<script>window.location = 'exp_part1_1.php'</script>";

	}

	
?>
<html>
	<header>
		<title>Title</title>
		<meta name="viewport" content = "width=divice-width, initial-scale=1"> 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	</header>

	<body>
		<div style="margin-left:500px; margin-top:150px;">			
			<form action="" id="frmSave" method="post">
				<h2>Please enter user's information</h2>
				<br>
				<div style="margin-left:30px;">
					First name:&ensp;
					<input type="text" name="firstname">				
				</div>	
				<br>
				<div style="margin-left:30px;">
					Last name:&ensp;
					<input type="text" name="lastname">
				</div>	
				<br>
				<div style="margin-left:30px;">
					Gender:&ensp;
					<input type="radio" name="gender" value="1"> Male &emsp;&emsp;
					<input type="radio" name="gender" value="2"> Female
				</div>
				<br>
				<div style="margin-left:30px;">
					Birthday:&ensp;
					<input type="date" name="dob">
				</div>
				<br><br>
				<div style="margin-left:150px;">
					<input type="submit" id="btnNext" name="btnNext" value="Next">
				</div>
				
			</form>
		</div>
		
	</body>

</html>

<script>
	/*
	$("#btnNext").click(function(){
		$('#frmSave').submit();
	})
	*/
</script>