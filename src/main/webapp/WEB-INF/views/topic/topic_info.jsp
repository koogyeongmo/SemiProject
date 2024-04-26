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

            <button class="join_button"> Join </button>


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
    
    <script src="<%=request.getContextPath()%>/resources/javascript/topic/topic_info.js">     
	</script>

</div>
