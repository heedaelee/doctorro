<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(document).ready(function(){
//회원가입 & 유효성 체크
//패스워드 체크
var pwdRule=/^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
//이메일이 적합한지 검사할 정규식
var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


$('#submit').click(function () {
	console.log('제출');
	if($('#m_nick').val() == "" ||
	   $('#au_email').val() == "" ||
	   $('#au_pwd').val() == "" ||
	   $('#au_pwd2').val() == "" ){
        $('#alertmsg').text('필수 항목을 입력해 주세요');
        $('#alert_pop').modal();
        $('#m_nick').focus();
        return false;
    }
    if($('#m_nick').val() === "" || $('#m_nick').val().length>10 ){
        $('#alertmsg').text('최대10자의 닉네임을 입력해주세요');
        $('#alert_pop').modal();
        $('#m_nick').focus();
        return false;
    }
    else if(!re2.test($('#au_email').val())){
    	console.log($('#au_email').val());
        $('#alertmsg').text('이메일 형식을 다시 확인해 주세요');
        $('#alert_pop').modal();
        $('#au_email').focus();
        return false;
    }
    else if(!pwdRule.test($('#au_pwd').val())){
    	console.log($('#au_pwd').val());
        $('#alertmsg').text('패스워드 형식이 바르지 않습니다');
        $('#alert_pop').modal();
        $('#au_pwd').focus();
        return false;
    }
    else if(!$('#check01').is(":checked")||!$('#check02').is(":checked")){
    	$('#alertmsg').text('필수 약관에 동의해 주세요');
        $('#alert_pop').modal();
        $('#au_pwd').focus();
        return false;
    }
    else{
    	var form = $('#form')[0];
    	var formData = new FormData(form);
    	$.ajax({
			type:"post",
			url:"",
			data:formData,
			processData: false,
            contentType: false,
			success:function(data){ //{"result":""}
			console.log(data);
				if(data=="success"){
                    $('#alertmsg').text('회원가입이 완료되었습니다.');
                    $('#alertmsg + p').empty();
                    $('#alert_pop').modal();
                    $('#au_pwd').val("");
                    $('#au_pwd2').val("");
                    return false;
				}
                if(data=="DoubleNick"){
                    $('#alertmsg').text('이미 닉네임이 있습니다.');
                    $('#alert_pop').modal();
                    $('#m_nick').focus();
                    $('#au_pwd').val("");
                    $('#au_pwd2').val("");
                    return false;
                }
                if(data=="DoubleEmail"){
                    $('#alertmsg').text('이미 이메일이 있습니다.');
                    $('#alert_pop').modal();
                    $('#au_email').focus();
                    $('#au_pwd').val("");
                    $('#au_pwd2').val("");
                    return false;
                }
				else{
                    $('#alertmsg').text('회원가입에 실패하였습니다');
                    $('#alert_pop').modal();
                    $('#m_nick').focus();
                    $('#au_pwd').val("");
                    $('#au_pwd2').val("");
                    return false;
                	}
            	},
            error : function(error) {
                $('#alertmsg').text('회원가입에 실패하였습니다');
                $('#alert_pop').modal();
                $('#m_nick').focus();
                $('#au_pwd').val("");
                $('#au_pwd2').val("");
               console.log(error);
               console.log(error.status);
            }
		})
		
    }
    })
    //일반 회원가입시 모달
    $('#alert_pop').click(function(){
   		if($('#alertmsg').text()==='회원가입이 완료되었습니다.'){
   			window.location.href="login";
   			}
    }
)
    
})
</script>
    
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
                    <input class="form-control" type="email" name="au_email" data-error="잘못된 이메일 형식입니다." id="au_email" placeholder="이메일을 입력해 주세요">
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="label_txt must">비밀번호</label>
                    <input class="form-control" type="password" data-minlength="8" id="au_pwd" name="au_pwd" placeholder="영문자 및 숫자 포함 8자 이상" data-error="8자리 이상의 영어 + 숫자 형태로 입력해주세요." >
                    <div class="help-block with-errors"></div>
                </div>
                <div class="form-group">
                    <label for="inputPassword" class="label_txt must">비밀번호 확인</label>
                    <input class="form-control" type="password" id="au_pwd2" placeholder="영문자 및 숫자 포함 8자 이상" data-match="#au_pwd" data-match-error="비밀번호가 일치하지 않습니다.다시확인해 주세요.">
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
                        <label for="check01" class="must">서비스 이용약관에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check02">
                        <label for="check02" class="must">개인정보 처리방침에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check03">
                        <label for="check03" class="">위치기반 서비스 이용약관에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check04" >
                        <label for="check04" class="">마케팅 활용에 동의합니다.</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control checkSel" type="checkbox" id="check05" >
                        <label for="check05" class="">마케팅 정보 수신(선택)</label>
                        <a href="http://rsad.co.kr/client/doctoro/dr_public/html/utility/membership.html#">자세히 보기</a>
                    </div>
                </div>
                <div class="form-inline text-right">
                    <div class="form-group check_box">
                        <input class="form-control" name="m_mPush" type="checkbox" id="check06" name="m_mPush" value="Y">
                        <label for="check06"  class="">푸시</label>
                    </div>
                    <div class="form-group check_box">
                        <input class="form-control" type="checkbox" name="m_mMail" id="check07" name="m_mMail" value="Y">
                        <label for="check07" class="">이메일</label>
                    </div>
                </div>
                <div class="bottom_btn">
                    <button type="button" id="submit" class="btn btn_aqua"  >회원가입 완료</button>
                </div>
            </form>
        </div>
    </div>
    <!--// container -->