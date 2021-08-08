<?php
session_start();
if (! isset($_SESSION["user_id"])) {
    header("Location: login.php");
} else {
    ?>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Graeme's Music</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="assets/css/styles.css"/>
        <link href="assets/fontawesome/css/all.css" rel="stylesheet"> <!--load all styles -->
        <script src="assets/js/api.js" type="application/javascript" charset="UTF-8"></script>
        <script>
            let api
            const onload = () => {
                api = new outer_frame_class(document.getElementById("content"), document.getElementById("player"))
            }
        </script>
    </head>
    <body onload="onload()">

    <div id="wrapper">
        <div id="small_menu" class="menu">
            <div class="small_menuitem" title="Show Menu" style="background-color: black; color: white;" onclick="document.getElementById('large_menu_frame').style.display = 'grid'">
                <i class="fas fa-bars"></i>
            </div>
            <div class="small_menuitem" title="Home" onclick="api.send_iframe_to_page('iframe/home.php')">
                <i class="fas fa-home"></i>
            </div>
            <div class="seperator"></div>
            <div class="small_menuitem" title="Show all" onclick="api.send_iframe_to_page('iframe/refined_search.php?refined_type=5')">
                <i class="fas fa-search"></i>
            </div>
            <div class="seperator"></div>
            <div class="small_menuitem" title="My Account - <?php echo $_SESSION["username"]; ?>">
                <i class="fas fa-user-circle"></i>
            </div>
        </div>

        <div id="large_menu_frame">
            <div id="large_menu" class="menu">
                <div class="small_menuitem" style="background-color: black; color: white;" onclick="document.getElementById('large_menu_frame').style.display = 'none'">
                    <i class="fas fa-bars"></i>
                    <div id="logo_section"><img src="assets/icons/icon.svg"> DOTTY</div>
                </div>
                <div class="small_menuitem" onclick="api.send_iframe_to_page('iframe/home.php')">
                    <i class="fas fa-home"></i>
                    Home
                </div>

                <div class="seperator"></div>

                <div class="small_menuitem">
                    <i class="fas fa-search" onclick="api.send_iframe_to_page('iframe/refined_search.php?refined_type=5')"></i>
                    Show all
                </div>

                <div class="seperator"></div>

                <div class="small_menuitem" onclick="api.send_iframe_to_page('iframe/account.php')">
                    <i class="fas fa-user-circle"></i>
                    My Account - <?php echo $_SESSION["username"]; ?>
                </div>
            </div>
            <div id="large_menu_darkener" onclick="document.getElementById('large_menu_frame').style.display = 'none'">
            </div>
        </div>

        <iframe id="content" src="iframe/home.php">

        </iframe>

        <div id="player">
            <div id="track_data">
                No tracks loaded.
            </div>
            <div id="player_controls">
                <div class="skip" id="skip_backwards">
                    <div class="skip_bar"></div>
                    <div class="skip_triangle"></div>
                </div>
                <img src="assets/icons/icon.svg" height="30px" style="display: inline-block" id="toggle"/>
                <div class="skip" id="skip_forwards" style="transform: rotate(180deg)">
                    <div class="skip_bar"></div>
                    <div class="skip_triangle"></div>
                </div>
            </div>

            <div id="player_snake">
                <div id="player_snake_slider">
                    <div id="slide_circle"></div>
                </div>
            </div>
        </div>
    </div>

    </body>
    </html>

    <?php
}