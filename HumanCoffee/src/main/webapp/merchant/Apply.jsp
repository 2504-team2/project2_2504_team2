<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import = "com.humancoffee.manager.*" %>
<%@ page import = "com.humancoffee.model.*" %>
<%@ page import = "com.humancoffee.common.*" %>
<%@ page import = "com.humancoffee.*" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    HumanCoffee hcInstance = (HumanCoffee)getServletContext().getAttribute("HumanCoffee");

    if(hcInstance != null){
        ManageSubComs mSubComs = hcInstance.mSubComs;

        try {
            // 폼 데이터 받기
            String name = request.getParameter("name");
            String tel = request.getParameter("tel");
            String fax = request.getParameter("fax");
            String addr = request.getParameter("addr");
            String email = request.getParameter("email");
            String indateStr = request.getParameter("indate");

            Timestamp indate = null;
            if(indateStr != null && !indateStr.isEmpty()){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                indate = new Timestamp(sdf.parse(indateStr).getTime());
            }

            // Sub_Com 객체 생성
            Sub_Com newSubCom = new Sub_Com();
            newSubCom.setComId("COMPANY_ID"); // 본사 ID, 필요 시 수정
            newSubCom.setId("SC" + System.currentTimeMillis()); // 자동 ID 생성
            newSubCom.setName(name);
            newSubCom.setTel(tel);
            newSubCom.setFax(fax);
            newSubCom.setAddr(addr);
            newSubCom.setEmail(email);
            newSubCom.setInDate(indate);
            newSubCom.setStatus(0);

            // DB 삽입 시도
            mSubComs.insertSubCom(newSubCom);

            out.println("<script>");
            out.println("alert('가맹점 신청이 완료되었습니다.')");
            out.println("var form = document.createElement('form');");
            out.println("form.method = 'POST';");
            out.println("form.action = 'merchantApply.jsp';");
            out.println("document.body.appendChild(form);");
            out.println("form.submit();");
            out.println("</script>");
            
        } catch (Exception e) {
            e.printStackTrace(); // 서버 콘솔에 에러 로그 출력
            out.println("<script>alert('신청 처리 중 오류가 발생했습니다.'); history.back();</script>");
        }

    } else {
        out.println("<script>alert('시스템 오류: HumanCoffee 객체를 찾을 수 없습니다.'); history.back();</script>");
    }
%>