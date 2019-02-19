<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--resource include--%>
<tiles:insertAttribute name="resource" />
<%--//resoruce include--%>
<c:choose>
	<c:when test="${pageName eq'login'||pageName eq'password'||pageName eq'join'}">
		<body>
			<div class="util_wrap">
	</c:when>
	<c:otherwise>
		<body>
			<div class="wrap">
	</c:otherwise>
</c:choose>
    <%--header include--%>
    <tiles:insertAttribute name="header" />
    <%--//header include--%>
   
  		  <%--content include--%>
            <tiles:insertAttribute name="content" />
            <%--//content include--%>
            
<c:if test="${pageName ne'login'&& pageName ne'password'&& pageName ne'join'}">
    <!--login, password 제외한 헤더.jsp 의 <div class=container>의 끝  -->
    </div>
    <!--// container -->
</c:if>
    
        <%--footer include--%>
        <tiles:insertAttribute name="footer" />
        <%--//footer include--%>
<c:if test="${pageName ne'login'&& pageName ne'password'&& pageName ne'join'}">
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
</c:if>
	</div>
</body>
</html>