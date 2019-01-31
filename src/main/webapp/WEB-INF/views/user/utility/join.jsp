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
<script type="text/javascript">
$(document).ready(function(){

//회원가입 & 유효성 체크
var pwdRule=/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/; 
$('#submit').click(function () {
	console.log('제출');
    if($('#m_nick').val() === "" || $('#m_nick').val().length>10 ){
        $('#alertmsg').text('닉네임 형식이 바르지 않습니다');
        $('#alert_pop').modal();
        $('#m_nick').focus();
        return false;
    }else if(!pwdRule.test($('#m_pwd').val())){
    	console.log($('#m_pwd').val());
        $('#alertmsg').text('패스워드 형식이 바르지 않습니다');
        $('#alert_pop').modal();
        $('#m_pwd').focus();
        return false;
    }else if(!$('#check01').is(":checked")||!$('#check02').is(":checked")
    	||!$('#check03').is(":checked")||!$('#check04').is(":checked")){
    	$('#alertmsg').text('약관에 동의 해야 합니다');
        $('#alert_pop').modal();
        $('#m_pwd').focus();
        return false;
    }
    else{
    	var form = $('#form')[0];
    	var formData = new FormData(form);
    	$.ajax({
			type:"post",
			url:"joinus/join.htm",
			data:formData,
			processData: false,
            contentType: false,
			success:function(data){ //{"result":""}
			console.log(data);
				if(data=="success"){
					$('.pwcheck1').empty();
					$('.pwcheck').empty();
					swal("회원가입성공.","", "success");
				}else{
					swal("회원가입실패.","", "warning");								
				}
            	},
            error : function(error) {
               swal("실패하였습니다.","","warning");
               console.log(error);
               console.log(error.status);
            }
		})
    }
    })
})
</script>

<body>
<div class="util_wrap">
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
    <!-- container -->
    <div class="container">
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">회원가입</h3>
            </div>
            <form id="form" method="post" data-toggle="validator" role="form" novalidate="true" >
                <strong class="form_title">회원정보</strong>
                <div class="form-group">
                    <label for="name" class="label_txt must">닉네임</label>
                    <input class="form-control" type="text" id="m_nick" name="m_nick" placeholder="닉네임을 입력해 주세요(10자 이내)">
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="email" class="label_txt must">이메일</label>
                    <input class="form-control" type="email" name="m_email" data-error="잘못된 이메일 형식입니다." id="m_email" placeholder="이메일을 입력해 주세요">
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="label_txt must">비밀번호</label>
                    <input class="form-control" type="password" data-minlength="8" id="m_pwd" name="m_pwd" placeholder="영문자 및 숫자 포함 8자 이상" data-error="8자리 이상의 영어 + 숫자 형태로 입력해주세요." >
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="label_txt must">비밀번호 확인</label>
                    <input class="form-control" type="password" id="passwordConfirm" placeholder="영문자 및 숫자 포함 8자 이상" data-match="#m_pwd" data-match-error="비밀번호가 일치하지 않습니다.다시확인해 주세요.">
                    <div class="help-block with-errors"></div>
                </div>
                <div class="agree_chk">
                    <strong class="form_title">약관동의</strong>
                    <div class="form-group check_box allcheck">
                        <input class="form-control checkAll" type="checkbox" id="checkAll">
                        <label for="checkAll" class="">모든 운영 원칙에 동의합니다.</label>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check01">
                        <label for="check01" class="">서비스 이용약관에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check02">
                        <label for="check02" class="">개인정보 처리방침에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check03">
                        <label for="check03" class="">위치기반 서비스 이용약관에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check04">
                        <label for="check04" class="">마케팅 활용에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check05">
                        <label for="check05" class="">마케팅 정보 수신(선택)</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                </div>
                <div class="form-inline text-right">
                    <div class="form-group check_box">
                        <input class="form-control" name="m_mPush" type="checkbox" id="check06">
                        <label for="check06"  class="">푸시</label>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control" type="checkbox" name="m_mMail" id="check07">
                        <label for="check07" class="">이메일</label>
                    </div>
                </div>
                <div class="bottom_btn">
                    <button type="submit" id="submit" class="btn btn_aqua"  >회원가입 완료</button>
                </div>
            </form>
        </div>
    </div>
    <!--// container -->
    <!-- footer web -->
    <div class="footer hidden-xs">
        <p class="copy">© Doktoro.All right served</p>
    </div>
    <!-- footer web -->

    <!-- footer m -->
    <footer class="footer_m visible-xs hidden-sm">
        <ul class="clearfix">
            <li class="on"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html"><span class="f_home"></span>홈</a></li>
            <li><a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html"><span class="f_medical"></span>의료진 찾기</a></li>
            <li><a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html"><span class="f_consult"></span>의료상담</a></li>
            <li><a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html"><span class="f_health"></span>건강정보</a></li>
            <li><a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html"><span class="f_mypage"></span>마이페이지</a></li>
        </ul>
    </footer>
    <!--// footer m -->
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
                        <p>다시 확인해 주세요</p>
                    </div>
                    <div class="pop_bottom_btn">
                        <!-- 확인버튼 -->
                        <button class="btn w100" data-dismiss="modal">확인</button>

                        <!-- 취소/확인 버튼 -->
                        <!-- <button class="btn" data-dismiss="modal">취소</button>
                        <button class="btn w100">확인</button> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--// alert -->
</div>
</body></html>