<link href="<%=request.getContextPath()%>/resources/css/topic/editor.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/quill@2.0.0/dist/quill.snow.css" rel="stylesheet" />


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="editor_container">
	<div class="main_container">
	        <div class="editor_header">
	        	<div class="back_to_topic_button" onClick="toggleMainPage2()">
	        	    <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
				    <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8"/>
				    </svg>
	   
	        	</div>
	        
	            Create a post
	            <div>
	                <button class="post_button">Post</button>
	            </div>
	        </div>
	
	        <div class="editor_title">
	            <textarea placeholder="Title" id="title_input"></textarea>  
	            
	            <div id="title_counter" class="counter">0/200</div>
	        </div>
	
	        <div class="tab_editor">
	            <button class="tablinks_editor active_editor" onclick="openTabEditor(event, 'text')">Text</button>
	            <button class="tablinks_editor" onclick="openTabEditor(event, 'image')">Image</button>
	        </div>
	
	        <div id="text" class="content_editor active_editor">
	            <div class="editor_wysiwyg_container">
	                <div id="editor">
	                </div>
	                <div id="content_counter" class="counter">0/2000</div>
	            </div>
	
	        </div>
	
	        <div id="image" class="content_editor">
	            <input type="file" id="file-input" multiple style="display:none;" onchange="handleFiles(this.files)">
	            <div class="upload_container">
	                <div id="drop-area" onclick="selectFiles()">
	                    <p>Click or drag and drop image files here &nbsp;
	                        <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-cloud-upload" viewBox="0 0 16 16">
	                            <path fill-rule="evenodd" d="M4.406 1.342A5.53 5.53 0 0 1 8 0c2.69 0 4.923 2 5.166 4.579C14.758 4.804 16 6.137 16 7.773 16 9.569 14.502 11 12.687 11H10a.5.5 0 0 1 0-1h2.688C13.979 10 15 8.988 15 7.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 2.825 10.328 1 8 1a4.53 4.53 0 0 0-2.941 1.1c-.757.652-1.153 1.438-1.153 2.055v.448l-.445.049C2.064 4.805 1 5.952 1 7.318 1 8.785 2.23 10 3.781 10H6a.5.5 0 0 1 0 1H3.781C1.708 11 0 9.366 0 7.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383"/>
	                            <path fill-rule="evenodd" d="M7.646 4.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V14.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708z"/>
	                          </svg>
	                          <br>
	                    </p>
	                		                         <span id="upload_count"> 0/10 Images uploaded </span>
	                	
	                </div>

	            </div>
	
	            <div>
	                <ul id="file-list"></ul>
	            </div>
	        </div>
	
	
	
	
	    </div>
