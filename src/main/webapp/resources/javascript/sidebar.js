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