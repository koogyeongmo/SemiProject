<link href="<%=request.getContextPath()%>/resources/css/login/followtopic.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/common/reset.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Topic Selection</title>
    <style>
	    body {
	    	background-image: url("<%=request.getContextPath()%>/resources/images/background.jpg");
	    }
    </style>
</head>
<body>
    <header class="login-header">
        <img src="<%=request.getContextPath()%>/resources/images/aspire_logo.png" id="logo-icon">
    </header>

<div class="choose-topics-container ">
    <div class="followtopic-title">
    <b>What topics are you interested in?<b>
    </div>
    <div class="topics-container">
	    <c:forEach var="topic" items="${sessionScope.topicList}">
		    <div class="topic-card" data-selected="false" data-topic-id="${topic.topicId}">
		        <img class="topic-image" src="${topic.topicProfileImage}" alt="Topic Image"></img>
		        <div class="topic-title">${topic.getCapitalizedId()}</div>
		    </div>
		</c:forEach>
    </div>
    <div class="bottom-nav">
	     <div class="btn-skip"> Skip </div>
	
        <button id="continue-btn" class="btn-inactive"> Select 3 more </button>

    </div>
</div>

<script>
    const topicCards = document.querySelectorAll('.topic-card');
    const continueBtn = document.getElementById('continue-btn');
    let selectedCount = 0;

    topicCards.forEach(card => {
        card.addEventListener('click', () => {
            const isSelected = card.getAttribute('data-selected') === 'true';
            if (isSelected) {
                card.classList.remove('selected');
                card.setAttribute('data-selected', 'false');
                selectedCount--;
            } else if (!isSelected) {
                card.classList.add('selected');
                card.setAttribute('data-selected', 'true');
                selectedCount++;
            }

            updateSelectedCount();
            updateContinueButton();
        });
    });

    function updateSelectedCount() {
    if (selectedCount < 3) {
        continueBtn.textContent = 'Select ' + (3 - selectedCount) + ' more';
    } else {
        continueBtn.textContent = "Continue";
    }
}

function updateContinueButton() {
    if (selectedCount < 3) {
        continueBtn.classList.remove('btn-active');
        continueBtn.classList.add('btn-inactive');    
    } else {
        continueBtn.classList.remove('btn-inactive');
        continueBtn.classList.add('btn-active');
    }    
    
}

var clickedTopics = [];

document.querySelectorAll('.topic-card').forEach(function(card) {
    card.addEventListener('click', function() {
        var topicId = this.getAttribute('data-topic-id');
        if (!clickedTopics.includes(topicId)) {
            clickedTopics.push(topicId); 
            console.log('Clicked Topics:', clickedTopics); 
        }
    });
});


    continueBtn.addEventListener('click', () => {
        var xhr = new XMLHttpRequest();
        var data = {
            topicList: clickedTopics
        };
        var formData = Object.keys(data).map(function(key) {
            return encodeURIComponent(key) + '=' + encodeURIComponent(data[key]);
        }).join('&');

        xhr.open('POST', '${pageContext.request.contextPath}/signup/follow', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
 					location.href="${pageContext.request.contextPath}/main";
 
                } else {
                }
            }
        };
        xhr.send(formData);
    });
</script>

</body>
</html>