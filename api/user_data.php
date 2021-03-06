<?php
require "../api/connect.php";

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    die("Request type MUST be 'post'");
} elseif ((! isset($_POST["id"])) and isset($_POST["username"])) {

    if ($_POST["admin"] == 0) {
        $sql = "INSERT INTO `users`(`username`, `email`, `password`, `admin`) VALUES ('".htmlentities($_POST["username"])."','".htmlentities($_POST["email"])."','".password_hash($_POST["pwd"], PASSWORD_DEFAULT)."',0)";
    } elseif ($_POST["admin"] == 1) {
        $sql = "INSERT INTO `users`(`username`, `email`, `password`, `admin`) VALUES ('".htmlentities($_POST["username"])."','".htmlentities($_POST["email"])."','".password_hash($_POST["pwd"], PASSWORD_DEFAULT)."',1)";
    }

//    echo $sql;
    $conn->query($sql);
    die("{\"error\":0,\"message\":\"Success!\"}");
} elseif (! isset($_POST["id"])) {
    die("{\"error\":1,\"message\":\"Missing required parameter(s)\"}");
} else {
    // Detect what type of command is trying to be performed
    if (isset($_POST["id"])) {
        // Validate the track id parameter
        if (preg_match("/^\d+$/",$_POST["id"])) {
            if (isset($_GET["delete"])) {
                // Delete a user
                $sql = "DELETE FROM `users` WHERE `user_id` = ".$_POST["id"];
                $conn->query($sql);
                die("{\"error\":0,\"message\":\"Success!\"}");
            }
            if (isset($_POST["email"]) and isset($_POST["username"])) {
                // Modify user
                if (isset($_POST["pwd"])) {
                    $sql = "UPDATE `users` SET `username`=\"".$_POST["username"]."\",`email`=\"".$_POST["email"]."\",`password`=\"".password_hash($_POST["pwd"], PASSWORD_DEFAULT)."\" WHERE `user_id` = " . $_POST["id"];
                    $results = $conn->query($sql);
                    if ($results->errorCode() != 0) {
                        die("{\"error\":3,\"message\":\"Unknown error\"}");
                    }
                    die("{\"error\":0,\"message\":\"Success!\"}");
                } else {
                    $sql = "UPDATE `users` SET `username`=\"".$_POST["username"]."\",`email`=\"".$_POST["email"]."\" WHERE `user_id` = " . $_POST["id"];
                    $results = $conn->query($sql);
                    if ($results->errorCode() != 0) {
                        die("{\"error\":3,\"message\":\"Unknown error\"}");
                    }
                    die("{\"error\":0,\"message\":\"Success!\"}");
                }
            }
            else {
                // Get user data
                $sql = "SELECT * FROM `users` WHERE `user_id` = ".$_POST["id"];
                $results = $conn->query($sql);
                if ($results->errorCode() != 0) {
                    die("{\"error\":3,\"message\":\"Unknown error\"}");
                } elseif ($results->rowCount() != 1) {
                    die("{\"error\":2,\"message\":\"Invalid id\"}");
                }
                foreach ($results as $user) {
                    echo json_encode($user);
                }
            }
        } else {
            // The track_id string contains invalid characters
            http_response_code(500);
            die("{\"error\":1,\"message\":\"Invalid parameter\"}");
        }
    }
}