</div>
      
      <script src="https://cdn.jsdelivr.net/npm/quill@2.0.0/dist/quill.js"></script>
      
      <script>
        const quill = new Quill('#editor', {
            theme: 'snow'
            });
        

        
        var limit = 2000;
        quill.on('text-change', function(delta, old, source) {
            const counter = document.getElementById("content_counter");
            counter.textContent = (quill.getLength() - 1) + "/2000";

            if (quill.getLength() > limit) {
                quill.deleteText(limit, quill.getLength());
            }
        });

        const textarea = document.getElementById("title_input");


        textarea.addEventListener("input", function() {
            const currentValue = textarea.value;

            if (currentValue.length > 200) {
                const trimmedValue = currentValue.substring(0, 200);
                
                textarea.value = trimmedValue;
            }

            updateCounter();
        });

        function updateCounter() {
            const currentValue = textarea.value;
            const remainingChars = 200 - currentValue.length;

            const counter = document.getElementById("title_counter");
            counter.textContent = currentValue.length + "/200";

            if (remainingChars <= 0) {
                counter.style.color = "red";
            } else {
                counter.style.color = "";
            }
        }

        textarea.addEventListener('input', function() {
            var lines = this.value.split('\n');
            if (lines.length > 3) {
                this.value = lines.slice(0, 3).join('\n');
            }
        });

        textarea.addEventListener('keydown', function(event) {
        var lines = this.value.split('\n');
        var currentLine = lines.length;
        var caretPos = this.selectionStart;

        if (currentLine === 3 && caretPos === this.value.length) {
            if (event.key === 'Enter') {
                event.preventDefault();
            }
        }
    });

    function openTabEditor(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("content_editor");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks_editor");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active_editor", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active_editor";
    }
	 
	 var uploadedFileList = [];
	 var threadId = 123;

	 function allowDrop(event) {
	     event.preventDefault();
	 }

	 function drop(event) {
	     event.preventDefault();
	     var fileList = event.dataTransfer.files;
	     handleFiles(fileList);
	 }

	 function selectFiles() {
	     document.getElementById('file-input').click();
	 }

	 function handleFiles(files) {
	     var fileListElement = document.getElementById('file-list');
	     var uploadCounter = document.getElementById('upload_count');

	     for (var i = 0; i < files.length; i++) {
	         var file = files[i];
	         var listItem = document.createElement('li');
	         var fileInfo = document.createElement('div');
	         fileInfo.className = 'file-info';

	         var fileImage = document.createElement('img');
	         fileImage.src = URL.createObjectURL(file);
	         fileInfo.appendChild(fileImage);

	         var fileDetails = document.createElement('div');
	         fileDetails.textContent = file.name;
	         fileInfo.appendChild(fileDetails);
	         fileDetails.className = 'file_info_name';

	         var deleteButton = document.createElement('div');
	         deleteButton.className = 'delete-button';
	         deleteButton.innerHTML = '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">' +
	             '<path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8z"/> </svg>';
	         deleteButton.onclick = function () {
	             listItem.remove();
	             removeFromUploadedFiles(file);
	             uploadCounter.textContent = uploadedFileList.length + '/10 images uploaded';
	         };
	         fileInfo.appendChild(deleteButton);

	         listItem.appendChild(fileInfo);
	         fileListElement.appendChild(listItem);
	         uploadedFileList.push(file);
	         uploadCounter.textContent = uploadedFileList.length + '/10 images uploaded';
	     }
	 }

	 function removeFromUploadedFiles(file) {
	     var index = uploadedFileList.indexOf(file);
	     if (index !== -1) {
	         uploadedFileList.splice(index, 1);
	     }
	 }
	 
	 function dataURLtoBlob(dataURI) {
	     var byteString = atob(dataURI.split(',')[1]);
	     var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	     var arrayBuffer = new ArrayBuffer(byteString.length);
	     var uint8Array = new Uint8Array(arrayBuffer);

	     for (var i = 0; i < byteString.length; i++) {
	         uint8Array[i] = byteString.charCodeAt(i);
	     }

	     return new Blob([arrayBuffer], { type: mimeString });
	 }

	 function uploadBlobToServlet(blob, fileType, threadId) {
	     var formData = new FormData();
	     formData.append('blob', blob);
	     formData.append('fileType', fileType);
	     formData.append('boardId', '123');

	     var xhr = new XMLHttpRequest();
	     xhr.open('POST', '${pageContext.request.contextPath}/ImageController', true);

	     xhr.onload = function() {
	         if (xhr.status === 200) {
	             console.log('Image uploaded successfully.');
	         } else {
	             console.error('Error uploading image. Status:', xhr.status);
	         }
	     };

	     xhr.onerror = function() {
	         console.error('Network error occurred while trying to upload the image.');
	     };

	     xhr.send(formData);
	 }

	 function sendFilesToServlet(threadId) {
	     uploadedFileList.forEach(function(file) {
	         var reader = new FileReader();

	         reader.onload = function(event) {
	             var blob = dataURLtoBlob(event.target.result);

	             uploadBlobToServlet(blob, file.type, threadId);
	         };

	         reader.readAsDataURL(file);
	     });
	 }


	 
 	document.getElementsByClassName('post_button')[0].addEventListener('click', function() { 		
 	    var threadInfo = {
	    		topicId: "${topic_id}",
	    		title:  document.getElementById("title_input").value,
	    		content: quill.root.innerHTML,
	    		userId: "${LoggedIn.memId}"
	    		
	    };
	    	    
		$.ajax({
			url:"${pageContext.request.contextPath }/boardcreate.ajax"
			, method : "post"
			, data : threadInfo
			, success : function(result){	
				 sendFilesToServlet(threadId);
				location.href="${pageContext.request.contextPath}/topic/" + "${topic_id}";
			}
			,     error: function(xhr, status, error) {
		        console.log("Error: " + error);
		    } 
		});
 		

	    
	    
	});
    

    </script>

