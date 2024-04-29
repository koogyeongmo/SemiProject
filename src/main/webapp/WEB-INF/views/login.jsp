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
    <div class="login_container">
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
                    <div class="field_container">
                        <input type="password" name="pwd" class="password1" placeholder="Password" required>
                        <button type="button" class="field_button" id="password1" onclick="togglePassword1()">Show</button>
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

                    <input type="text" name="email" id="email" style="margin-bottom:10px" placeholder="Email">
        			
        			<div class="field_container" style="margin-bottom: 40px;">
        			    <input type="text" name="username" id="username" placeholder="Username">
        			</div>                    

                    <div class="field_container">
                        <input type="password" name="pwd" class="password2" id="pwd1"placeholder="Password">
                        <button type="button" class="field_button" id="password2" onclick="togglePassword2()">Show</button>
                    </div>
        
                    <div class="field_container">
                        <input type="password" class="password2" id="pwd2" placeholder="Confirm Password">
                        <div id="password_checker"></div>

                    </div>
                    <div class="tac_container">
                        <input type="checkbox" id="tac_checkbox">
                        Accept <a class="blue_link" onClick="showTac()">Terms and Conditions</a>
        
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

        <div class="check_tac dialogue_box">
            Please accept the terms and conditions.
        </div>

        <div class="tac_dialogue_box">
            <div class="tac_top">
                <b>Terms and Conditions</b>
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" id="tac_exit" onClick="showTac()" viewBox="0 0 16 16">
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                  </svg>

            </div>

            <div class="tac_text">
                <ol>
                <li>
                <p><strong>Acceptance of Terms</strong>: By using Aspire, you acknowledge that you have read, understood, and agree to abide by these terms and conditions.</p>
                </li> <br>
                <li>
                <p><strong>User Registration</strong>: You must be at least 13 years old to create an account on Aspire. When registering, you agree to provide accurate and complete information. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.</p>
                </li> <br>
                <li>
                <p><strong>User Conduct</strong>: You agree to use Aspire in a manner consistent with all applicable laws and regulations. You will not engage in any unlawful, harassing, abusive, or otherwise objectionable conduct while using the platform.</p>
                </li><br>
                <li>
                <p><strong>Content Guidelines</strong>: You are solely responsible for the content you post on Aspire. You agree not to post content that is defamatory, infringes upon the rights of others, or is otherwise inappropriate. Aspire reserves the right to remove any content that violates these guidelines.</p>
                </li><br>
                <li>
                <p><strong>Privacy</strong>: Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose your personal information.</p>
                </li><br>
                <li>
                <p><strong>Intellectual Property</strong>: Aspire and its content, including but not limited to logos, trademarks, and user-generated content, are protected by intellectual property laws. You may not use Aspire's content without prior written permission from the platform.</p>
                </li><br>
                <li>
                <p><strong>Termination</strong>: Aspire reserves the right to terminate or suspend your account at any time and for any reason, without prior notice.</p>
                </li><br>
                <li>
                <p><strong>Changes to Terms</strong>: Aspire may revise these terms and conditions at any time without prior notice. By continuing to use the platform after such changes, you agree to be bound by the revised terms.</p>
                </li><br>
                <li>
                <p><strong>Disclaimer of Warranties</strong>: Aspire is provided on an "as is" and "as available" basis, without warranties of any kind, either express or implied.</p>
                </li><br>
                <li>
                <p><strong>Limitation of Liability</strong>: In no event shall Aspire be liable for any direct, indirect, incidental, special, or consequential damages arising out of or in any way connected with your use of the platform.</p>
                </li><br>
                <li>
                <p><strong>Governing Law</strong>: These terms and conditions shall be governed by and construed in accordance with the laws of [Jurisdiction], without regard to its conflict of law provisions.</p>
                </li><br>
                </ol>
            </div>

            <div class="tac_bottom">
                <button class="tac_button decline" onClick="tacAccept(false)"> Decline</button>

                <button class="tac_button accept" onClick="tacAccept(true)"> Accept</button>

            </div>
        </div>
        
        
        <div class="email_requirements dialogue_box">
            <div style="margin-bottom: 10px;"> <b>Email must contain: </b></div>
            <div id="email_valid_req">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" id="email_valid_req_checker" class="tick_mark" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                  </svg>
                  &nbsp;Correct email format
            </div> 

            <div id="email_unique_req"> 
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" id="email_unique_req_checker" class="tick_mark" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                  </svg>
                  &nbsp;Unique
            </div> 

    
        </div>
        
        
        <div class="username_requirements dialogue_box">
            <div style="margin-bottom: 10px;"> <b>Username must contain: </b></div>
            <div id="username_char_req">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" id="username_char_req_checker" class="tick_mark" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                  </svg>
                  &nbsp;Between 6 and 20 characters 
            </div> 

            <div id="username_unique_req"> 
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" id="username_unique_req_checker" class="tick_mark" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                  </svg>
                  &nbsp;Unique
            </div> 

    
        </div>


        <div class="password_requirements dialogue_box">
            <div style="margin-bottom: 10px;"> <b>Password must contain: </b></div>
            <div id="char_req">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" id="char_req_checker" class="tick_mark" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                  </svg>
                  &nbsp;Between 8 and 20 characters 
            </div> 

            <div id="num_req"> 
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" id="num_req_checker" class="tick_mark" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0m-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                  </svg>
                  &nbsp;At least 1 number 
            </div> 

    
        </div>



    </div>


    <div id="popup" class="popup">
        <div class="popup-content">
            <div style="margin-bottom: 15px;">
                <b style="font-size: 24px;">Please fix the following:</b>
            </div>
            <div id="errorMessages"> </div>
            <button id="got_it_button"> Got it!</button>

        </div>
        <div>
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
        const loginContainer = document.querySelector(".login_container");
        const signupSubmit = document.querySelector(".signup_button");
        const errorMessageContainer = document.querySelector(".error_messages");

        var passwordIsSame = false;
        var passwordIsValid = false;
        var emailIsValid = false;
        var emailIsUnique = false;
        var usernameIsValid = false;
        var usernameIsUnique = false;
        
        document.getElementById("tac_checkbox").addEventListener("change", function(event) {
            var termsCheckbox = document.getElementById("tac_checkbox");
            if (termsCheckbox.checked) {
            	termsCheckbox.style.outline = "none";
            }
        });

        signupBtn.onclick = (()=>{
            loginForm.style.marginLeft = "-50%";
            loginText.style.marginLeft = "-50%";
            loginContainer.style.height = "580px";
            errorMessageContainer.style.display = "block";
        });
        loginBtn.onclick = (()=>{
            loginForm.style.marginLeft = "0%";
            loginText.style.marginLeft = "0%";
            loginContainer.style.height = "450px";
            errorMessageContainer.style.display = "none";


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
            loginContainer.style.height = "580px";
        });

    function checkPasswordMatch() {
        var password1 = document.getElementById("pwd1");
      var password2 = document.getElementById("pwd2");
      var passwordRequirements = document.getElementById("password_checker");

      if (password2.value.length > 0) { 
        if (password1.value === password2.value) {
            passwordRequirements.textContent = "Passwords match!";
            passwordRequirements.style.color = "green";
            passwordIsSame = true;
            password2.style.border = "none";
        } else {
            passwordRequirements.textContent = "Passwords do not match!";
            passwordRequirements.style.color = "red";
            passwordIsSame = false;
        }
      } else {
        passwordRequirements.textContent = ""; 
        passwordIsSame = false;

      }
    }

    function validatePasswordLength(password) {
        if (password.length < 8) {
            return false;
        }

        if (password.length > 20) {
            return false;
        }

    	return true;
	}
    
    function validateUsernameLength(username) {
        if (username.length < 6) {
            return false;
        }

        if (username.length > 20) {
            return false;
        }

    	return true;
	}

    function validatePasswordNum(password) {
        const hasNumber = /\d/.test(password);
        if (!hasNumber) {
            return false;
        }

        return true;
    }

    function showTac() {
        var tac = document.querySelector(".tac_dialogue_box");

        if (tac.style.display == "block") {
            tac.style.display = "none";
        } else {
            tac.style.display = "block";

        }

    }
    
    function validateEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }




    function passwordRequirementsChecker() {
        var passwordRequirements = document.querySelector(".password_requirements");
        var charReq = document.getElementById("char_req");
        var numReq = document.getElementById("num_req");
        var password = document.getElementById("pwd1");

        var charReqChecker = document.getElementById("char_req_checker");
        var numReqChecker = document.getElementById("num_req_checker");

        var valid = 0;


        if (password.value.length > 0) {
            passwordRequirements.style.display = "block"; 
            
            if (validatePasswordLength(password.value)) {
                charReqChecker.style.fill =  "green";
                valid++;

            } else {
                charReqChecker.style.fill =  "lightgray";

            }
            
            if (validatePasswordNum(password.value)) {
                numReqChecker.style.fill =  "green";
                valid++;
            } else {
                numReqChecker.style.fill =  "lightgray";

            }

        } else {
            passwordRequirements.style.display = "none"; 
        }

        if (valid == 2) {
                passwordIsValid = true;
                password.style.border = "none";

            } else {
                passwordIsValid = false;

            }

        }


    document.getElementById("pwd1").addEventListener("input", checkPasswordMatch);
    document.getElementById("pwd1").addEventListener("input", passwordRequirementsChecker);
    document.getElementById("pwd2").addEventListener("input", checkPasswordMatch);
    document.getElementById("username").addEventListener("input", usernameRequirementsChecker);
    document.getElementById("email").addEventListener("input", emailRequirementsChecker);

    function tacAccept(result) {
        var tacCheckbox = document.getElementById("tac_checkbox");

        showTac();
        if (result) {
            tacCheckbox.checked = true;
            if (tacCheckbox.checked) {
            	tacCheckbox.style.outline = "none";
            }
        } else {
            tacCheckbox.checked = false;
        }

    }
    
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
					location.href="${pageContext.request.contextPath}/topic/cats";
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
		var email = document.getElementById("email");
	      var username = document.getElementById("username");
	      var password = document.getElementById("pwd1");
	      var confirmPassword = document.getElementById("pwd2");
	      var termsChecked = document.getElementById("tac_checkbox");

	      var errorWindow = document.getElementById("errorMessages");
	      errorWindow.innerHTML = "";

	      var errorOccurred = false;

	      if (!email.value || !emailIsValid) {
	        errorWindow.innerHTML += "<p>Enter a valid email. </p>";
	        email.style.border = "2px solid red";
	        errorOccurred = true;
	      } else { email.style.border = "none"; }

	      if (!username.value || !usernameIsValid) {
	        errorWindow.innerHTML += "<p>Enter a valid username.</p>";
	        username.style.border = "2px solid red";
	        errorOccurred = true;
	      } else { username.style.border = "none"; }

	      if (!password.value || !passwordIsValid) {
	        errorWindow.innerHTML +=   "<p>Enter a valid password.</p>";
	        password.style.border = "2px solid red";
	        errorOccurred = true;
	      } else { password.style.border = "none"; }

	      if (!confirmPassword.value || !passwordIsSame) {
	        errorWindow.innerHTML +=  "<p>Confirm your password.</p>";
	        confirmPassword.style.border = "2px solid red";
	        errorOccurred = true;
	      } else { confirmPassword.style.border = "none"; }

	      if (!termsChecked.checked) {
	        errorWindow.innerHTML +=  "<p>Accept the terms and conditions.</p>";
	        termsChecked.style.outline = "2px solid red";
	        errorOccurred = true;
	      } else { termsChecked.style.outline = "none"; }



	    
	      if (errorOccurred) {
	        var popup = document.getElementById('popup');
	        var closeBtn = document.getElementById("got_it_button");

	        popup.style.display = "block";

	        closeBtn.onclick = function() {
	            popup.style.display = "none";
	        }


	        window.onclick = function(event) {
	            if (event.target == popup) {
	                popup.style.display = "none";
	            }
	        }
	        
	      } else {
	    	  
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
		
	}

	function checkId(){
		var idVal = $("[name=username]").val();
		$.ajax( { 
			async : false, 
			url : "${pageContext.request.contextPath }/checkid.ajax"
			,method : "post"
			,data : { cid : $("[name=username]").val(), k1:"v1", k2:"v2" }
			,success : function(result){ 
				console.log(result);

				if (result == 0) {
					usernameIsUnique = true;
				} else {
					usernameIsUnique = false;

				}

			}
			,error : function(request, status, error){
				alert("code: "+request.status + "\n" + "message: " 
						+ request.responseText + "\n"
						+ "error: "+error);
			}
		} );

	}
	
	function checkEmail(){
		var idVal = $("[name=email]").val();
		$.ajax( { 
			async : false, 
			url : "${pageContext.request.contextPath }/checkemail.ajax"
			,method : "post"
			,data : { cemail : $("[name=email]").val(), k1:"v1", k2:"v2" }
			,success : function(result){ 
				console.log(result);

				if (result == 0) {
					emailIsUnique = true;
				} else {
					emailIsUnique = false;

				}

			}
			,error : function(request, status, error){
				alert("code: "+request.status + "\n" + "message: " 
						+ request.responseText + "\n"
						+ "error: "+error);
			}
		} );

	}
	
    function usernameRequirementsChecker() {
        var usernameRequirements = document.querySelector(".username_requirements");
        var usernameCharReq = document.getElementById("username_char_req");
        var usernameUniqueReq = document.getElementById("username_unique_req");
        var username = document.getElementById("username");

        var usernameCharReqChecker = document.getElementById("username_char_req_checker");
        var usernameUniqueReqChecker = document.getElementById("username_unique_req_checker");

        var valid = 0;
        
        checkId();


        if (username.value.length > 0) {
            usernameRequirements.style.display = "block"; 
            
            if (validateUsernameLength(username.value)) {
            	usernameCharReqChecker.style.fill =  "green";
                valid++;
            } else {
            	usernameCharReqChecker.style.fill =  "lightgray";

            }
            
            if (usernameIsUnique && validateUsernameLength(username.value)) {
            	usernameUniqueReqChecker.style.fill =  "green";
                valid++;
            } else {
            	usernameUniqueReqChecker.style.fill =  "lightgray";

            }

        } else {
            usernameRequirements.style.display = "none"; 
        }

        if (valid == 2) {
                usernameIsValid = true;
                username.style.border = "none";

            } else {
                usernameIsValid = false;

            }

        }
	
    function emailRequirementsChecker() {
        var emailRequirements = document.querySelector(".email_requirements");
        var emailValidReq = document.getElementById("email_valid_req");
        var emailUniqueReq = document.getElementById("email_unique_req");
        var email = document.getElementById("email");
        
        var emailValidReqChecker = document.getElementById("email_valid_req_checker");
        var emailUniqueReqChecker = document.getElementById("email_unique_req_checker");

        var valid = 0;
        
        checkEmail();


        if (email.value.length > 0) {
            emailRequirements.style.display = "block"; 
            
            if (validateEmail(email.value)) {
            	emailValidReqChecker.style.fill =  "green";
                valid++;
            } else {
            	emailValidReqChecker.style.fill =  "lightgray";

            }
            
            if (emailIsUnique && validateEmail(email.value)) {
            	emailUniqueReqChecker.style.fill =  "green";
                valid++;
            } else {
            	emailUniqueReqChecker.style.fill =  "lightgray";

            }

        } else {
            emailRequirements.style.display = "none"; 
        }

        if (valid == 2) {
                emailIsValid = true;
                email.style.border = "none";

            } else {
                emailIsValid = false;

            }

        }

	    
    </script>
</body>
</html>
