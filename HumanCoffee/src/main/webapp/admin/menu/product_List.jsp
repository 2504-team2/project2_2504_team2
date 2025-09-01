<!-- productList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.humancoffee.common.*" %>
<%@ page import="com.humancoffee.dao.*" %>
<%@ page import="com.humancoffee.model.*" %>
<%@ page import="com.humancoffee.manager.*" %>  
<%@ page import="com.humancoffee.*" %>
<%
    // 1. HumanCoffee 인스턴스 가져오기
    HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
	List<Product> productList = new Vector<>(hcInstance.mProducts.products[hcInstance.mProducts.memory_pos]);
//	List<Product_Img> product_img = new Vector<>(hcInstance.mProductImgs.product_imgs[hcInstance.mProductImgs.memory_pos]);
//    ManageProducts mgProducts = hcInstance.mProducts;
    ManageProductImgs mgProductImgs = hcInstance.mProductImgs;
    
    // 2. 카테고리 파라미터 받기
    String categoryParam = request.getParameter("category");
    int categoryFilter = 0;
    if(categoryParam != null && !categoryParam.equals("")) {
    	try {
    		categoryFilter = Integer.parseInt(categoryParam);
    	} catch(NumberFormatException e) {
    		categoryFilter = 0;
    	}
    }
    
    // 3. DB에서 상품 데이터 읽어오기
    // ManageProducts의 readProduct() 메서드를 이용
    try {
//    	mgProducts.readProduct(mgProducts.memory_pos);
    	System.out.println("상품 데이터 로드 완료");
    } catch(Exception e) {
    	System.out.println("상품 데이터 로드 오류: " + e.getMessage());
    }
%>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>상품 목록</title>
    <style>
    .category-nav {
        margin: 20px 0;
        text-align: center;
    }
    .category-nav a {
        display: inline-block;
        padding: 10px 20px;
        margin: 0 5px;
        text-decoration: none;
        background-color: #f0f0f0;
        border-radius: 5px;
        color: #333;
    }
    .category-nav a.active {
        background-color: #007bff;
        color: white;
    }
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        padding: 20px;
    }
    .product-card {
        border: 1px solid #ddd;
        padding: 15px;
        border-radius: 10px;
        text-align: center;
        background-color: #fff;
    }
    .product-card img {
        max-width: 100%;
        height: 150px;
        object-fit: cover;
        border-radius: 5px;
    }
    </style>
    </head>
    <body>

    <h1>상품 목록</h1>

    <!-- 카테고리 네비게이션 -->
    <div class="category-nav">
        <a href="?category=0" class="<%= (categoryFilter == 0) ? "active" : "" %>">전체</a>
        <a href="?category=1" class="<%= (categoryFilter == 1) ? "active" : "" %>">커피</a>
        <a href="?category=3" class="<%= (categoryFilter == 3) ? "active" : "" %>">디카페인</a>
        <a href="?category=4" class="<%= (categoryFilter == 4) ? "active" : "" %>">주스</a>
        <a href="?category=5" class="<%= (categoryFilter == 5) ? "active" : "" %>">기타</a>
    </div>

    <div class="product-grid">
    <%
        // 4. 상품 목록 반복
        if(productList.size() > 0){
            for(Product product : productList) {
                // 카테고리 필터링
                if(categoryFilter != 0 && product.getDiv() != categoryFilter) {
                    continue; // 선택된 카테고리가 아니면 건너뛰기
                }
                
                // Map에서 이미지 가져오기
                List<Product_Img> product_imgs = mgProductImgs.searchProductImgByProductId(product.getId());
                Product_Img product_img = null;
                if(product_imgs.size() > 0)
                	product_img = product_imgs.get(0);
                
                System.out.println("product id: " + product.getId());
                System.out.println("product div: " + product.getDiv());
                System.out.println("product img size: " + product_imgs.size());
                
                String filePath = "#";
                if(product_img != null && !product_img.getFilename().isEmpty())
                	filePath = product_img.getFilename();
                System.out.println("filePath: " + filePath);
                
                // 카테고리 이름
                String categoryName = "";
                switch(product.getDiv()) {
                    case 1: 
                    	categoryName = "커피"; 
                    	break;
                    case 3: 
                    	categoryName = "디카페인"; 
                    	break;
                    case 4: 
                    	categoryName = "주스"; 
                    	break;
                    case 5: 
                    	categoryName = "기타"; 
                    	break;
                    default: 
                    	categoryName = "기타"; 
                    	break;
                }
                System.out.println("categoryName: " + categoryName);
    %>
                <!-- HTML 출력 -->
                <div class="product-card">
                    <% if(!"#".equals(filePath)) { %>
                        <img src="<%= filePath %>" alt="<%= product.getName() %>">
                    <% } else { %>
                        <div style="height: 150px; background-color: #f0f0f0; display: flex; align-items: center; justify-content: center;">
                            이미지 없음
                        </div>
                    <% } %>
                    <h3><%= product.getName() %></h3>
                    <p>가격: <%= product.getPrice() %>원</p>
                    <p>카테고리: <%= categoryName %></p>
                    <p>상품ID: <%= product.getId() %> (div: <%= product.getDiv() %>)</p>
                </div>
    <%
            } 
        } else {
    %>
        <div style="grid-column: 1/-1; text-align: center; padding: 50px;">
            <p>상품이 없습니다.</p>
        </div>
    <%
        }
    %>
    </div>

    <div style="text-align: center; margin: 30px;">
        <a href="productForm.jsp" style="padding: 10px 20px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px;">새 상품 등록</a>
    </div>

    </body>
    </html>