<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
    <!-- alert -->
    <div class="modal fade modal-center" id="alert_pop">
        <div class="modal-dialog sm alert_pop">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"></button>
                    <h4 class="modal-title">알림</h4>
                </div>
                <div class="modal-body">
                    <div class="modal_con">
                        <p id="alertmsg">가입되지 않은 정보입니다.</p>
                        <p id="alertmsg2">다시 확인해 주세요</p>
                    </div>
                    <div class="pop_bottom_btn">
                        <!-- 확인버튼 -->
                        <button class="btn w100" data-dismiss="modal" id="okay">확인</button>

                        <!-- 취소/확인 버튼 -->
                        <!-- <button class="btn" data-dismiss="modal">취소</button>
                        <button class="btn w100">확인</button> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    