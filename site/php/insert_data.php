/* Simple script that handles our app interaction to the mySqldatabase.
 *
 *   Author: Daniel Richardson Uhack Team: Darcy World Domination.
 *   Date: 28th Aug 2016
 */
 
<?php
	include("./debug.php"); // helps me with debugging
	include('db_conn.php'); //handles connection to database
    
    /* Data pushed to script from app */
	$latitude = $_POST['latitude'];
	$longitude = $_POST['longitude'];
	$comments = $_POST['comments'];

    /* builds the query to send to the database */
	$query = "INSERT INTO `infomation` (`latitude`, `longitude`, `comments`)
                VALUES ('$latitude', '$longitude', '$comments')";
    
    /* query database and close the connection */
	$mysqli->query($query);
	$mysqli->close();	
?>
	