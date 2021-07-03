<!DOCTYPE html>

<html lang="en">
<head>

    <!-- A lot of the CSS styling the login page doesn't share with the other pages,
    so the CSS of the login page has been placed inline below-->
    <style>
        body {
            margin: 0;
            padding: 20px;
            background-color: black;
            min-width: 100vw;
            min-height: 100vh;
            text-align: center;
        }

        #login {
            display: inline-block;
            border-radius: 20px;
            padding: 20px;
            background-color: white;
        }

        input {
            padding: 10px;
            width: calc(100% - 20px);
            margin-bottom: 10px;
        }

        #button_tray {
            text-align: right;
        }

        #button_tray > button {
            padding: 10px 20px;
            border-radius: 3px;
            margin-left: 10px;
            min-width: 105px;
        }
    </style>
</head>
<body>
<div id="login">
    <h1>Welcome to Graeme's Music Website!</h1>
    <form method="post">
        <label>
            <input type="text" placeholder="Please enter your username" name="username"/>
        </label>
        <label>
            <input type="password" placeholder="Please input your password" name="password">
        </label>
        <div id="button_tray">
            <button>Forgot Password</button>
            <button>Login</button>
        </div>
    </form>
</div>
</body>
</html>