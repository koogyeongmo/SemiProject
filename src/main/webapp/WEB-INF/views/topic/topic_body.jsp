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
            <button class="create_button" onClick="toggleMainPage()">Create a post</button>
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



<script src="<%=request.getContextPath()%>/resources/javascript/topic/topic_body.js"> 

	

</script>


    
