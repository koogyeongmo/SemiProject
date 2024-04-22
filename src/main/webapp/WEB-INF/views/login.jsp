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

	<script>
	
	const loginText = document.querySelector(".title-text .login");
	const loginForm = document.querySelector("form.login");
	const loginBtn = document.querySelector("label.login");
	const signupBtn = document.querySelector("label.signup");
	const signupLink = document.querySelector(".create_account a");
	const wrapper = document.querySelector(".wrapper");
	const signupSubmit = document.querySelector(".signup_button");

	signupBtn.onclick = (()=>{
	    loginForm.style.marginLeft = "-50%";
	    loginText.style.marginLeft = "-50%";
	    wrapper.style.height = "570px";
	});
	loginBtn.onclick = (()=>{
	    loginForm.style.marginLeft = "0%";
	    loginText.style.marginLeft = "0%";
	    wrapper.style.height = "480px";

	});
	signupLink.onclick = (()=>{
	    signupBtn.click();
	    return false;
	});
	function togglePassword1() {
	    var passwordField = document.getElementsByClassName("password1");
	    var showPasswordButton = document.getElementById("password1");

	    for (let i = 0; i < passwordField.length; i++) {
	        if (passwordField[i].type === "password") {
	            passwordField[i].type = "text";
	            showPasswordButton.textContent = "Hide";
	        } else {
	            passwordField[i].type = "password";
	            showPasswordButton.textContent = "Show";
	        }
	    }
	    
	}

	function togglePassword2() {
	    var passwordField = document.getElementsByClassName("password2");
	    var showPasswordButton = document.getElementById("password2");

	    for (let i = 0; i < passwordField.length; i++) {
	        if (passwordField[i].type === "password") {
	            passwordField[i].type = "text";
	            showPasswordButton.textContent = "Hide";
	        } else {
	            passwordField[i].type = "password";
	            showPasswordButton.textContent = "Show";
	        }
	    }
	    
	}

	signupSubmit.onclick = (()=>{
	    loginForm.style.marginLeft = "-50%";
	    loginText.style.marginLeft = "-50%";
	    wrapper.style.height = "570px";
	});



	$(loadedHandler);
	function loadedHandler(){
		$(".login_button").on("click", loginClickHandler);
		$(".signup_button").on("click", signupClickHandler); 

	}

	function loginClickHandler(){
		$.ajax({
			url:"${pageContext.request.contextPath }/login"
			, method : "post"
			, data : $("#login_form").serialize()
			, success : function(result){
				console.log(result);
				if(result == 1 ){
					alert("Welcome!");
					var prePage = "${prePage}";
					if(prePage == "write"){
						location.href="${pageContext.request.contextPath}/board/write";
					}
					location.href="${pageContext.request.contextPath}/main";
				}else {
					alert("Username or password is incorrect.");
					$("[name=pwd]").val("");
				}
			}
			,error : function(request, status, error){
				alert("code: "+request.status + "\n" + "message: " 
						+ request.responseText + "\n"
						+ "error: "+error);
			}
		});
	}

	function signupClickHandler(){
		$.ajax({
			url:"${pageContext.request.contextPath }/join"
			, method : "post"
			, data : $("#signup_form").serialize()
			, success : function(result){
				console.log(result);
				if(result == 1 ){
					alert("Thanks for joining!");
					var prePage = "${prePage}";
					console.log(prePage);
					console.log("test");

					if(prePage == "write"){
						location.href="${pageContext.request.contextPath}/board/write";
					}
					location.href="${pageContext.request.contextPath}/login";
				}else {
					alert("fail");
					$("[name=pwd]").val("");
				}
			}
			,error : function(request, status, error){
				alert("code: "+request.status + "\n" + "message: " 
						+ request.responseText + "\n"
						+ "error: "+error);
			}
		});
	}

	function btnCheckidClickHandler(){
		var idVal = $("[name=id]").val();
		$.ajax( { 
			async : false, 
			url : "${pageContext.request.contextPath }/checkid.ajax"
			,method : "post"
			,data : { cid : $("[name=id]").val(), k1:"v1", k2:"v2" }
			,success : function(result){ 
				console.log(result);
				if(result > 0){
					alert("사용불가!! 다른아이디를 사용해주세요.");
				}else {
					alert("사용가능");
				}	
			}
			,error : function(request, status, error){
				alert("code: "+request.status + "\n" + "message: " 
						+ request.responseText + "\n"
						+ "error: "+error);
			}
		} );

	}
	
	</script>


	
</body>
</html>


