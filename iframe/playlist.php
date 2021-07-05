<?php
// URL Must contain the parameter playlist_id
if(! isset($_GET["playlist_id"])) {
    die("playlist_id parameter is required");
}

// Check that playlist id is a number
if (! preg_match("/^\d+$/",$_GET["playlist_id"])) {
    // The track_id string contains invalid characters
    http_response_code(500);
    die("{\"error\":1,\"message\":\"Invalid parameter\"}");
}

require "../api/connect.php";

// The following has been split into two SQL queries as a playlist may not always have tracks in it.
$get_tracks_sql = "SELECT * FROM `track_to_playlist` JOIN `tracks` ON `tracks`.`track_id` = `track_to_playlist`.`track_id` WHERE `track_to_playlist`.`playlist_id` = ".$_GET["playlist_id"];
$get_playlist_sql = "SELECT * FROM `playlists` WHERE `playlist_id` = ".$_GET["playlist_id"];

foreach ($conn->query($get_playlist_sql) as $data) {
    $playlist = $data;
}
?>

<!DOCTYPE html>

<html>
<head>
    <script src="../assets/js/api.js" type="application/javascript"></script>
    <script>
        let api = new iframe_class()

        const onload = () => {
            api.set_page_name("Playlists")
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/styles.css"/>
</head>
<body onload="onload()">
<div class="page_header">
    <div class="page_header_albumn_cover">
        <img class="play_track_button" src="../assets/icons/play.svg"/>
    </div>
    <h1 onclick="api.send_iframe_backwards()">Welcome to ????????</h1><br>
    <h3>There are XX tracks on this database</h3>
</div>

<div class="wrapper">
    <div class="playlist_item_list">
        <?php
        foreach ($conn->query($get_tracks_sql) as $track) {
            ?>
            <div class="playlist_item">
                <div class="playlist_item_icon">

                </div>
                <?php echo $track["title"]; ?>
            </div>
            <?php
        }
        ?>
    </div>
</div>
</body>
</html>