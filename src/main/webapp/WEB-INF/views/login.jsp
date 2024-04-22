<link href="<%=request.getContextPath()%>/resources/css/login/login.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/reset.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    
    <style>
	    body {
	    	background-image: url("<%=request.getContextPath()%>/resources/images/background.jpg");
	    }
    </style>

</head>
<body>
    <header class="login_header">
        <img src="<%=request.getContextPath()%>/resources/images/aspire_logo.png" id="logo_icon">
    </header>
    <div class="wrapper">
        <div class="title-text">
            <div class="title login">Log In</div>
            <div class="title signup">Sign Up</div>
        </div>
        <div class="form-container">
            <div class="slide-controls">
                <input type="radio" name="slide" id="login" checked>
                <input type="radio" name="slide" id="signup">
                <label for="login" class="slide login">Log In</label>
                <label for="signup" class="slide signup">Sign Up</label>
                <div class="slider-tab"></div>
              </div>
            <div class="form-inner">
                <form class="login" id="login_form">
                    <input type="text" name="id" placeholder="Username" required>
                    <div class="password_container">
                        <input type="password" name="pwd" class="password1" placeholder="Password" required>
                        <button type="button" class="show_password" id="password1" onclick="togglePassword1()">Show</button>
                    </div>
                    <div class="forgot">
                        Forgot <a href="#">username</a> or <a href="#">password</a>?
                        
                    </div>
                    <input type="button" class="login_button" value="Log In">
                    <div class="create_account">
                        New to Aspire? <a href="">Join now</a>
                    </div>            
                </form>

                <form id="signup_form">

                    <input type="text" name="email" style="margin-bottom:10px" placeholder="Email" required>
        
                    <input type="text" name="id" placeholder="Username" required>
        
                    <div class="password_container">
                        <input type="password" name="pwd" class="password2" placeholder="Password" required>
                        <button type="button" class="show_password" id="password2" onclick="togglePassword2()">Show</button>
                    </div>
        
                    <div class="password_container">
                        <input type="password" class="password2" placeholder="Confirm Password" required>
                    </div>
                    <div class="tac_container">
                        <input type="checkbox" name="tac_checkbox" id="tac_checkbox">
                        Accept <a href="#" class="blue_link">Terms and Conditions</a>
        
                    </div>
                    <input type="button" class="signup_button" value="Sign Up">        
                </form>
                
                
            </div>


        </div>
    </div>

    <div class="error_messages">
        <div class="email_exists dialogue_box">
            This email has already registered.
        </div>
        <div class="username_exists dialogue_box">
            This username already exists.
        </div>
        <div class="invalid_password dialogue_box">
            Please enter a valid password.
        </div>

        <div class="password_mismatch dialogue_box">
            Password does not match.
        </div>

        <div class="check_tac dialogue_box">
            Please accept the terms and conditions.
        </div>
    </div>


    <footer class="login_footer">
        <ul>
            <li><a href="#">About</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">User Agreement</a></li>
            <li><a href="#">Copyright Notice</a></li>

        </ul>

    </footer>

	<script src="<%=request.getContextPath()%>/resources/javascript/login.js"> </script>
</body>
</html>


