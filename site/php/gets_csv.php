<?php
    include("./db_conn.php");
    include("./debug.php");
    
	$fullNameOfFIle='exported.csv';
	$openType='w';
	
	$query = "SELECT * FROM `infomation`";
	
	$results = $mysqli->query($query);

	$fp = fopen($fullNameOfFIle,$openType);

	function exportList($csv,$L) {
		foreach ($L as $records) {
				fputcsv($csv, $records);
		}
		fclose($csv);
	}

exportList($fp, $results);

$url = "./$fullNameOfFIle";
header("Location: $url");
?>