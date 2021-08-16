<?php
session_start();
session_destroy();
setcookie("PHPSESSID", "", 0, "/");

// Redirect the user to the login page once they have logged out
header("Location: login.php");