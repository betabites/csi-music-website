<?php
session_start();
// Redirect the user if they are already logged in
if(isset($_SESSION["user_id"])) {
    header("Location: index.php");
    // The 'die' function ensures that the below HTML that would be sent, is not sent. Since the user is being redirected, it is unnecessary to send the HTML.
    die();
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check that the required parameters are set
    if (isset($_POST["username"]) and isset($_POST["password"])) {
        // Login and verify the info
        require "api/connect.php";
        $query = $conn->prepare("SELECT * FROM `users` WHERE `username` = :username OR `email` = :username");
        $query->execute(array(':username' => $_POST["username"]));
        $results = $query->fetchAll();

        if (count($results) !== 1) {
            echo "Login error; Incorrect login details";
        } else {
            if (password_verify($_POST["password"], $results[0]["password"])) {
                $_SESSION["user_id"] = $results[0]["user_id"];
                $_SESSION["username"] = $results[0]["username"];
                $_SESSION["admin"] = $results[0]["admin"];
                header("Location: index.php");
                die();
            } else {
                echo "Login error; Incorrect login details ".password_hash($_POST["password"], PASSWORD_DEFAULT);
            }
        }
        $query->closeCursor();
    }
    else {
        echo "Login error; A required field is missing";
    }
}
?>

<!DOCTYPE html>

<html lang="en">
<head>

    <!-- A lot of the CSS styling the login page doesn't share with the other pages,
    so the CSS of the login page has been placed inline below-->
    <style>
        body {
            margin: 0;
            padding: 20px;
            background-image: url("assets/images/background.jpg");
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            min-width: calc(100vw - 40px);
            min-height: calc(100vh - 40px);
            text-align: center;
        }

        #login {
            display: inline-block;
            border-radius: 20px;
            padding: 20px;
            background-color: white;
        }

        input {
            padding: 20px;
            width: calc(100% - 40px);
            margin-bottom: 10px;
            border-radius: 20px;
            background-color: black;
            color: white;
            border: none;
        }

        ::placeholder {
            color: white;
            opacity: 1;
        }

        #button_tray {
            text-align: right;
        }

        #button_tray > button {
            padding: 10px 20px;
            border-radius: 3px;
            margin-left: 10px;
            min-width: 105px;
            border: none;
        }

        #login_button {
            background-color: #00FF00;
            /*color: white;*/
        }
    </style>
</head>
<body>
<div id="login">
    <h1>Welcome to Graeme's Music Website!</h1>
    <form method="post">
        <label>
            <input type="text" placeholder="Username" name="username"/>
        </label>
        <label>
            <input type="password" placeholder="Password" name="password">
        </label>
        <div id="button_tray">
            <button>Forgot Password</button>
            <button id="login_button">Login</button>
        </div>
    </form>
</div>
</body>
</html>