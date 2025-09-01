<%@ page language="java" contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.humancoffee.*" %>
<%@ page import="com.humancoffee.manager.*" %>
<%@ page import="com.humancoffee.model.*" %>
<%
	HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
	ManageMyOrders mgOrder = hcInstance.mOrders;
    // POST 요청으로 전달된 order_id를 받음
    String orderId = request.getParameter("order_id");

	System.out.println(orderId);
    
    // 이 부분에 주문을 삭제하는 실제 데이터베이스 로직을 구현해야 합니다.
    // 예: 
    // ManageOrder manageOrder = new ManageOrder();
    // boolean success = manageOrder.deleteOrder(orderId);

    // 가상의 성공/실패 로직
    boolean success = (orderId != null && !orderId.isEmpty()); // 예시 로직
	My_Order mOrder = new My_Order();
    
    if (success) {
    	mOrder.setId(orderId);
    	mOrder = mgOrder.searchMyOrderById(mOrder);
    	if(mOrder != null){
    		mOrder.setStatus(1);
    		mgOrder.updateMyOrderStatus(mOrder);
    	}
        out.print("success"); // 성공 시 'success' 문자열 반환
    } else {
        out.print("fail"); // 실패 시 'fail' 문자열 반환
    }
%>