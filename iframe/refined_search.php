<?php
// $_GET["refined_type"] must be set
// When 1; Albumns
// When 2; Genres
// When 3; Playlists (including personal playlists)
// When 4; Personal playlsits
// When 5; Tracks

require "../api/connect.php";

if (!isset($_GET["refined_type"])) {
    die("Parameter 'refined_type' must be set");
}
?>

<!DOCTYPE html>

<html>
<head>
    <script src="../assets/js/api.js" type="application/javascript"></script>
    <script>
        let api

        const onload = () => {
            api = new iframe_class()
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/styles.css"/>
</head>
<body onload="onload()">

<?php
if ($_GET["refined_type"] == 1) {
    // Albumns
    ?>
    <div class="wrapper">
        <div class="sideways_slider_wrapper">
            <h1>Showing all albumns</h1>
            <div class="sideways_slider">
                <div style="overflow: unset; height: unset; display: unset;" class="sideways_slider_content">
                    <?php
                    $sql = "SELECT `playlists`.*, COUNT(`tracks`.`track_id`) AS 'track_count' FROM `playlists` JOIN `track_to_playlist` ON `track_to_playlist`.`playlist_id` = `playlists`.`playlist_id` JOIN `tracks` ON `tracks`.`track_id` = `track_to_playlist`.`track_id` WHERE `type` = 1 GROUP BY `playlist_id` ORDER BY `playlists`.`title`";
                    foreach($conn->query($sql) as $albumn) {
                        ?>
                        <div class="sideways_slider_item">
                            <div class="sideways_slider_icon play_animate" onclick="api.play_playlist(<?php echo $albumn["playlist_id"].",'".$albumn["title"]; ?>')">
                                <img class="play_track_button" src="../assets/icons/play.svg"/>
                            </div>
                            <div class="playlist_title" onclick="api.send_iframe_to_page('iframe/playlist.php?playlist_id=<?php echo $albumn["playlist_id"];?>')">
                                <?php echo $albumn["title"]; ?><br>
                                <i> <?php echo $albumn["track_count"]; ?> tracks</i>
                            </div>
                        </div>
                        <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
    <?php
}
?>
</html>