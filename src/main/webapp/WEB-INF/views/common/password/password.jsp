<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no viewport-fit=cover">
<title>dr.Ro</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/common.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/validator.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/slick.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/common.js"></script>
</head> --%>

<!-- <body>
<div class="util_wrap"> -->

    <!-- header web 
    <div class="header hidden-xs">
        <div class="inner_wrap">
            <h1 class="logo"><a href="#">닥터로</a></h1>
        </div>
    </div>
    header web -->
    <!-- header m 
    <div class="m_header visible-xs hidden-sm">
        <button class="btn_back">back</button>
        <h2>비밀번호 찾기</h2>
    </div>
    <!--// header m -->
    
    <!-- container -->
    <div class="container">
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">비밀번호 찾기</h3>
            </div>
            <form data-toggle="validator" role="form">
                <strong class="form_title">가입 때 입력하신 이메일 주소를 입력해 주세요</strong>
                <div class="form-group">
                    <label for="email" class="label_txt">이메일</label>
                    <input class="form-control" type="email" name="userEmail" data-error="잘못된 이메일 형식입니다." id="email" placeholder="이메일을 입력해 주세요"/>
                    <div class="help-block with-errors"></div>
                </div>
            </form>
            <div class="bottom_btn">
                <a href="#" class="btn btn_aqua">비밀번호 초기화</a>
            </div>
        </div>
    </div>
    <!--// container -->
    <!-- footer web 
    <div class="footer hidden-xs">
        <p class="copy">&copy; Doktoro.All right served</p>
    </div>
    <!-- footer web -->

    <!-- footer m 
    <footer class="footer_m visible-xs hidden-sm">
        <ul class="clearfix">
            <li class="on"><a href=""><span class="f_home"></span>홈</a></li>
            <li><a href=""><span class="f_medical"></span>의료진 찾기</a></li>
            <li><a href=""><span class="f_consult"></span>의료상담</a></li>
            <li><a href=""><span class="f_health"></span>건강정보</a></li>
            <li><a href=""><span class="f_mypage"></span>마이페이지</a></li>
        </ul>
    </footer>
    <!--// footer m -->
</div>
</body>

</html>