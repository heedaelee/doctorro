<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <title>dr.Ro</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/jquery.mCustomScrollbar.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/base.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/common.css" />
    <c:if test="${pageName=='main'}">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/main.css" />
    </c:if>
    <c:if test="${pageName=='login'}">
    <!--네이버 로그인 추가  -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <!--네이버 로그인 추가 종료  -->
    </c:if>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/validator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/slick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/common.js"></script>
    <c:if test="${pageName ne 'login'}" >
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/paging.js"></script>
    </c:if>
     <c:if test="${pageName=='login'}" >
    <!--카카오톡 로그인  -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    </c:if>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<c:if test="${pageName ne'login'||pageName ne'password'}">
	<body>
	<div class="wrap">
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
