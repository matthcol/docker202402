<?php
// Include the database connection file
include_once("config.php");
// Fetch contacts (in descending order)
$result = mysqli_query($mysqli, "SELECT * FROM mountain");
printf("Select returned %d rows.\n", $result->num_rows);
?>