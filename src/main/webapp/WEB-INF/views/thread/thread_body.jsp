<link href="<%=request.getContextPath()%>/resources/css/thread/thread_body.css" rel="stylesheet">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="middle_column">
        <div class="main_thread">
            <div class="thread_title"> ${threadInfo.title }</div>
            <div class="thread_user"> 
				<img src="<%=request.getContextPath()%>/resources/images/default_profile_picture.jpg" class="comment_profile_icon">
                &nbsp;
                ${threadInfo.userId }
            </div>
            <div class="thread_content"> 
            	${threadInfo.content}
            	


		    <c:choose>
				<c:when test="${empty imageList}">
	
				</c:when>
				<c:otherwise>
				<div id="carouselExampleSlide" class="carousel slide carousel-slide">
				  <div class="carousel-inner carousel_image" >
			

				    <c:forEach items="${imageList}" var="vo" varStatus="vs">
				    
						<div class="carousel-item ${vs.first ? 'active' : ''}">
							<img src="${vo}"  class="d-block w-100">
				    	</div>

					</c:forEach>
				    
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleSlide" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon carousel_arrow_style" aria-hidden="false"></span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleSlide" data-bs-slide="next">
				    <span class="carousel-control-next-icon carousel_arrow_style" aria-hidden="false"></span>
				  </button>
					<ol class="carousel-indicators">
					    <c:forEach items="${imageList}" var="vo" varStatus="vs">
					        <li data-bs-target="#carouselExampleSlide" data-bs-slide-to="${vs.index}" class="${vs.first ? 'active' : ''}"></li>
					    </c:forEach>
					</ol>
				</div>
							
				</c:otherwise>
			</c:choose> 
            	
            	
            	
            </div>
            <div class="thread_bottom_nav">
            

                     
                <div class="thread_vote">
                    <div>
                        <svg rpl="" fill="currentColor" height="16" icon-name="upvote-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg"  class="upvote upvote_button"  data-comment-id="${threadInfo.boardId}"> 
                            <path d="M12.877 19H7.123A1.125 1.125 0 0 1 6 17.877V11H2.126a1.114 1.114 0 0 1-1.007-.7 1.249 1.249 0 0 1 .171-1.343L9.166.368a1.128 1.128 0 0 1 1.668.004l7.872 8.581a1.25 1.25 0 0 1 .176 1.348 1.113 1.113 0 0 1-1.005.7H14v6.877A1.125 1.125 0 0 1 12.877 19ZM7.25 17.75h5.5v-8h4.934L10 1.31 2.258 9.75H7.25v8ZM2.227 9.784l-.012.016c.01-.006.014-.01.012-.016Z"></path>
                        </svg> 
                    </div>

                    <div>
                        <b>  ${threadInfo.getVoteCount()}  </b>
                    </div>
                    <div>
                        <svg rpl="" fill="currentColor" height="16" icon-name="downvote-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg"  class="downvote downvote_button"  data-comment-id="${threadInfo.boardId}">
                            <path d="M10 20a1.122 1.122 0 0 1-.834-.372l-7.872-8.581A1.251 1.251 0 0 1 1.118 9.7 1.114 1.114 0 0 1 2.123 9H6V2.123A1.125 1.125 0 0 1 7.123 1h5.754A1.125 1.125 0 0 1 14 2.123V9h3.874a1.114 1.114 0 0 1 1.007.7 1.25 1.25 0 0 1-.171 1.345l-7.876 8.589A1.128 1.128 0 0 1 10 20Zm-7.684-9.75L10 18.69l7.741-8.44H12.75v-8h-5.5v8H2.316Zm15.469-.05c-.01 0-.014.007-.012.013l.012-.013Z"></path>
                        </svg>

                    </div>

    
                </div>
                <div class="thread_comment_count">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
                    </svg>
                      Comments

                    ${threadInfo.comments}

                </div>
                
                <div  class="thread_share_container">
	                <svg rpl="" aria-hidden="true" class="icon-share" fill="currentColor" height="16" icon-name="share-ios-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg">
	                <path d="M19 11v5.378A2.625 2.625 0 0 1 16.378 19H3.622A2.625 2.625 0 0 1 1 16.378V11h1.25v5.378a1.373 1.373 0 0 0 1.372 1.372h12.756a1.373 1.373 0 0 0 1.372-1.372V11H19ZM9.375 3.009V14h1.25V3.009l2.933 2.933.884-.884-4-4a.624.624 0 0 0-.884 0l-4 4 .884.884 2.933-2.933Z"></path>
	                </svg>
	                
	                Share
                </div>

                <div class="post_date smaller_gray_font">
                    Posted on: <span>${threadInfo.getDate()}</span>
                </div>

            </div>

                
        </div>

        <div class="post_comment">
            <form>
                <textarea id="comment" name="comment" class="comment_input" placeholder="Add a comment"></textarea>
            </form>
            <button type="button" class="comment_button">
                Comment
            </button>

        </div>
        
        <c:choose>
			<c:when test="${empty commentInfo}">

			</c:when>
			<c:otherwise>
				<c:forEach items="${commentInfo}" var="vo" varStatus="vs">
				
					<div class="post">
						<div class="comment_profile_container">
					        <img src="<%=request.getContextPath()%>/resources/images/default_profile_picture.jpg" class="comment_profile_icon">
                            <div>&nbsp;<b>${vo.userId }</b></div>
                            <div class="smaller_gray_font"> &nbsp; &nbsp;23 hours ago </div>

						</div>
					
					    <div class="comment_text">${vo.content } </div>
					    
						 <div class="comment_nav_container">
			                <div class="thread_vote">
			                    <div class="upvote_button">
			                        <svg rpl="" fill="currentColor" height="18" icon-name="upvote-outline" viewBox="0 0 20 20" width="18" xmlns="http://www.w3.org/2000/svg" class="upvote"> 
			                            <path d="M12.877 19H7.123A1.125 1.125 0 0 1 6 17.877V11H2.126a1.114 1.114 0 0 1-1.007-.7 1.249 1.249 0 0 1 .171-1.343L9.166.368a1.128 1.128 0 0 1 1.668.004l7.872 8.581a1.25 1.25 0 0 1 .176 1.348 1.113 1.113 0 0 1-1.005.7H14v6.877A1.125 1.125 0 0 1 12.877 19ZM7.25 17.75h5.5v-8h4.934L10 1.31 2.258 9.75H7.25v8ZM2.227 9.784l-.012.016c.01-.006.014-.01.012-.016Z"></path>
			                        </svg> 
			                    </div>
			
			                    <div>
			                        <b>0</b>
			
			                    </div>
			                    <div class="downvote_button">
			                        <svg rpl="" fill="currentColor" height="18" icon-name="downvote-outline" viewBox="0 0 20 20" width="18" xmlns="http://www.w3.org/2000/svg" class="downvote">
			                            <path d="M10 20a1.122 1.122 0 0 1-.834-.372l-7.872-8.581A1.251 1.251 0 0 1 1.118 9.7 1.114 1.114 0 0 1 2.123 9H6V2.123A1.125 1.125 0 0 1 7.123 1h5.754A1.125 1.125 0 0 1 14 2.123V9h3.874a1.114 1.114 0 0 1 1.007.7 1.25 1.25 0 0 1-.171 1.345l-7.876 8.589A1.128 1.128 0 0 1 10 20Zm-7.684-9.75L10 18.69l7.741-8.44H12.75v-8h-5.5v8H2.316Zm15.469-.05c-.01 0-.014.007-.012.013l.012-.013Z"></path>
			                        </svg>
			
			                    </div>
			
			    
			                </div>
			  
			
			            </div>
					</div>
					
					
					
				</c:forEach>
				
		        <button class="load_button">Load more comments</button>
						
			</c:otherwise>
		</c:choose>


