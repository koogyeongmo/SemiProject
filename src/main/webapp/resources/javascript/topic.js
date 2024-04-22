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

        function addPost(tabName) {
            var tabContent = document.getElementById(tabName);
            var postHTML = '<div class="post"><span>New Post Title</span><p>New post content goes here...</p></div>';
            tabContent.insertAdjacentHTML('beforeend', postHTML);
        }

        const flairs = document.querySelectorAll('.flair');
        const colors = ['#CC5289', '#B3A3B3', '#C04BF7', '#3083FF', '#47B2B2', '#EBC633'];

        flairs.forEach((flair, index) => {
            const colorIndex = index % colors.length;
            flair.style.backgroundColor = colors[colorIndex];
        });

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