<?php
	
	session_start();

	$dateData = $_REQUEST['dateData'];

	$myfile = fopen($_SESSION['userID'].".txt", "a") or die("Unable to open file!");
	$txt = "," . $dateData . "\n";
	fwrite($myfile, $txt);
	fclose($myfile);
?>