
package image.controller;

import java.io.*;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import image.model.service.ImageService;
import image.model.dto.ImageDto;



@WebServlet("/ImageController")
public class ImageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	InputStream inputStream = request.getInputStream();

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        

        
        byte[] blob = outputStream.toByteArray();
        
        String base64Blob = Base64.getEncoder().encodeToString(blob);
                
        
        ImageDto dto = new ImageDto("123", blob);
 
        int result = new ImageService().uploadImage(dto);
        
        System.out.println(result);
    }
}