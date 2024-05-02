<link href="<%=request.getContextPath()%>/resources/css/common/sidebar.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar">
  <div class="sidebar_logo">
      <img src="<%=request.getContextPath()%>/resources/images/aspire_logo.png" id="logo_icon">
        </div>

        <div>
            <a href="">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
			<path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>
	</svg>  					
                &nbsp; Home
            </a>
            <a href="">
            	<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-graph-up-arrow" viewBox="0 0 16 16">
	  <path fill-rule="evenodd" d="M0 0h1v15h15v1H0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5"/>
	</svg>
                &nbsp; Trending
            </a>

            <a href="">
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-globe" viewBox="0 0 16 16">
  <path d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m7.5-6.923c-.67.204-1.335.82-1.887 1.855A8 8 0 0 0 5.145 4H7.5zM4.09 4a9.3 9.3 0 0 1 .64-1.539 7 7 0 0 1 .597-.933A7.03 7.03 0 0 0 2.255 4zm-.582 3.5c.03-.877.138-1.718.312-2.5H1.674a7 7 0 0 0-.656 2.5zM4.847 5a12.5 12.5 0 0 0-.338 2.5H7.5V5zM8.5 5v2.5h2.99a12.5 12.5 0 0 0-.337-2.5zM4.51 8.5a12.5 12.5 0 0 0 .337 2.5H7.5V8.5zm3.99 0V11h2.653c.187-.765.306-1.608.338-2.5zM5.145 12q.208.58.468 1.068c.552 1.035 1.218 1.65 1.887 1.855V12zm.182 2.472a7 7 0 0 1-.597-.933A9.3 9.3 0 0 1 4.09 12H2.255a7 7 0 0 0 3.072 2.472M3.82 11a13.7 13.7 0 0 1-.312-2.5h-2.49c.062.89.291 1.733.656 2.5zm6.853 3.472A7 7 0 0 0 13.745 12H11.91a9.3 9.3 0 0 1-.64 1.539 7 7 0 0 1-.597.933M8.5 12v2.923c.67-.204 1.335-.82 1.887-1.855q.26-.487.468-1.068zm3.68-1h2.146c.365-.767.594-1.61.656-2.5h-2.49a13.7 13.7 0 0 1-.312 2.5m2.802-3.5a7 7 0 0 0-.656-2.5H12.18c.174.782.282 1.623.312 2.5zM11.27 2.461c.247.464.462.98.64 1.539h1.835a7 7 0 0 0-3.072-2.472c.218.284.418.598.597.933M10.855 4a8 8 0 0 0-.468-1.068C9.835 1.897 9.17 1.282 8.5 1.077V4z"/>
</svg>
                &nbsp; Explore 
            </a>
        </div>

        <div class="horizontal_line"> Following topics </div>
        
        <c:forEach items="${followingTopics}" var="topic">
		    <div>
		        <a href="${pageContext.request.contextPath}/topic/${topic.topicId}">
		            <img src="${topic.topicProfileImage}" class="mini_topic_icon">
		            &nbsp; ${topic.getCapitalizedId()}
		        </a>
		    </div>
		</c:forEach>

<%--         <div>
            <a href="" class="sidebar_selected">
                <img src="<%=request.getContextPath()%>/resources/images/cat_icon.jpg"  class="mini_topic_icon">
          &nbsp; cats
      </a>
      

  </div> --%>

  <div class="horizontal_line_bottom"> </div>


  <button type="button" class="profile_button" onclick="toggleProfileDropdown()">
      <div class="profile_picture_container">
          <img src="<%=request.getContextPath()%>/resources/images/default_profile_picture.jpg" id="profile_picture">
          <div class="online"> </div>
      </div>
      <span>
          ${LoggedIn.memId}
      </span>
  </button>
  <div class="profile_dropdown_content">
      <button class="profile_dropdown_buttons">
      
      </button>
      
      <button class="profile_dropdown_buttons">
   		 Dark mode &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   		 <input type="checkbox" id="toggle" class="toggle-checkbox", onclick="toggleDarkMode()">
		<label for="toggle" class="toggle-label"></label>
    </button>
    
  	<form action="${pageContext.request.contextPath}/logout" method="post">
		<button type="submit" class="profile_dropdown_buttons">
			<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
			  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
			</svg>
			&nbsp;Log Out
		</button>
	</form>

	
  </div>

</div>

<script> 
function toggleNotificationDropdown() {
    var dropdown = document.querySelector('.notification_dropdown_content');
    dropdown.classList.toggle('notification_active');
}


function toggleProfileDropdown() {
    var dropdown = document.querySelector('.profile_dropdown_content');
    dropdown.classList.toggle('profile_active');
}

document.addEventListener('click', function(event) {
    var profileDropdownContent = document.querySelector('.profile_dropdown_content');
    var profileButton = document.querySelector('.profile_button');

    if (!profileDropdownContent.contains(event.target) && !profileButton.contains(event.target)) {

        profileDropdownContent.classList.remove('profile_active');
    }
});


function toggleDarkMode() {
	console.log("test");
    //document.documentElement.classList.toggle('dark-mode');
};


</script>
