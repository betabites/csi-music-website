<?php
// This PHP file will return data about playlists

// Parameters;
// playlist_type - A number representing the type of playlist the user wants to search for
        // 0 - Artists
        // 1 - Albumn
        // 2 - Genre
        // 3 - Public Playlist
        // 4 - Private Playlist
        // undefined - Everything

$data = [];
if (! isset($_GET["playlist_type"])) {
    die("playlist_type must be set");
}

require("../api/connect.php");
if ($_GET["playlist_type"] == 0) {
    // Get Artists
    $sql = "SELECT COUNT(`artists`.`artist_id`) AS 'count', SUM(`tracks`.`duration`) AS 'duration', `artists`.* FROM `artists`
JOIN `track_to_artist` ON `artists`.`artist_id` = `track_to_artist`.`artist_id`
JOIN `tracks` ON `tracks`.`track_id` = `track_to_artist`.`track_id`
WHERE 1
GROUP BY `artists`.`artist_id`
ORDER BY `artist_name` ASC";

    foreach ($conn->query($sql) as $result) {
        array_push($data, $result);
    }
} elseif ($_GET["playlist_type"] == 1) {
    // Get Albumns
    $sql = "SELECT COUNT(`playlists`.`playlist_id`) AS 'count', SUM(`tracks`.`duration`) AS 'duration', `playlists`.* FROM `playlists`
JOIN `track_to_playlist` ON `playlists`.`playlist_id` = `track_to_playlist`.`playlist_id`
JOIN `tracks` ON `tracks`.`track_id` = `track_to_playlist`.`track_id`
WHERE `type` = 1
GROUP BY `playlists`.`playlist_id`
ORDER BY `title` ASC";

    foreach ($conn->query($sql) as $result) {
        array_push($data, $result);
    }
} elseif ($_GET["playlist_type"] == 2) {
    // Get Albums
    $sql = "SELECT COUNT(`playlists`.`playlist_id`) AS 'count', SUM(`tracks`.`duration`) AS 'duration', `playlists`.* FROM `playlists`
JOIN `track_to_playlist` ON `playlists`.`playlist_id` = `track_to_playlist`.`playlist_id`
JOIN `tracks` ON `tracks`.`track_id` = `track_to_playlist`.`track_id`
WHERE `type` = 2
GROUP BY `playlists`.`playlist_id`
ORDER BY `title` ASC";

    foreach ($conn->query($sql) as $result) {
        array_push($data, $result);
    }
}

echo json_encode($data);