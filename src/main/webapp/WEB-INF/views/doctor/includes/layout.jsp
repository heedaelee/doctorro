<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, doctor-scalable=no">
    <title>dr.Ro</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/jquery.mCustomScrollbar.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/base.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource_doctor/css/main.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/validator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/slick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resource_doctor/js/common.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="wrap">

    <%--header include--%>
    <tiles:insertAttribute name="header" />
    <%--//header include--%>

   <!-- container -->
	<div class="container">
		<div class="sub_nav">
			<div>
				<ul>
					<li><a href="#">건강정보</a></li>
					<li class="on"><a href="#">질병정보</a></li>
					<li><a href="#">제약정보</a></li>
				</ul>
			</div>
		</div>
		<div class="breadcrumb_wrap hidden-xs">
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">건강정보</a></li>
				<li>질병정보</li>
			</ul>
		</div>
		<%--content include--%>
		<tiles:insertAttribute name="content" />
		<%--//content include--%>
	</div>
<!--// container -->

    <%--footer include--%>
        <tiles:insertAttribute name="footer" />
    <%--//footer include--%>

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