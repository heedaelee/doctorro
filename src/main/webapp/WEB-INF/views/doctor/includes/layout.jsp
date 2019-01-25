<%--
  Created by IntelliJ IDEA.
  User: adguy
  Date: 2019-01-25
  Time: 오후 2:24
  의사 레이아웃, Tile로 쪼갬
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">
    <title>dr.Ro</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/base.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css" />
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

    <%--header include--%>
    <tiles:insertAttribute name="header" />
    <%--//header include--%>

    <!-- container -->
    <div class="container">
        <div class="contents">

            <%--일단 보류--%>
            <%--content include--%>
            <%--<tiles:insertAttribute name="content" />--%>
            <%--//content include--%>

            <div class="title_box hidden-xs">
                <h3 class="title"></h3>
            </div>
        </div>
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
                    <button type="button" class="close" data-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    text
                </div>
            </div>
        </div>
    </div>
    <!--// gnb modal -->
    <!-- alert -->
    <div class="modal fade modal-center" id="alert_pop">
        <div class="modal-dialog sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"></button>
                    <h4 class="modal-title">로그인 안내</h4>
                </div>
                <div class="modal-body text-center">
                    <div class="modal_con">
                        <p class="alert_txt">로그인 후 이용 가능한<br />매뉴입니다.</p>
                    </div>
                    <div class="bottom_btn ver02">
                        <button class="btn" data-dismiss="modal">취소</button>
                        <button class="btn">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--// alert -->
</div>
</body>

</html>