</div>

<script>
    var textarea = document.getElementById('comment');
    var textareacontainer = document.getElementsByClassName('post_comment')[0];
    textarea.addEventListener('keydown', autosize);
    
    document.getElementsByClassName('comment_button')[0].addEventListener('click', function() {
 		if  (document.getElementById("comment").value != '') {
 			
 		    var commentInfo = {
 		    		boardId: "${threadInfo.boardId}",
 		    		content:  document.getElementById("comment").value,
 		    		userId: "${LoggedIn.memId}"	
 		    };
 		    	    
 	 		$.ajax({
 				url:"${pageContext.request.contextPath }/createcomment.ajax"
 				, method : "post"
 				, data : commentInfo
 				, success : function(result){
 				location.href="${pageContext.request.contextPath }/thread" + "/${topic_id}"  + "/${threadId}";
 	 		}
 				,     error: function(xhr, status, error) {
 			        console.log("Error: " + error);
 			    }
 			}); 
 		}	    
	});
                
    function autosize(){
	    var height = this;  
	    setTimeout(function(){
	        height.style.cssText = 'height:auto; padding:0';
	        height.style.cssText = 'height:' + height.scrollHeight + 'px';
	        height.style.cssText = 'height:' + height.scrollHeight + 'px';
	        textareacontainer.style = 'height:' + height.scrollHeight + 'px';
	        },0);
	    
    }
    
    function openTab(evt, tabName) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("content");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
    
    var threadUpvote = document.getElementById('upvote');
    var threadDownvote = document.getElementById('downvote');
    
 /*     threadUpvote.addEventListener('click', function() {
        var boardId = ${threadId};
        var voteType = "upvote"; 

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseText = xhr.responseText;
                    console.log(responseText); 

                } else {
                }
            }
        };
        xhr.send('boardId=' + boardId + '&voteType=' + voteType); 
    });
    
    threadDownvote.addEventListener('click', function() {
        var boardId = ${threadId};
        var voteType = "downvote"; 

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseText = xhr.responseText;
                    console.log(responseText); 

                } else {
                }
            }
        };
        xhr.send('boardId=' + boardId + '&voteType=' + voteType); 
    });  */
    
    
    
    
    
   /*  
    
    
    
    
    
    
    
     function removeVote() {
        var boardId = ${threadId};
        var voteType = "remove"; 

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseText = xhr.responseText;
                    console.log(responseText); 
                    document.getElementById('upvote').onclick = function() { handleVote('upvote'); };
                    document.getElementById('downvote').onclick = function() { handleVote('downvote'); };
                    document.getElementById('upvote').classList.remove('voted');
                    document.getElementById('downvote').classList.remove('voted');
                    upvoted = false;
                    downvoted = false;
                } else {
                }
            }
        };
        xhr.send('boardId=' + boardId + '&voteType=' + voteType); 
    }
    
    
    function sendVote(boardId, voteType) {
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseText = xhr.responseText;
                    console.log(responseText); 
                } else {
                }
            }
        };
        xhr.send('boardId=' + boardId + '&voteType=' + voteType); 
    }
 

     
    var upvoted = false;
    var downvoted = false;

    function handleVote(voteType) {
        if ((voteType === 'upvote' && downvoted) || (voteType === 'downvote' && upvoted)) {
            document.getElementById('upvote').onclick = function() { handleVote('upvote'); };
            document.getElementById('downvote').onclick = function() { handleVote('downvote'); };
            document.getElementById('upvote').classList.remove('voted');
            document.getElementById('downvote').classList.remove('voted');
            upvoted = false;
            downvoted = false;
            removeVote();
            return;
        }

        if ((voteType === 'upvote' && upvoted) || (voteType === 'downvote' && downvoted)) {
            return;
        }

        if (voteType === 'upvote') {
            document.getElementById('downvote').onclick = null;
            document.getElementById('downvote').classList.add('voted');
            downvoted = true;
            console.log("Downvote disabled");
        } else {
            document.getElementById('upvote').onclick = null;
            document.getElementById('upvote').classList.add('voted');
            upvoted = true;
            console.log("Upvote disabled");
        }
        
        sendVote(boardId, voteType);

        console.log("Vote type: " + voteType);
    }
     */
     
     
     
     
