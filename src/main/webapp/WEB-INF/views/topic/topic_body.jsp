<link href="<%=request.getContextPath()%>/resources/css/topic/topic_body.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="middle_column">
    
    <div class="topic_banner">
        <img src="<%=request.getContextPath()%>/resources/images/cat_banner.jpg" id="banner">    
    </div>
    <div class="topic_nav">
        <div class="profile_and_name">
            <div class="topic_profile_picture"> 
                <img src="<%=request.getContextPath()%>/resources/images/cat_icon.jpg" id="banner">    

            </div>
            <div class="topic_nav_name">cats</div>
        </div>

        <div class="tab">
            <button class="tablinks active" onclick="openTab(event, 'New')">New</button>
            <button class="tablinks" onclick="openTab(event, 'Top')">Top</button>
            <button class="tablinks" onclick="openTab(event, 'Hot')">Hot</button>
        </div>


        <div class="create">
            <button class="create_button">Create a post</button>
        </div>

    </div>




    <div id="New" class="content active">
    <!-- <button class="add-post-btn" onclick="addPost('New')">Add Post</button> -->
    
   <!-- <div class="post"><span>New Post Title</span><p>New post content goes here...</p></div>
        <div class="post"><span>New Post Title</span><p>New post content goes here...</p></div>
        <div class="post"><span>New Post Title</span><p>New post content goes here...</p></div>
        <div class="post"><span>New Post Title</span><p>New post content goes here...</p></div>
        <div class="post"><span>New Post Title</span><p>New post content goes here...</p></div>
        <div class="post"><span>New Post Title</span><p>New post content goes here...</p></div> -->
        
        <c:choose>
			<c:when test="${empty map.dtolist }">

			</c:when>
			<c:otherwise>
				<c:forEach items="${map.dtolist }" var="vo" varStatus="vs">
				
					<div class="post"  onclick="window.location.href='${pageContext.request.contextPath }/thread?id=${vo.boardId }'" >
							<div>${vo.subject }</div>
					        <div>${vo.content }</div>
					        <div>${vo.writeTime }</div>
					        <div>${vo.boardWriter }</div>
					        <div>${vo.readCount }</div>
					</div>
					
				</c:forEach>
			</c:otherwise>
		</c:choose>

    </div>

    <div id="Top" class="content">
     <!--    <button class="add-post-btn" onclick="addPost('Top')">Add Post</button> -->
    </div>

    <div id="Hot" class="content">
         <!-- <button class="add-post-btn" onclick="addPost('Hot')">Add Post</button> -->
    </div>
</div>


<div class="right_column">
    <div class="topic_info">
        <div class="topic_info_name">
            <div>
                topic<b>/cats</b>
            </div>
            <button class="option_button">
                <img src="<%=request.getContextPath()%>/resources/images/three_dots.png" id="three_dots_icon">
            </button>
        </div>
        <div class="topic_info_description">
            Pictures, videos, questions and articles featuring/about cats. 
            Join us to share your love for cats and connect with fellow cat lovers!
        </div>


        <div class="topic_info_follow">
            <div class="following_count"><b>12,589</b> Followers</div>

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

</div>

<script src="<%=request.getContextPath()%>/resources/javascript/topic.js"> 

	

</script>


    
