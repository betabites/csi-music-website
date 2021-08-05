<!DOCTYPE html>

<html>
<head>
    <script src="../assets/js/api.js" type="application/javascript"></script>
    <script>
        let api
        let playlist_type_el

        const updateResults = async () => {
            if (playlist_type_el.value === "Artist") {
                // Remove all currently showing items
                for (let child of document.getElementsByClassName("sideways_slider_content")[0].children) {
                    child.parentElement.removeChild(child)
                }

                let json = JSON.parse(await api.request("api/get_playlists.php?playlist_type=0"))
                console.log(json)

                let html = ""
                for (let item of json) {
                    // Turn each item into an element
                    html += '<div class="sideways_slider_item"><div class="sideways_slider_icon play_animate" onclick="api.play_playlist()"> <img class="play_track_button" src="../assets/icons/play.svg"/> </div> <div class="playlist_title" onclick="alert(\'Viewing all tracks associated with an artist is currently unsupported. Try switching to albumns or genres\')">' + item["artist_name"] + '<br> <i> ' + item["count"] + ' tracks</i> </div> </div>'
                }
                document.getElementsByClassName("sideways_slider_content")[0].innerHTML = html
            } else {
                // Remove all currently showing items
                for (let child of document.getElementsByClassName("sideways_slider_content")[0].children) {
                    child.parentElement.removeChild(child)
                }

                let json
                if (playlist_type_el.value === "Albumn") {
                    json = JSON.parse(await api.request("api/get_playlists.php?playlist_type=1"))
                } else if (playlist_type_el.value === "Genre") {
                    json = JSON.parse(await api.request("api/get_playlists.php?playlist_type=2"))
                }
                console.log(json)

                let html = ""
                for (let item of json) {
                    // Turn each item into an element
                    html += '<div class="sideways_slider_item"><div class="sideways_slider_icon play_animate" onclick="api.play_playlist()"> <img class="play_track_button" src="../assets/icons/play.svg"/> </div> <div class="playlist_title" onclick="api.send_iframe_to_page(\'iframe/playlist.php?playlist_id=' + item["playlist_id"] + '\')">' + item["title"] + '<br> <i> ' + item["count"] + ' tracks</i> </div> </div>'
                }
                document.getElementsByClassName("sideways_slider_content")[0].innerHTML = html
            }
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
        <h1>Search</h1>
        <form>
            <label for="search_type">Group by: </label><select id="search_type">
                <option>Artist</option>
                <option>Albumn</option>
                <option>Genre</option>
            </select>
        </form>
        <div class="sideways_slider">
            <div style="overflow: unset; height: unset; display: unset;" class="sideways_slider_content">

            </div>
        </div>
    </div>
</div>
</body>
</html>