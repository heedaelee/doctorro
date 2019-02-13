<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no viewport-fit=cover">
<title>dr.Ro</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_user/css/common.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/validator.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/slick.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource_user/js/common.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
<div class="util_wrap">
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
    <!-- container -->
    <div class="container">
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">로그인</h3>
            </div>
            <div class="login_form">
                <form data-toggle="validator" role="form">
                    <div class="">
                        <strong class="form_title">이메일</strong>
                        <div class="form-group">
                            <label for="" class="sr-only">이메일</label>
                            <input class="form-control" type="email" name="userEmail" value="" placeholder="수신 가능한 이메일을 입력해 주세요" data-error="입력하신 정보가  올바르지 않습니다, 다시 한번 입력해 주세요." required />
                            <div class="help-block with-errors"></div>
                        </div>
                        <strong class="form_title">비밀번호</strong>
                        <div class="form-group">
                            <label for="" class="sr-only">비밀번호</label>
                            <input class="form-control" type="password" name="userPassword" value="" id="userPassword" data-minlength="6" placeholder="비밀번호를 입력해 주세요" data-error="입력하신 정보가  올바르지 않습니다, 다시 한번 입력해 주세요." required />
                            <div class="help-block with-errors"></div>
                        </div>
                        <div class="form-group check_box">
                            <span class="label_txt">로그인을 유지하시겠습니까?</span>
                            <label class="switchbox">
                                <input class="form-control" type="checkbox" name="autoLogin" id="autoLogin"><span></span>
                            </label>
                        </div>
                    </div>
                    <div class="bottom_btn">
                        <button class="btn btn_aqua">로그인</button>
                    </div>
                    <div class="link_text">
                        <a href="membership.html">회원가입</a>
                        <span>|</span>
                        <a href="search_id.html">비밀번호 찾기</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--// container -->
    <!-- footer web -->
    <div class="footer hidden-xs">
        <div class="inner_wrap">
            <p class="copy">&copy; Doktoro.All right served</p>
        </div>
    </div>
    <!-- footer web -->
    <!-- footer m -->
    <footer class="footer_m visible-xs hidden-sm">
        <ul class="clearfix">
            <li class="on"><a href=""><span class="f_home"></span>홈</a></li>
            <li><a href=""><span class="f_consult"></span>의료상담</a></li>
            <li><a href=""><span class="f_alarm"></span>알림</a></li>
            <li><a href=""><span class="f_mypage"></span>마이페이지</a></li>
        </ul>
    </footer>
    <!--// footer m -->
</div>
</body>

</html>