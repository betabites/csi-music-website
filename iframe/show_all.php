<?php
require "../api/connect.php";

$genre_sort = $conn->query("SELECT `tracks`.`track_id`,`tracks`.`title`,`duration`,`playlists`.`playlist_id`,`playlists`.`type`,`playlists`.`title` AS 'playlist_title', `artist_name` FROM `tracks` 
JOIN `track_to_playlist` ON `tracks`.`track_id` = `track_to_playlist`.`track_id`
JOIN `playlists` ON `playlists`.`playlist_id` = `track_to_playlist`.`playlist_id` AND `playlists`.`type` = 2

JOIN `track_to_artist` ON `tracks`.`track_id` = `track_to_artist`.`track_id`
JOIN `artists` ON `artists`.`artist_id` = `track_to_artist`.`artist_id`

WHERE 1
ORDER BY `playlists`.`title` ASC, `artists`.`artist_name` ASC");

$title_sort = $conn->query("SELECT `tracks`.`track_id`,`tracks`.`title`,`duration`,`artist_name` FROM `tracks` JOIN `track_to_artist` ON `tracks`.`track_id` = `track_to_artist`.`track_id` JOIN `artists` ON `artists`.`artist_id` = `track_to_artist`.`artist_id` WHERE 1 ORDER BY `tracks`.`title` ASC, `artists`.`artist_name` ASC ");
?>

<!DOCTYPE html>

<html>
<head>
    <script src="../assets/js/api.js" type="application/javascript"></script>
    <script>
        let api
        let playlist_type_el

        let genre_sort = <?php echo json_encode($genre_sort->fetchAll()); ?>;
        let title_sort = <?php echo json_encode($title_sort->fetchAll()); ?>;

        const updateResults = async () => {
            let duration = 0
            if (playlist_type_el.value === "Track name, then artist") {
                // Remove all currently showing items
                for (let child of document.getElementsByClassName("sideways_slider_content")[0].children) {
                    child.parentElement.removeChild(child)
                }

                let html = ""
                for (let item of title_sort) {
                    // Turn each item into an element
                    duration += parseInt(item["duration"])
                    html += '<div class="sideways_slider_item"><div class="sideways_slider_icon play_animate" onclick="api.play_playlist()"> <img class="play_track_button" src="../assets/icons/play.svg"/> </div> <div class="playlist_title" onclick="alert(\'Viewing all tracks associated with an artist is currently unsupported. Try switching to albumns or genres\')">' + item["title"] + '<br> <i>' + item["artist_name"] + '</i> </div> </div>'
                }
                document.getElementsByClassName("sideways_slider_content")[0].innerHTML = html
            } else {
                // Remove all currently showing items
                for (let child of document.getElementsByClassName("sideways_slider_content")[0].children) {
                    child.parentElement.removeChild(child)
                }

                let html = ""
                for (let item of genre_sort) {
                    // Turn each item into an element
                    duration += parseInt(item["duration"])
                    html += '<div class="sideways_slider_item"><div class="sideways_slider_icon play_animate" onclick="api.play_playlist()"> <img class="play_track_button" src="../assets/icons/play.svg"/> </div> <div class="playlist_title" onclick="api.send_iframe_to_page(\'iframe/playlist.php?playlist_id=' + item["playlist_id"] + '\')">' + item["title"] + '<br> <i>' + item["playlist_title"] + '</i> </div> </div>'
                }
                document.getElementsByClassName("sideways_slider_content")[0].innerHTML = html
            }
            console.log(duration)

            // Transform the duration
            let hours = 0
            let minutes = 0
            let seconds = 0

            while(duration >= 3600) {
                duration -= 3600
                hours += 1
            }

            while (duration >= 60) {
                duration -= 60
                minutes += 1
            }

            seconds = duration

            document.getElementById("duration").innerHTML = "Total Duration: " + hours + ":" + minutes + ":" + seconds + " (Duration if all shown results were played back-to-back. When sorting by genre, tracks with multiple genres will be repeated.)"
        }

        const onload = () => {
            api = new iframe_class()
            playlist_type_el = document.getElementById("search_type")
            playlist_type_el.onchange = updateResults
            updateResults()
        }
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../assets/css/styles.css"/>
</head>
<body onload="onload()">

<div class="wrapper">
    <div class="sideways_slider_wrapper">
        <h1>Showing all tracks</h1>
        <form>
            <label for="search_type">Sort by: </label><select id="search_type">
                <option>Track name, then artist</option>
                <option>Genre, then artst</option>
            </select>
        </form>
        <div id="duration"></div>
        <div class="sideways_slider">
            <div style="overflow: unset; height: unset; display: unset;" class="sideways_slider_content">

            </div>
        </div>
    </div>
</div>
</body>
</html>
