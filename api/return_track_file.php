<?php
// Parameter 'track_id' is required
header("Content-Type: audio/mp3");
header('Content-Disposition: inline;filename="test.mp3"');

// Parameter must contain $_GET["track_id"];
require("connect.php");
$results = $conn->query("SELECT `filename` FROM `tracks` WHERE `track_id` = ".$_GET["track_id"]." LIMIT 1");

foreach ($results as $result) {
    // Although this will only run once, it means that the found row in the database will be put into $result
    if (file_exists("../media/" . $result["filename"])) {
        readfile(("../media/" . $result["filename"]));
    } else {
        readfile("../media/test.mp3");
    }
}

