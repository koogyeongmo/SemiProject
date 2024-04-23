<link href="<%=request.getContextPath()%>/resources/css/thread/thread_body.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="middle_column">
        <div class="main_thread">
            <div class="thread_title"> ${dto.subject }</div>
            <div class="thread_user"> 
                <img src="<%=request.getContextPath()%>/resources/images/default_profile_picture.jpg" class="mini_profile_pic">
                &nbsp;&nbsp;
                ${dto.boardWriter }
            </div>
            <div class="thread_content"> 
            	${dto.content}
            </div>
            <div class="thread_bottom_nav">
                <div class="thread_vote">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-up" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5"/>
                    </svg>
                    23
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1"/>
                    </svg>
    
                </div>
                <div class="thread_comment_count">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                        <path d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105"/>
                    </svg>
                    Comments

                    12
                </div>

                <div class="post_date">
                    Posted on: <span>2024/02/23</span>
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


</div>
        
    
<div class="right_column">
    <div class="topic_info">
        <div class="topic_info_name">
            <div>
                topic<b>/cats</b>
            </div>
            <button class="option_button">
                <img src="<%=request.getContextPath()%>/resources/images/three_dots.png" id="three_dots_icon">
            </button>
        </div>
        <div class="topic_info_description">
            Pictures, videos, questions and articles featuring/about cats. 
            Join us to share your love for cats and connect with fellow cat lovers!
        </div>


        <div class="topic_info_follow">
            <div class="following_count"><b>12,589</b> Followers</div>

            <button class="join_button"> Join </button>


        </div>
    </div>

    <div class="sort_by_flair">
        <span>Sort by flair</span>
        <ul class="flair_list">
            <li class="flair">Announcement</li>
            <li class="flair">Question</li>
            <li class="flair">Image</li>
            <li class="flair">Video</li>
            <li class="flair">Meme</li>
            <li class="flair">Event</li>

          </ul>

    </div>

    <div class="rules_list">
        <span>Community rules </span>
        <ol>
            <li> <span>Be respectful towards others.</span> </li>
            <li> <span>No spam, NSFW, or self promotion. </span></li>
            <li><span> Don't post copyrighted content.</span> </li>
            <li><span> Check before asking a question. </span></li>
            <li><span> No reposts. </span></li>
        </ol>

    </div>

</div>

<script>
    var textarea = document.getElementById('comment');
    var textareacontainer = document.getElementsByClassName('post_comment')[0];

    textarea.addEventListener('keydown', autosize);
                
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

</script>