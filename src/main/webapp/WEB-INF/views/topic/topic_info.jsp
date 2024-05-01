<link href="<%=request.getContextPath()%>/resources/css/topic/topic_info.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="right_column">
    <div class="topic_info">
        <div class="topic_info_name">
            <div>
                topic<b>/${topic_id}</b>
            </div>
            <button class="option_button">
                <img src="<%=request.getContextPath()%>/resources/images/three_dots.png" id="three_dots_icon">
            </button>
        </div>
        <div class="topic_info_description">
            ${topic_description}
        </div>


         <div class="topic_info_follow">
            <div class="following_count"><b class="format_number">${topic_follower}</b> Followers</div>


 		<c:choose>
			<c:when test="${empty followStatus}">
            <button id="join_button" class="join_topic">Join</button>
			</c:when>
			<c:otherwise>
            	<button id="join_button" class="leave_topic">Joined</button>
	
			</c:otherwise>
		</c:choose>


        </div> 
    </div>

    <div class="sort_by_flair">
        <span>Sort by flair</span>
        <ul class="flair_list">
            <li class="flair">Announcement</li>
            <li class="flair">Question</li>
            <li class="flair">Image</li>
            <li class="flair">Video</li>
            <li class="flair">Meme</li>
            <li class="flair">Event</li>

          </ul>

    </div>

    <div class="rules_list">
        <span>Community rules </span>
        <ol>
            <li> <span>Be respectful towards others.</span> </li>
            <li> <span>No spam, NSFW, or self promotion. </span></li>
            <li><span> Don't post copyrighted content.</span> </li>
            <li><span> Check before asking a question. </span></li>
            <li><span> No reposts. </span></li>
        </ol>
    </div>
    
    <script> 
 
		 const flairs = document.querySelectorAll('.flair');
		 const colors = ['#CC5289', '#B3A3B3', '#C04BF7', '#3083FF', '#47B2B2', '#EBC633'];
		
		 flairs.forEach((flair, index) => {
		     const colorIndex = index % colors.length;
		     flair.style.backgroundColor = colors[colorIndex];
		 });

		 
	    function joinTopicFunc(topicId, joinType) {
    	    var xhr = new XMLHttpRequest();
    	    xhr.open('POST', '${pageContext.request.contextPath}/jointopic', true);
    	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState === XMLHttpRequest.DONE) {
    	            if (xhr.status === 200) {
    	                var responseText = xhr.responseText;
    	                console.log(responseText);
    	            } else {
    	            	console.log('Error joining topic.');
    	            }
    	        }
    	    };
    	    xhr.send('topicId=' + topicId + '&joinType=' + joinType);
    	};


   
    
    	$(document).ready(function() {
    		
    	
        $("#join_button").click(function() {
        
	            $(this).toggleClass("join_topic leave_topic");
	            $(this).text(function(i, text) {
	                if (text === "Joined") {
	                    $(this).text("Join");
	                } else {
	                    $(this).text("Joined");
	                }
	            });
	            
	            if ($(this).text() == "Joined") {
	            	joinTopicFunc("${topic_id}", "join")
	                console.log("User has joined.");
	            } else {
	            	joinTopicFunc("${topic_id}", "leave")
	                console.log("User has left.");
	            }
	        });
    	});
    
	</script>

</div>
