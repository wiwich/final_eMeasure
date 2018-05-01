<?php
	$dateData = $_REQUEST['dateData'];

	$myfile = fopen("newfile.txt", "a") or die("Unable to open file!");
	$txt = $dateData . "\n";
	fwrite($myfile, $txt);
	fclose($myfile);
?>