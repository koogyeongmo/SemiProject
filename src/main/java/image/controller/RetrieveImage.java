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

import com.google.gson.JsonObject;

import image.model.dto.*;
import image.model.service.ImageService;

import java.util.Base64;


@WebServlet("/retrieveimage")
public class RetrieveImage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ImageDto imageDto = new ImageService().retrieveImage("123");

        byte[] imageData = imageDto.getImageBlob();

        response.setContentType("image/jpeg");

        try (ServletOutputStream out = response.getOutputStream()) {
            out.write(imageData);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}