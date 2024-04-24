<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Upload Image</title>
</head>
<body>

<input type="file" id="upload" />
<img id="display" src="" />
<div id="base64Output"></div>


<script>
document.getElementById("upload").onchange = function(e) {
    var file = document.getElementById("upload").files[0];
    var reader = new FileReader();
    reader.onload = function() {
        console.log(reader.result);
        document.getElementById("display").src = reader.result;

        // Convert data URL to Blob
        var blob = dataURLtoBlob(reader.result);
        console.log("Blob:", blob);

        // Send the Blob to the servlet
        uploadBlobToServlet(blob);
    };
    reader.readAsDataURL(file);
};



function uploadBlobToServlet(blob) {
    // Create XMLHttpRequest object
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '${pageContext.request.contextPath }/ImageController', true);

    // Set onload and onerror handlers
    xhr.onload = function() {
        if (xhr.status === 200) {
            // Request was successful
            console.log('Image uploaded successfully.');
        } else {
            // Error handling
            console.error('Error uploading image. Status:', xhr.status);
        }
    };

    xhr.onerror = function() {
        console.error('Network error occurred while trying to upload the image.');
    };

    xhr.send(blob);
}

// Function to convert data URI to Blob
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


document.getElementById('imageInput').addEventListener('change', function(event) {
    var file = event.target.files[0];
    
    if (!file) {
        return;
    }
    
    var reader = new FileReader();
    
    reader.onload = function(event) {
        var base64 = event.target.result;
        document.getElementById('base64Output').innerText = base64;
    };
    
    reader.readAsDataURL(file);
});
</script>

</body>
</html>