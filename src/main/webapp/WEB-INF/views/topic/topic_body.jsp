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
            <div class="topic_nav_name">${topic_id} </div>
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


	<div id="thread_content">
		<div id="New" class="content active">
		
		  <c:choose>
			<c:when test="${empty map}">

			</c:when>
			<c:otherwise>
				<c:forEach items="${map}" var="vo" varStatus="vs">
				
					<div class="post"  onclick="window.location.href='${pageContext.request.contextPath }/thread?id=${vo.boardId }'" >
							<div>${vo.title }</div>
					        <div>${vo.content }</div>
					        <div>${vo.postTime }</div>
					        <div>${vo.userId }</div>
					        <div>${vo.views }</div>
					</div>
					
					
					
				</c:forEach>
				
		        <button class="load_button">Load more threads</button>
						
			</c:otherwise>
		</c:choose>
		
	       
	
	    </div>
	
	    <div id="Top" class="content">
	    </div>
	
	    <div id="Hot" class="content">
	    </div>
	</div>
	
	
	</div>

    



<script src="<%=request.getContextPath()%>/resources/javascript/topic/topic_body.js">
/* 	$(document).ready(function() {
		  var loadMoreCounter = 0;
	
		  $('#loadMoreBtn').click(function() {
			  loadMoreCounter++;
	
		    $.ajax({
		      url: '/boardloadmore',
		      method: 'POST', 
		      data: { loadMoreCounter: loadMoreCounter },
		      success: function(response) {
		    	  $("#thread_content").load(location.href + " #thread_content");
		      },
		      error: function(xhr, status, error) {
		        console.error('Error:', error);
		      }
		    });
		  });
		}); */


</script>


    
