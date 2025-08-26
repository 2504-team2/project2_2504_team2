package com.humancoffee.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/menuUpload")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class MenuUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1. 파라미터 받기
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String category = request.getParameter("category");

        // 2. 파일 업로드 처리
        Part filePart = request.getPart("image");
        String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "images" + File.separator + "coffee";

        // 폴더 없으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        filePart.write(uploadPath + File.separator + fileName);

        // 3. DB 저장 (Product, Product_Img)
        int productId = insertProduct(name, price, category);
        insertProductImg(productId, fileName, category, "Y");

        response.sendRedirect("menuList.jsp");
    }

    private int insertProduct(String name, int price, String category) {
        // JDBC 로직
        return 0; // 임시
    }

    private void insertProductImg(int productId, String fileName, String div, String status) {
        // JDBC 로직
    }
}