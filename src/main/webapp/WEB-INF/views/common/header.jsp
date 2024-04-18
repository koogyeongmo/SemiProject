<link href="<%=request.getContextPath()%>/resources/css/header/header.css" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<body>
    <header id="header" class="sticky">
        <div class="header_box">
            <div class="header_left">
                <img src="<%=request.getContextPath()%>/resources/images/aspire_logo.png" id="logo_icon">

 
 
                <div class="search_box">
                    <input class="search" type="text" placeholder="Search Aspire">
                    <a href="#"><img src="<%=request.getContextPath()%>/resources/images/search_icon.png" id="search_icon"></a>

                </div>
            </div>
 
            <div class="header_right">
                <div class="notification_container">
                    <button type="button" id="notification_button" onclick="toggleNotificationDropdown()">
                        <img src="<%=request.getContextPath()%>/resources/images/notification_bell.png" id="notification_image">
                    </button>
                    <div class="notification_dropdown_content">
                        <a href="#">Link 1 n</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>

                <div class="profile_container">
                    <button type="button" id="profile_button" onclick="toggleProfileDropdown()">
                        <img src="<%=request.getContextPath()%>/resources/images/default_profile_picture.jpg" id="profile_picture">
                        <span class="online"></span>
                    </button>
                    <div class="profile_dropdown_content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>


        
        </div>
    </header>

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
            var profileButton = document.querySelector('#profile_button');

            var notificationDropdownContent = document.querySelector('.notification_dropdown_content');
            var notificationButton = document.querySelector('#notification_button');

            if (!notificationDropdownContent.contains(event.target) && !notificationButton.contains(event.target)) {

                notificationDropdownContent.classList.remove('notification_active');
            }

            if (!profileDropdownContent.contains(event.target) && !profileButton.contains(event.target)) {

                profileDropdownContent.classList.remove('profile_active');
            }
        });
    </script>
    
</body>
	