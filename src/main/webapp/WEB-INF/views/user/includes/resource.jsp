<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no viewport-fit=cover">
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
    <c:if test="${pageName ne 'login'&&pageName ne 'join'&&pageName ne 'password'}" >
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/paging.js"></script>
    </c:if>
     <c:if test="${pageName=='login'}" >
    <!--카카오톡 로그인  -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/login.js"></script>
    </c:if>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>