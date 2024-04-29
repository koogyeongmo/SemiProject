package image.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import image.model.dto.*;
import image.model.service.ImageService;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


@WebServlet("/retrieveimage")
public class RetrieveImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ImageDto> imageDtoList = new ImageService().selectImageList(123);

        if (imageDtoList != null) {
            // Create a list to store data URLs for each image
            List<String> imageDataUrls = new ArrayList<>();

            // Convert each image to a data URL and add it to the list
            for (ImageDto imageDto : imageDtoList) {
                String imageType = imageDto.getImageType();
                byte[] imageData = imageDto.getImageBlob();
                String base64ImageData = Base64.getEncoder().encodeToString(imageData);
                String dataUrl = "data:" + imageType + ";base64," + base64ImageData;
                imageDataUrls.add(dataUrl);
            }

            // Convert the list of data URLs to a JSON array
            String jsonData = new Gson().toJson(imageDataUrls);

            // Set the response type to JSON
            response.setContentType("application/json");

            // Write the JSON data to the response
            response.getWriter().write(jsonData);
        } else {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}