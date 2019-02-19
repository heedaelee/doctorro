<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${pageName eq'login'}">
	    <!-- header web -->
	    <div class="header hidden-xs">
	        <div class="inner_wrap">
	            <h1 class="logo"><a href="#">닥터로</a></h1>
	        </div>
	    </div>
	    <!--// header web -->
	    <!-- header m -->
	    <div class="m_header visible-xs hidden-sm">
	        <button class="btn_back">back</button>
	        <h2>로그인 및 회원가입</h2>
	    </div>
	    <!--// header m -->
	</c:when>
	<c:when test="${pageName eq'password'}">
	        <!-- header web -->
	    <div class="header hidden-xs">
	        <div class="inner_wrap">
	            <h1 class="logo"><a href="#">닥터로</a></h1>
	        </div>
	    </div>
	    <!--// header web -->
	    <!-- header m -->
	    <div class="m_header visible-xs hidden-sm">
	        <button class="btn_back">back</button>
	        <h2>비밀번호 찾기</h2>
	    </div>
	    <!--// header m -->
	</c:when>
	<c:when test="${pageName eq'join'}">
	   <!-- header web -->
	    <div class="header hidden-xs">
	        <div class="inner_wrap">
	            <h1 class="logo"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">닥터로</a></h1>
	        </div>
	    </div>
	    <!--// header web -->
	    <!-- header m -->
	    <div class="m_header visible-xs hidden-sm">
	        <button class="btn_back">back</button>
	        <h2>로그인 및 회원가입</h2>
	    </div>
    	<!--// header m -->
	</c:when>
	<c:otherwise>
			<!-- header web -->
		    <div class="header hidden-xs">
		        <button class="btn_menu" data-target="#gnb_modal" data-toggle="modal">매뉴</button>
		        <h1 class="logo"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/main/index.html#">닥터로</a></h1>
		        <div class="inner_wrap">
		            <h2 class="title">건강정보</h2>
		        </div>
		        <ul class="nav_link">
		            <li class="btn_alarm"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/main/index.html#">알림</a></li>
		            <li class="btn_mypage"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/main/index.html#">마이페이지</a></li>
		        </ul>
		    </div>
		    <!--// header web -->
		    <!-- header m -->
		    <div class="m_header main_header visible-xs hidden-sm">
		        <button class="btn_menu_m" data-target="#gnb_modal" data-toggle="modal">메뉴</button>
		        <h1 class="logo"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/main/index.html#">닥터로</a></h1>
		        <button class="btn_alarm">알람</button>
		    </div>
		    <!--// header m -->
		     <!-- container -->
		    <div class="container">
		  <c:if test="${pageName ne'main'}">
		    	 <div class="sub_nav">
		            <div>
		                <ul>
		                    <li class="on"><a href="#">건강정보</a></li>
		                    <li><a href="#">질병정보</a></li>
		                    <li><a href="#">제약정보</a></li>
		                </ul>
		            </div>
		        </div>
		        <div class="breadcrumb_wrap hidden-xs">
		          <ul>
		            <li><a href="#">Home</a></li>
		            <li><a href="#">건강정보</a></li>
		            <li>건강정보</li>
		          </ul>
		        </div>
		   </c:if>
	</c:otherwise>
</c:choose>

