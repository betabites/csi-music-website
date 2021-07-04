<?php
// This PHP file is requested whenever the website needs to search tracks, and/or load information about them

// The following GET parameters can be applied;
// track_id - The ID of the track
// playlist_id - The ID of the playlist.
// name - The name of the track

// order - 0 is ascending based on name, 1 is descending

// Results will be returned in array form, as multiple tracks may fit the filter.
require "connect.php";

// Be sure that the client knows the response is in JSON format
header('Content-Type: application/json');

$rows = [];
$sql = "SELECT * FROM `tracks` ";
if (isset($_GET["track_id"])) {
    // Validate the track id parameter
    if (preg_match("/^\d+$/",$_GET["track_id"])) {
        $sql = "SELECT * FROM `tracks`";
    } else {
        // The track_id string contains invalid characters
        http_response_code(500);
        die("{\"error\":1,\"message\":\"Invalid parameter\"}");
    }
} elseif (isset($_GET["playlist_id"]) and isset($_GET["name"])) {
    $query = "SELECT * FROM `tracks`";
} elseif (isset($_GET["playlist_id"])) {
    $sql = "SELECT * FROM `tracks`";
} elseif (isset($_GET["name"])) {
    $sql = "SELECT * FROM `tracks`";
} else {
    http_response_code(500);
    die("{\"error\":2,\"message\":\"No parameters provided\"}");
}

if (isset($_GET["order"])) {
    if ($_GET["order"] == "0") {
        $sql .= " ORDER BY `title` ASC";
    } elseif ($_GET["order"] == "1") {
        $sql .= " ORDER BY `title` DESC";
    }
}

foreach ($conn->query($sql) as $row) {
    array_push($rows, $row);
}

echo json_encode(array(
    "error" => 0,
    "data" => $rows
));