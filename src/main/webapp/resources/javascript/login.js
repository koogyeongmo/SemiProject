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

	
	    
    	
    
	    
        