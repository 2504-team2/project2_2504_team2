<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.humancoffee.manager.*" %>
<%@ page import="com.humancoffee.common.*" %>
<%@ page import="com.humancoffee.model.*" %>
<%@ page import="com.humancoffee.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="java.util.Date" %>

<%
    request.setCharacterEncoding("UTF-8");
    
    // HumanCoffee 인스턴스에서 ManageCompanys 가져오기
    HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");
    ManageCompanys com = hcInstance.mCompanys;
    
    // 폼에서 전송된 데이터 받기
    String companyId = request.getParameter("Id");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String fax = request.getParameter("fax");
    String addr = request.getParameter("addr");
    String saleEmail = request.getParameter("saleEmail");
    String engEmail = request.getParameter("engEmail");
    String outDateStr = request.getParameter("outDate");
    int status = Integer.parseInt(request.getParameter("status"));
    
    boolean success = false;
    String message = "";
    
    try {
        // Company 객체 생성 및 데이터 설정
        Company company = new Company();
        company.setId(companyId);
        company.setName(name);
        company.setTel(tel);
        company.setFax(fax);
        company.setAddr(addr);
        company.setSaleEmail(saleEmail);
        company.setEngEmail(engEmail);
        company.setStatus(status);
        
        // 폐업일 설정
        if (outDateStr != null && !outDateStr.trim().isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date outDate = sdf.parse(outDateStr);
            company.setOutDate(new Timestamp(outDate.getTime()));
        } else {
            company.setOutDate(null);
        }
        
     	// 회사 정보 수정 실행
        com.updateCompany(company);
        
        // 메모리 데이터 다시 로드
        byte nextMemPos = (byte)(com.memory_pos == 0 ? 1 : 0);
        com.readCompany(nextMemPos);
        com.memory_pos = nextMemPos;
        
        success = true;
        message = "회사 정보가 성공적으로 수정되었습니다.";
        
    } catch (Exception e) {
    	e.printStackTrace();
    }
%>

<%
    // 처리 완료 후 리다이렉트
    if (success) {
        // 성공 시 회사 목록 페이지로 리다이렉트
        response.sendRedirect(request.getContextPath() + "/index.jsp?next_page=/about/company.jsp?msg=" + java.net.URLEncoder.encode(message, "UTF-8"));
    } else {
        // 실패 시 이전 페이지로 리다이렉트 (에러 메시지와 함께)
        response.sendRedirect(request.getContextPath() + "/index.jsp?next_page=/about/manageCompany/editCompany_form.jsp?companyId=" + companyId + "&error=" + java.net.URLEncoder.encode(message, "UTF-8"));
    }
%>
