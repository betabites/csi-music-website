<?php
session_start();

// Get all users
require("../api/connect.php");
$normal_users = $conn->query("SELECT * FROM `users` WHERE `admin` = 0");
$admin_users = $conn->query("SELECT * FROM `users` WHERE `admin` = 1");
?>

<!DOCTYPE html>

<html lang="en">
<head>

    <title>My Account</title>
    <link rel="stylesheet" href="../assets/css/styles.css">

    <script src="../assets/js/api.js" type="application/javascript"></script>
    <script>
        let api
        let selected_id
        let selected_element
        let user_edit_elements = {}
        let new_user = 0

        const delete_account = async (e) => {
            e.preventDefault()
            let data = new FormData()
            data.append("id", selected_id)
            let json_data = await api.request("api/user_data.php?delete=1", "post", data)
            console.log(await api.request("api/user_data.php?delete=1", "post", data))
            let json = JSON.parse(json_data)

            console.log(json)
            console.log("User removed")

            user_edit_elements.wrapper.style.backgroundColor = ""
            user_edit_elements.wrapper.style.height = ""
            user_edit_elements.box.style.opacity = ""
            user_edit_elements.box.style.pointerEvents = ""

            selected_element.parentElement.removeChild(selected_element)
        }

        const save_account = async (e) => {
            e.preventDefault()

            // Send updated data to server
            let data = new FormData()
            if (new_user === 0) {
                data.append("id", selected_id)
            } else if (new_user === 1) {
                data.append("admin", 0)
            } else if (new_user === 2) {
                data.append("admin", 1)
            }
            data.append("username", user_edit_elements.username.value)
            data.append("email", user_edit_elements.email.value)
            if(user_edit_elements.pwd.value !== "") {
                data.append("pwd", user_edit_elements.pwd.value)
            }

            try {
                let body = await api.request("api/user_data.php", "post", data)
                console.log(body)
                let json = JSON.parse(body)
                if (json.error === 0) {
                    // Successfully saved
                    user_edit_elements.wrapper.style.backgroundColor = ""
                    user_edit_elements.wrapper.style.height = ""
                    user_edit_elements.box.style.opacity = ""
                    user_edit_elements.box.style.pointerEvents = ""

                    if (new_user !== 0) {
                        window.location.reload()
                    }
                } else {
                    console.log("")
                    alert("Whoops! There seems to have been an error trying to save your changes.")
                }
            } catch (e) {
                console.log(e)
                alert("Whoops! There seems to have been an error trying to save your changes.")
            }
        }

        const edit_account = async (id) => {
            let data = new FormData()
            data.append("id", id.toString())

            if (id === "new_admin") {
                new_user = 2
            } else if (id === "new") {
                new_user = 1
            } else {
                let user_data = await api.request("api/user_data.php", "post", data)
                let user = JSON.parse(user_data)
                selected_element = document.getElementById(id + "_user")

                new_user = 0

                selected_id = id

                user_edit_elements.username.value = user.username
                user_edit_elements.email.value = user.email
                user_edit_elements.pwd.value = ""
            }

            user_edit_elements.wrapper.style.backgroundColor = "rgba(0,0,0,0.75)"
            user_edit_elements.wrapper.style.height = "calc(100vh - 40px)"
            user_edit_elements.box.style.opacity = "1"
            user_edit_elements.box.style.pointerEvents = "auto"
            return
        }

        const onload = () => {
            api = new iframe_class()

            user_edit_elements.wrapper = document.getElementById("edit_user_wrapper")
            user_edit_elements.box = document.getElementById("edit_user")
            user_edit_elements.box.onsubmit = save_account
            user_edit_elements.username = document.getElementById("username_input")
            user_edit_elements.email = document.getElementById("email_input")
            user_edit_elements.pwd = document.getElementById("pwd_input")

            user_edit_elements.save_button = document.getElementById("save_button")
            user_edit_elements.delete_button = document.getElementById("delete_button")
            user_edit_elements.save_button.onclick = save_account
            user_edit_elements.delete_button.onclick = delete_account
        }
    </script>
</head>
<body onload="onload()">

<div class="page_header">
    <div class="page_header_albumn_cover"></div>
    <h1>Your Account</h1><br>
    <h3>There are <?php echo $normal_users->rowCount() + $admin_users->rowCount(); ?> users</h3>
    <br><button onclick="edit_account(<?php echo $_SESSION["user_id"]; ?>)">Edit my info</button> <button>Upload new profile picture</button>
</div>

<div class="wrapper">
    <?php
    if ($_SESSION["admin"] == "1") {
        // Only show the following to admins
        ?>
        <div class="sideways_slider_wrapper">
            <h1>Users</h1>
            <div class="sideways_slider">
                <div class="sideways_slider_content">
                    <?php
                    foreach($normal_users as $user) {
                        ?><div class="sideways_slider_item" id="<?php echo $user["user_id"];?>_user" onclick="edit_account(<?php echo $user["user_id"];?>)">
                        <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                            <img class="play_track_button play_animate" style="" src="../assets/fontawesome/svgs/regular/trash-alt.svg"/>
                        </div>
                        <div class="playlist_title">
                            <?php echo $user["username"]; ?>
                        </div>
                        </div><?php
                    }
                    ?>

                    <div class="sideways_slider_item" id="new_user" onclick="edit_account('new')">
                        <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                            <img class="play_track_button play_animate" style="" src="../assets/fontawesome/svgs/regular/trash-alt.svg"/>
                        </div>
                        <div class="playlist_title">
                            + Add new user
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="sideways_slider_wrapper">
            <h1>Administrators</h1>
            <div class="sideways_slider">
                <div class="sideways_slider_content">
                    <?php
                    foreach($admin_users as $user) {
                        ?><div class="sideways_slider_item" id="<?php echo $user["user_id"];?>_user" onclick="edit_account(<?php echo $user["user_id"];?>)">
                        <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                            <img class="play_track_button play_animate" style="" src="../assets/fontawesome/svgs/regular/trash-alt.svg"/>
                        </div>
                        <div class="playlist_title">
                            <?php echo $user["username"]; ?>
                        </div>
                        </div><?php
                    }
                    ?>
                    <div class="sideways_slider_item" id="new_user" onclick="edit_account('new_admin')">
                        <div class="sideways_slider_icon" style="background-image: url('../assets/images/default_cover_small.jpg')">
                            <img class="play_track_button play_animate" style="" src="../assets/fontawesome/svgs/regular/trash-alt.svg"/>
                        </div>
                        <div class="playlist_title">
                            + Add new user
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php
    }
    ?>
</div>

<div id="edit_user_wrapper">
    <div id="edit_user">
        <h1>Edit User</h1>
        <form>
            <label>
                Username:
                <input type="text" name="username" id="username_input">
            </label>
            <label>
                Email Address:
                <input type="text" name="email" id="email_input">
            </label>
            <label>
                Reset Password:
                <input type="password" name="reset_pwd" id="pwd_input">
            </label>
            <div style="text-align: right">
                <button id="delete_button" type="button">Delete</button>
                <button id="save_button" type="button">Save</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>