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
				        <svg rpl="" fill="currentColor" height="16" icon-name="upvote-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg" class="upvote upvote_button ${upvotedBoards.contains(threadId) ? 'upvoted' : ''}" data-comment-id="${threadId}"> 
				            <path d="M12.877 19H7.123A1.125 1.125 0 0 1 6 17.877V11H2.126a1.114 1.114 0 0 1-1.007-.7 1.249 1.249 0 0 1 .171-1.343L9.166.368a1.128 1.128 0 0 1 1.668.004l7.872 8.581a1.25 1.25 0 0 1 .176 1.348 1.113 1.113 0 0 1-1.005.7H14v6.877A1.125 1.125 0 0 1 12.877 19ZM7.25 17.75h5.5v-8h4.934L10 1.31 2.258 9.75H7.25v8ZM2.227 9.784l-.012.016c.01-.006.014-.01.012-.016Z"></path>
				        </svg> 
				    </div>
				
				    <div>
				        <b> ${threadInfo.getVoteCount()}    </b>
				    </div>
				    <div>
				        <svg rpl="" fill="currentColor" height="16" icon-name="downvote-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg" class="downvote downvote_button ${downvotedBoards.contains(threadId) ? 'downvoted' : ''}" data-comment-id="${threadId}">
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
                            <div class="smaller_gray_font"> &nbsp; &nbsp;${vo.postTime } </div>

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
			                <div class="thread_vote">
			                	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-reply" viewBox="0 0 16 16">
								  <path d="M6.598 5.013a.144.144 0 0 1 .202.134V6.3a.5.5 0 0 0 .5.5c.667 0 2.013.005 3.3.822.984.624 1.99 1.76 2.595 3.876-1.02-.983-2.185-1.516-3.205-1.799a8.7 8.7 0 0 0-1.921-.306 7 7 0 0 0-.798.008h-.013l-.005.001h-.001L7.3 9.9l-.05-.498a.5.5 0 0 0-.45.498v1.153c0 .108-.11.176-.202.134L2.614 8.254l-.042-.028a.147.147 0 0 1 0-.252l.042-.028zM7.8 10.386q.103 0 .223.006c.434.02 1.034.086 1.7.271 1.326.368 2.896 1.202 3.94 3.08a.5.5 0 0 0 .933-.305c-.464-3.71-1.886-5.662-3.46-6.66-1.245-.79-2.527-.942-3.336-.971v-.66a1.144 1.144 0 0 0-1.767-.96l-3.994 2.94a1.147 1.147 0 0 0 0 1.946l3.994 2.94a1.144 1.144 0 0 0 1.767-.96z"/>
								</svg>
          						Reply 
			                </div>
			                
	  
			
			            </div>
					</div>
					
					
					
				</c:forEach>
										
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






    	document.addEventListener('click', function(event) {
    	    var target = event.target;
    	    
    	    if (target.classList.contains('upvote_button') || target.classList.contains('downvote_button')) {
    	        var boardId = target.getAttribute('data-comment-id');
    	        var voteType = target.classList.contains('upvote_button') ? "upvote" : "downvote";
    	        var oppositeVoteType = voteType === "upvote" ? "downvote" : "upvote";
    	        
    	        sendVote(boardId, voteType);
    	        console.log(voteType);
    	        
    	        var voteCountElement = target.closest('.thread_vote').querySelector('b');
    	        var currentVoteCount = parseInt(voteCountElement.textContent.trim());
    	        voteCountElement.textContent = voteType === 'upvote' ? currentVoteCount + 1 : currentVoteCount - 1;
    	        
    	        target.classList.toggle(voteType + "d");
    	        target.classList.remove(oppositeVoteType + "d");
    	    }
    	});

</script>