/*     function sendVote(boardId, voteType) {
    	console.log(boardId)
    	console.log(voteType)

        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    var responseText = xhr.responseText;
                    console.log(responseText); 
                } else {
                }
            }
        };
        xhr.send('boardId=' + boardId + '&voteType=' + voteType); 
    }
     


     document.addEventListener('click', function(event) {
    	    var target = event.target;
    	    console.log(target);
    	    if (target.classList.contains('upvote_button')) {
    	        var boardId = target.getAttribute('data-comment-id');
    	        var voteType = "upvote";
    	        sendVote(boardId, voteType);
    	    } else if (target.classList.contains('downvote_button')) {
    	        var boardId = target.getAttribute('data-comment-id');
    	        var voteType = "downvote";
    	        sendVote(boardId, voteType);
    	    }
    	}); */
    	
    	var votedComments = {}; // Object to track voted comments

    	function sendVote(boardId, voteType) {


    	    var xhr = new XMLHttpRequest();
    	    xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
    	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState === XMLHttpRequest.DONE) {
    	            if (xhr.status === 200) {
    	                var responseText = xhr.responseText;
    	                console.log(responseText);
    	                // Update the votedComments object to track that the user has voted for this comment
    	                votedComments[boardId] = voteType;
    	                // Disable the upvote and downvote buttons for this comment
    	                disableVoteButtons(boardId);
    	            } else {
    	                // Handle error
    	            }
    	        }
    	    };
    	    xhr.send('boardId=' + boardId + '&voteType=' + voteType);
    	}

    	function disableVoteButtons(boardId) {
    	    // Get the upvote and downvote buttons for the specified comment
    	    var upvoteButton = document.querySelector('[data-comment-id="' + boardId + '"].upvote_button');
    	    var downvoteButton = document.querySelector('[data-comment-id="' + boardId + '"].downvote_button');
    	    // Disable the buttons
    	    upvoteButton.disabled = true;
    	    downvoteButton.disabled = true;
    	}

    	function removeVote(boardId, voteType) {
    	    var xhr = new XMLHttpRequest();
    	    xhr.open('POST', '${pageContext.request.contextPath}/vote', true);
    	    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState === XMLHttpRequest.DONE) {
    	            if (xhr.status === 200) {
    	                var responseText = xhr.responseText;
    	                console.log(responseText);
    	                enableVoteButtons(boardId);
    	            } else {
    	            }
    	        }
    	    };
    	    xhr.send('boardId=' + boardId + '&voteType=' + voteType);
    	}

    	function enableVoteButtons(boardId) {
    	    // Get the upvote and downvote buttons for the specified comment
    	    var upvoteButton = document.querySelector('[data-comment-id="' + boardId + '"].upvote_button');
    	    var downvoteButton = document.querySelector('[data-comment-id="' + boardId + '"].downvote_button');
    	    // Re-enable the buttons
    	    upvoteButton.disabled = false;
    	    downvoteButton.disabled = false;
    	}

    	document.addEventListener('click', function(event) {
    	    var target = event.target;
    	    if (target.classList.contains('upvote_button')) {
    	        var boardId = target.getAttribute('data-comment-id');
    	        var voteType = "upvote";
    	        if (!votedComments[boardId]) {
    	            //sendVote(boardId, voteType);
    	            console.log("upvote");
	                disableVoteButtons(boardId);

    	        } else if (votedComments[boardId] === voteType) {
    	            //removeVote(boardId);
    	            console.log("remove upvote");
	                enableVoteButtons(boardId);

    	        } else {
    	            console.log("You have already voted for this comment.");
    	        }
    	    } else if (target.classList.contains('downvote_button')) {
    	        var boardId = target.getAttribute('data-comment-id');
    	        var voteType = "downvote";
    	        if (!votedComments[boardId]) {
    	            //sendVote(boardId, voteType);
    	            console.log("downvote");
	                disableVoteButtons(boardId);
    	        } else if (votedComments[boardId] === voteType) {
    	        	//removeVote(boardId, votedComments[boardId]);
    	            console.log("remove downvote");
	                enableVoteButtons(boardId);

    	        } else {
    	            console.log("You have already voted for this comment.");
    	        }
    	    }
    	});

</script>