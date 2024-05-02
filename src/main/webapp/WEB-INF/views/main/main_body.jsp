<link href="<%=request.getContextPath()%>/resources/css/main/main_body.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="middle_column">
    
	<div id="thread_content">
		<div id="New" class="content active">
		
		  <c:choose>
			<c:when test="${empty boardMainList}">

			</c:when>
			<c:otherwise>
				<c:forEach items="${boardMainList}" var="vo" varStatus="vs">
				
						<div class="post"  onclick="window.location.href='${pageContext.request.contextPath }/thread/${vo.topicId}/${vo.boardId}'" >
				            <div class="thread_title"> ${vo.title }</div>
				            <div class="thread_topic"> 
					            <p class="flair">
					            	${vo.topicId}
					            
					            </p>
					           

				            </div>
				            <div class="thread_content gray_text"> 
				            	${vo.content}

							<c:choose>
							    <c:when test="${empty board_cover}">
							    </c:when>
							    <c:otherwise>
							        <c:if test="${not empty board_cover[vo.boardId]}">
							        	<div class="board_image_container">
				            	
							            	<img src="${board_cover[vo.boardId]}" alt="thread Image" class="board_cover_image">
							            
							            </div>
							        </c:if>
							    </c:otherwise>
							</c:choose>
				            
											            
							</div>
				            <div class="thread_bottom_nav">
								<div class="thread_vote">
								    <div>
								        <svg rpl="" fill="currentColor" height="16" icon-name="upvote-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg" class="upvote upvote_button ${upvotedBoards.contains(vo.boardId) ? 'upvoted' : ''}" data-comment-id="${vo.boardId}"> 
								            <path d="M12.877 19H7.123A1.125 1.125 0 0 1 6 17.877V11H2.126a1.114 1.114 0 0 1-1.007-.7 1.249 1.249 0 0 1 .171-1.343L9.166.368a1.128 1.128 0 0 1 1.668.004l7.872 8.581a1.25 1.25 0 0 1 .176 1.348 1.113 1.113 0 0 1-1.005.7H14v6.877A1.125 1.125 0 0 1 12.877 19ZM7.25 17.75h5.5v-8h4.934L10 1.31 2.258 9.75H7.25v8ZM2.227 9.784l-.012.016c.01-.006.014-.01.012-.016Z"></path>
								        </svg> 
								    </div>
								
								    <div>
								        <b> ${vo.getVoteCount()}    </b>
								    </div>
								    <div>
								        <svg rpl="" fill="currentColor" height="16" icon-name="downvote-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg" class="downvote downvote_button ${downvotedBoards.contains(vo.boardId) ? 'downvoted' : ''}" data-comment-id="${vo.boardId}">
								            <path d="M10 20a1.122 1.122 0 0 1-.834-.372l-7.872-8.581A1.251 1.251 0 0 1 1.118 9.7 1.114 1.114 0 0 1 2.123 9H6V2.123A1.125 1.125 0 0 1 7.123 1h5.754A1.125 1.125 0 0 1 14 2.123V9h3.874a1.114 1.114 0 0 1 1.007.7 1.25 1.25 0 0 1-.171 1.345l-7.876 8.589A1.128 1.128 0 0 1 10 20Zm-7.684-9.75L10 18.69l7.741-8.44H12.75v-8h-5.5v8H2.316Zm15.469-.05c-.01 0-.014.007-.012.013l.012-.013Z"></path>
								        </svg>
								    </div>
								</div>
				                <div class="thread_comment_count">
				                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
				                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
				                    </svg>
				                      Comments
				
				                     ${vo.comments} 
				
				                </div>
				                
				                <div  class="thread_share_container">
					                <svg rpl="" aria-hidden="true" class="icon-share" fill="currentColor" height="16" icon-name="share-ios-outline" viewBox="0 0 20 20" width="16" xmlns="http://www.w3.org/2000/svg">
					                <path d="M19 11v5.378A2.625 2.625 0 0 1 16.378 19H3.622A2.625 2.625 0 0 1 1 16.378V11h1.25v5.378a1.373 1.373 0 0 0 1.372 1.372h12.756a1.373 1.373 0 0 0 1.372-1.372V11H19ZM9.375 3.009V14h1.25V3.009l2.933 2.933.884-.884-4-4a.624.624 0 0 0-.884 0l-4 4 .884.884 2.933-2.933Z"></path>
					                </svg>
					                
					                Share
				                </div>
				
				                <div class="post_date smaller_gray_font">
				                    Posted on: <span>${vo.getDate()}</span>
				                </div>
				
				            </div> 
				                
				        </div>
				

				</c:forEach>
				
						
			</c:otherwise>
		</c:choose>
		
	       
	
	    </div>
	
	  
	</div>
	
	
	</div>

    




<script>
	const board_flairs = document.querySelectorAll('.flair');
	const board_colors = ['#CC5289', '#B3A3B3', '#C04BF7', '#3083FF', '#47B2B2', '#EBC633'];
	
	const textToColorMap = {};
	
	board_flairs.forEach((flair) => {
	    const text = flair.textContent.trim(); 
	
	    if (!textToColorMap[text]) {
	        const colorIndex = Object.keys(textToColorMap).length % board_colors.length;
	        textToColorMap[text] = board_colors[colorIndex];
	    }
	
	    flair.style.backgroundColor = textToColorMap[text];
	});
	
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


	
	document.querySelectorAll('.upvote_button, .downvote_button').forEach(button => {
	    button.addEventListener('click', function(event) {
	        event.stopPropagation(); 
	        
	        var boardId = this.getAttribute('data-comment-id');
	        var voteType = this.classList.contains('upvote_button') ? "upvote" : "downvote";
	        var oppositeVoteType = voteType === "upvote" ? "downvote" : "upvote";
	        
	        sendVote(boardId, voteType);
	        console.log(voteType);
	        
	        var voteCountElement = this.closest('.thread_vote').querySelector('b');
	        var currentVoteCount = parseInt(voteCountElement.textContent.trim());
	        voteCountElement.textContent = voteType === 'upvote' ? currentVoteCount + 1 : currentVoteCount - 1;
	        
	        this.classList.toggle(voteType + "d");
	        this.classList.remove(oppositeVoteType + "d");
	    });
	});
	
</script>
