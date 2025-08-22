<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">

    <footer>
    
        <div class="footer">
               <div class="footer_com_intro">
                <ul class="footer_menu">회사소개
                    <li><a href="javascript:void(0)" class="footer_tree">휴먼커피 소개</a></li>
                    <li><a href="javascript:void(0)">연혁</a></li>
                    <li><a href="<%= request.getContextPath() %>/about/map.jsp">오시는 길</a></li>
                </ul>
            </div>
            <div>
                <ul class="menu">제품
                    <li><a href="<%= request.getContextPath() %>/menu/menu-coffee.jsp" class="tree">커피</a></li>
                    <li><a href="<%= request.getContextPath() %>/menu/menu-dikapein.jsp">디카페인</a></li>
                    <li><a href="<%= request.getContextPath() %>/menu/menu-juice.jsp">쥬스</a></li>
                </ul>
            </div>
            <div>
                <ul class="menu">가맹점
                	<li><a href="<%= request.getContextPath() %>/merchant/merchantList.jsp" class="tree">가맹점 리스트</a></li>
                    <li><a href="javascript:void(0)">창업신청</a></li>
                </ul>
            </div>
           
            <div class="footer_info">
                <div class="footer_infotext">
                    <div>사업자등록번호 201-81-21515</div>
                    <div>(주)휴먼 커피 대표: 홍길동</div>
                    <div>TEL : (02) 3015-1100 / FAX : (02) 3015-1106</div>
                    <div>개인정보 책임자 : 이순신</div>
                </div>
                <button>Privcy Statemen +</button>
                 <p class="footer_copyright">
          			  &copy; <span class="this-year"></span> Human Coffee Company. All Rights Reserved.
        		</p>
            </div>
        </div>

    </footer>
