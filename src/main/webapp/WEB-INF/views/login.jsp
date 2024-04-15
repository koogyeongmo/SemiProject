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
    
</head>
<body>
    <header class="login_header">
        <img src="<%=request.getContextPath()%>/resources/images/aspire_logo.png" id="logo_icon">
    </header>
    <div class="login_container">
        <h1>Log In</h1>
        <form id="login_form">
            <input type="text" name="id" placeholder="Username" required>
            <div class="password_container">
                <input type="password" name="pwd" id="password" placeholder="Password" required>
                <button type="button" class="show_password" onclick="togglePassword()">Show</button>
            </div>
            <div class="forgot">
                Forgot <a href="#">username</a> or <a href="#">password</a>?
            </div>
            <input type="button" class="login_button" value="Log In">        
        </form>
        <div class="create_account">
            New to Aspire? <a href="#">Join now</a>
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
	    function togglePassword() {
	        var passwordField = document.getElementById("password");
	        var showPasswordButton = document.querySelector(".show_password");
	        if (passwordField.type === "password") {
	            passwordField.type = "text";
	            showPasswordButton.textContent = "Hide";
	        } else {
	            passwordField.type = "password";
	            showPasswordButton.textContent = "Show";
	        }
	    }
	    
        $(loadedHandler);
        function loadedHandler(){
        	$("#login_form .login_button").on("click", frmClickHandler);
        }

        function frmClickHandler(){
        	$.ajax({
        		url:"${pageContext.request.contextPath }/login"
        		, method : "post"
        		, data : $("#login_form").serialize()
        		, success : function(result){
        			console.log(result);
        			if(result == 1 ){
        				alert("반갑습니다.");
        				var prePage = "${prePage}";
        				if(prePage == "write"){
        					location.href="${pageContext.request.contextPath}/board/write";
        				}
        				location.href="${pageContext.request.contextPath}/main";
        			}else {
        				alert("아이디 또는 패스워드가 일치하지 않습니다.\n다시 확인하고 로그인해주세요.");
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
        
    </script>
</body>
</html>