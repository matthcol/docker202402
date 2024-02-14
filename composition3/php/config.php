<?php
// Basic connection settings
$databaseHost = 'db';
$databaseUsername = 'mountain';
$databasePassword = 'password';
$databaseName = 'dbmountain';

// Connect to the database
$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
?>