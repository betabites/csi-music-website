<?php
require "../api/connect.php";
?>

<!DOCTYPE html>

<html>
<head>
    <script src="../assets/js/api.js" type="application/javascript"></script>
    <script>
        let api

        const onload = () => {
            api = new iframe_class()
            api.set_page_name("Home")
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/styles.css"/>
</head>
<body onload="onload()">
<div class="page_header">
    <div class="page_header_albumn_cover">
        <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
    </div>
    <h1>Welcome to ????????</h1><br>
    <h3>There are XX tracks on this database</h3>
</div>

<div class="wrapper">
    <div class="sideways_slider_wrapper">
        <h1>Albumns</h1>
        <div class="sideways_slider">
            <div class="sideways_slider_content">
                <?php
                $sql = "SELECT `playlists`.*, COUNT(`tracks`.`track_id`) AS 'track_count' FROM `playlists` JOIN `track_to_playlist` ON `track_to_playlist`.`playlist_id` = `playlists`.`playlist_id` JOIN `tracks` ON `tracks`.`track_id` = `track_to_playlist`.`track_id` WHERE `type` = 1 GROUP BY `playlist_id` ORDER BY RAND() LIMIT 5";
                foreach($conn->query($sql) as $albumn) {
                    ?><div class="sideways_slider_item">
                    <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')" onclick="api.play_playlist(<?php echo $albumn["playlist_id"].",'".$albumn["title"]; ?>')">
                        <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                    </div>
                    <div class="playlist_title" onclick="api.send_iframe_to_page('iframe/playlist.php?playlist_id=<?php echo $albumn["playlist_id"]; ?>')">
                        <?php echo $albumn["title"]; ?><br>
                        <i><?php echo $albumn["track_count"]; ?> tracks</i>
                    </div>
                </div><?php
                }
                ?>
                <div class="sideways_slider_more sideways_slider_item">
                    <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')" onclick="window.location.href = 'refined_search.php?refined_type=1'">
                        +
                    </div>
                    Show all<br>
                </div>
            </div>
        </div>
    </div>

    <div class="playlist_cards_wrapper">
        <h1>My Playlists</h1>
        <div class="playlists_cards_grid">
            <div class="playlist_card">
                <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                    <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                </div>
                <div class="playlist_text">
                    <strong>Playlist title</strong><br>
                    <i>15 tracks</i>
                </div>
            </div>
            <div class="playlist_card">
                <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                    <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                </div>
                <div class="playlist_text">
                    <strong>Playlist title</strong><br>
                    <i>15 tracks</i>
                </div>
            </div>
            <div class="playlist_card">
                <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                    <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                </div>
                <div class="playlist_text">
                    <strong>Playlist title</strong><br>
                    <i>15 tracks</i>
                </div>
            </div>
            <div class="playlist_card">
                <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                    <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                </div>
                <div class="playlist_text">
                    <strong>Playlist title</strong><br>
                    <i>15 tracks</i>
                </div>
            </div>
            <div class="playlist_card">
                <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                    <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                </div>
                <div class="playlist_text">
                    <strong>Playlist title</strong><br>
                    <i>15 tracks</i>
                </div>
            </div>
            <div class="playlist_card">
                <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                    <img class="play_track_button play_animate" src="../assets/icons/play.svg"/>
                </div>
                <div class="playlist_text">
                    <strong>Playlist title</strong><br>
                    <i>15 tracks</i>
                </div>
            </div>
        </div>
    </div>
    <audio src="../test.mp3">
    </audio>
</div>
</body>
</html>