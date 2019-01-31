<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no viewport-fit=cover">
<title>dr.Ro</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/validator.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
<div class="wrap">
    <!-- header web -->
    <div class="header hidden-xs">
        <button class="btn_menu" data-target="#gnb_modal" data-toggle="modal">매뉴</button>
    	<h1 class="logo"><a href="#">닥터로</a></h1>
        <div class="inner_wrap">
            <h2 class="title">공지사항</h2>
        </div>
        <ul class="nav_link">
            <li class="btn_alarm"><a href="#">알림</a></li>
            <li class="btn_mypage"><a href="#">마이페이지</a></li>
        </ul>
    </div>
    <!--// header web -->
    <!-- header m -->
    <div class="m_header visible-xs hidden-sm">
        <button class="btn_back">back</button>
        <h2 class="title">공지사항</h2>
    </div>
    <!--// header m -->
    <!-- container -->
    <div class="container">
        <div class="sub_nav">
            <ul>
                <li><a href="#">알림</a></li>
                <li class="on"><a href="#">공지사항</a></li>
            </ul>
        </div>
        <div class="breadcrumb_wrap hidden-xs">
          <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">공지사항</a></li>
          </ul>
        </div>
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">공지사항</h3>
            </div>
            <div class="list_table noti_table">
               <table class="table">
                <caption>list table</caption>
                <tbody>
                <tr class="i_noti">
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr class="i_noti">
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                <tr>
                    <td><a href="">[닥터로] 의료 상담 서비스가 오픈 되었습니다.</a></td>
                    <td>2017.10.20</td>
                </tr>
                </tbody>
                </table> 
            </div>
            <!-- paging -->
            <div class="paging">
                <ul class="pagination">
                <li class="arrow first"><a href="#"></a></li>
                <li class="arrow prev disable"><a href="#"></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li class="arrow next"><a href="#"></a></li>
                <li class="arrow last"><a href="#"></a></li>
                </ul>
            </div>
            
        </div>
    </div>
    <!--// container -->
    <!-- footer web -->
    <div class="footer hidden-xs">
        <p class="copy">Ⓒ Doktoro. All rights reserved</p>
    </div>
    <!-- footer web -->
    <!-- footer m -->
    <footer class="footer_m visible-xs hidden-sm">
        <ul class="clearfix">
            <li class="on"><a href=""><span class="f_home"></span>홈</a></li>
            <li><a href=""><span class="f_medical"></span>의료진 찾기</a></li>
            <li><a href=""><span class="f_consult"></span>의료상담</a></li>
            <li><a href=""><span class="f_health"></span>건강정보</a></li>
            <li><a href=""><span class="f_mypage"></span>마이페이지</a></li>
        </ul>
    </footer>
    <!--// footer -->
    <!-- gnb modal -->
    <div class="modal left fade gnb_modal" id="gnb_modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title">닥터로</h1>
                    <button type="button" class="btn_close" data-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="gnb_con">
                        <ul>
                            <li><a href="#"><span class="f_home"></span>홈</a></li>
                            <li><a href="#"><span class="f_medical"></span>의료진 찾기</a>
                                <ul class="sub_depth">
                                    <li><a href="#">의료진 찾기</a></li>
                                    <li><a href="#">칼럼</a></li>
                                    <li><a href="#">후기</a></li>
                                    <li><a href="#">프로필</a></li>
                                </ul>
                            </li>
                            <li><a href="#"><span class="f_consult"></span>의료상담</a>
                                <ul class="sub_depth">
                                    <li><a href="#">의료 Q&A</a></li>
                                    <li><a href="#">유료상담</a></li>
                                </ul>
                            </li>
                            <li class="on"><a href="#"><span class="f_health"></span>건강정보</a>
                                <ul class="sub_depth">
                                    <li class="on"><a href="#">건강정보</a></li>
                                    <li><a href="#">질병정보</a></li>
                                    <li><a href="#">제약정보</a></li>
                                </ul>
                            </li>
                            <li><a href="#"><span class="f_mypage"></span>마이페이지</a>
                                <ul class="sub_depth">
                                    <li><a href="#">관심의료진</a></li>
                                    <li><a href="#">스크랩정보</a></li>
                                    <li><a href="#">내가쓴글조회</a></li>
                                    <li><a href="#">의료상담</a></li>
                                    <li><a href="#">포인트 조회</a></li>
                                    <li><a href="#">프로필 수정</a></li>
                                    <li><a href="#">관심의료진</a></li>
                                    <li><a href="#">스크랩정보</a></li>
                                    <li><a href="#">내가쓴글조회</a></li>
                                    <li><a href="#">의료상담</a></li>
                                    <li><a href="#">포인트 조회</a></li>
                                    <li><a href="#">프로필 수정</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--// gnb modal -->
</div>
</body>

</html>