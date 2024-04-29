
package image.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import image.model.service.ImageService;
import image.model.dto.ImageDto;
import image.model.dto.ImageInsertDto;



@WebServlet("/ImageController")

@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024,  // 1 MB
	    maxFileSize = 1024 * 1024 * 10,   // 10 MB
	    maxRequestSize = 1024 * 1024 * 50 // 50 MB
	)

public class ImageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part blobPart = request.getPart("blob");
        byte[] imageBlob = processBlob(blobPart);

        int threadId = (Integer) request.getSession().getAttribute("lastBoardId");
        String imageType = request.getParameter("fileType");

        ImageInsertDto dto = new ImageInsertDto(threadId, imageBlob, imageType);
        System.out.println(dto);

        int result = new ImageService().uploadImage(dto);

        response.getWriter().println("Upload successful");
    }

    private byte[] processBlob(Part blobPart) throws IOException {
        try (InputStream inputStream = blobPart.getInputStream()) {
            byte[] imageBlob = inputStream.readAllBytes();
            return imageBlob;
        }
    }
}