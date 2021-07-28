<?php
// Parameter 'track_id' is required
header("Content-Type: audio/mp3");
header('Content-Disposition: inline;filename="test.mp3"');

// Parameter must contain $_GET["track_id"];
require("connect.php");
$sql = $conn->query("SELECT `filename` FROM `tracks` WHERE `track_id` = ".$_GET["track_id"]." LIMIT 1");
if (file_exists("../test2.mp3")) {
    readfile("../test.mp3");
} else {
    readfile("../test.mp3");
}

