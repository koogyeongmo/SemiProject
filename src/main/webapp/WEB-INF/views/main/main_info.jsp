<link href="<%=request.getContextPath()%>/resources/css/main/main_info.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="right_column">
    <div class="topic_info">
        <div class="topic_info_name">
            <div>
                Topics ranking
            </div>
            
            <div style="padding-right: 5px">
            <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-three-dots" viewBox="0 0 16 16">
			  <path d="M3 9.5a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3m5 0a1.5 1.5 0 1 1 0-3 1.5 1.5 0 0 1 0 3"/>
			</svg>
			            
            </div>
        </div>
        <div class="topic_info_description">
			<c:forEach items="${topicList}" var="topic" begin="0" end="9">
			    <div>
			        <a href="${pageContext.request.contextPath}/topic/${topic.topicId}">
			            <img src="${topic.topicProfileImage}" class="mini_topic_icon">
			            &nbsp; ${topic.getCapitalizedId()}
			        </a>
			    </div>
			</c:forEach>
        </div>

        
        <div class="topic_info_seemore">
        	<div>
        	    See More  &nbsp;
        	   </div>
	        	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708"/>
				</svg>
        	
        </div>

 
    </div>

   

</div>
