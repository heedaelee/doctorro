<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function() { 
	 console.log('${pageContext.request.contextPath}dd');
	
	//네이버
	var na="${naver.au_email}"
	var nap="${naver.au_pwd}"
	if(na){
		/* alert(na); */
		 $('#sau_email').val(na);
		$('#sau_pwd').val(nap); 
		/* alert('로그인 발송 바로 전'+$('#au_pwd').val()); */
		sociallogin();
	}
	//구글
	var go="${google.au_email}"
	var gop="${google.au_pwd}"
	if(go){
		/* alert(go); */
		 $('#sau_email').val(go);
		$('#sau_pwd').val(gop); 
		sociallogin();
	}	
	
	//로그인 처리
	 $('#login').click(function() {
		  event.preventDefault(); 
		  /* alert('아뒤'+$('#au_email').val() + '\n'+ '비번'+$('#au_pwd').val()); */ 
		 if($('#au_email').val()==""||$('#au_pwd').val()==""){
			 $('#alertmsg').text('이메일 또는 비밀번호를 입력해주세요');
				$('#alertmsg2').text('');
				$('#au_pwd').val("");
            $('#alert_pop').modal();
            return;
		 }
		 
		$.ajax({
			type:'post',
			url : '${pageContext.request.contextPath}/user/logincheck',
			data : {
				"au_email" : $('#au_email').val(),
				"au_pwd" : $('#au_pwd').val()
					},
				success : function(data) {
					if (data == "success") {
							login();
						}
					 if (data == "idfail") {
						$('#alertmsg').text('일치하는 정보가 없습니다.');
						$('#alertmsg2').text('이메일 또는 비밀번호를 다시 확인하세요');
						$('#au_pwd').val("");
	                    $('#alert_pop').modal();
						} 
					if (data == "passfail") {
						$('#alertmsg').text('일치하는 정보가 없습니다.');
						$('#alertmsg2').text('이메일 또는 비밀번호를 다시 확인하세요');
						$('#au_pwd').val("");
						$('#alert_pop').modal();
						}  
				},
				error : function(error) {
					$('#alertmsg').text('로그인에 실패하였습니다.');
	                $('#alert_pop').modal();
		             console.log(error);
		             console.log(error.status);
		          }
		})
	})
	
	function login() {
			$('#loginForm').submit();
	}
	 function sociallogin() {
			$('#SocialloginForm').submit();
	}
	
	$('#alert_pop').click(function(){
		if($('#alertmsg').text()=='아이디가 존재하지 않습니다.'||$('#alertmsg').text()=='로그인에 실패하였습니다.'){
  			window.location.href="login";
  			}
	   }
	)
	
 /*카카오톡 로그인  */ 
 Kakao.init('f2911550662316c4cd821fd8300158df');
$('#custom-login-btn').click(function(){
	 loginWithKakao();
})
	function loginWithKakao() {
 // 로그인 창을 띄웁니다.
 Kakao.Auth.login({
   success: function(authObj) {
       // 로그인 성공시, API를 호출합니다.
       Kakao.API.request({
         url: '/v2/user/me',
         success: function(res) {
       	  /* alert(res); */
         $.ajax({
       	  type:'post',
       	  url:'${pageContext.request.contextPath}/user/logincheck',
       	  data : {
       		  "au_email":res.kakao_account.email,
       		  "au_pwd" : res.id
       		  },
       	  success:function(data){ 
       		  console.log(data);
       		  if(data =="success"){
       			  $('#au_email').val(res.kakao_account.email);
       			  $('#au_pwd').val(res.id);
       			  login();
       		  }if(data=="idfail"){
       			  $.ajax({
       		             type : 'post',
       		             url : '${pageContext.request.contextPath}/user/kakaojoin',
       		             data : {"au_email":res.kakao_account.email,
       		            		 "au_pwd": res.id,
       		           	  	  	 "m_nick":res.properties.nickname,
       		           	  		 // "m_age_range":res.kakao_account.age_rage, 
       		           	  		 // "m_birthday":res.kakao_account.birthday,
       		           	  	  	 "m_gender":res.kakao_account.gender,
       		           	      	 "m_img":res.properties.profile_image,
       		         	  	  	},
       		             dataType:"json",
       		          	 success : function(data) {
       		          		 /* alert(data.au_email+data.au_pwd); */
       		          		  $('#sau_email').val(res.kakao_account.email);
       	        			  $('#sau_pwd').val(res.id);
       	        			  sociallogin();
       		          	 }	
       		          	  ,
       		             error : function(error) {
       		            	 $('#alertmsg').text('로그인에 실패하였습니다.');
       			                $('#alert_pop').modal();
       				             console.log(error);
       				             console.log(error.status);
       				       }
	        		   	})
	        			  
	        		  }
	        	  }
	          
	          })
	      
	          },
	          fail: function(error) {
	            alert(JSON.stringify(error));
	          }
	        });
	      },
	      fail: function(err) {
	        alert(JSON.stringify(err));
	      }
	    });
	 }
	 
}) 
</script> 
    <!-- container -->
    <div class="container">
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">로그인</h3>
            </div>
            <div class="login_wrap">
           	  <div class="login_form">
                <form method="post" data-toggle="validator" role="form" id="loginForm" action='${pageContext.request.contextPath}/login'>
                    <div class="">
                        <strong class="form_title">이메일</strong>
                        <div class="form-group">
                            <label for="" class="sr-only">이메일</label>
                            <input class="form-control" type="email" id="au_email" name="au_email"  placeholder="가입 시 입력한 이메일 주소를 입력해 주새요"   />
                            <div class="help-block with-errors"></div>
                        </div>
                        <strong class="form_title">비밀번호</strong>
                        <div class="form-group">
                            <label for="" class="sr-only">비밀번호</label>
                            <input class="form-control" type="password" name="au_pwd"  id="au_pwd"  placeholder="가입 시 입력한 비밀번호를 입력해 주새요"   />
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
                        <button class="btn btn_aqua" id="login" >로그인</button>
                    </div>
                    <div class="link_text">
                        <a href="${pageContext.request.contextPath}/user/join">회원가입</a>
                        <span>|</span>
                        <a href="${pageContext.request.contextPath}/pwd">비밀번호 찾기</a>
                    </div>
                </form>
                <form method="post" id="SocialloginForm" action='${pageContext.request.contextPath}/login'>
					<input class="form-control" type="hidden" id="sau_email" name="au_email" value="" placeholder="수신 가능한 이메일을 입력해 주세요"   />
					<input class="form-control" type="hidden" id="sau_pwd" name="au_pwd"  value="" placeholder="비밀번호를 입력해 주세요"   />
				</form> 
            </div>
            <div class="sns_wrap">
                <div class="sns_inner">
                    <strong>SNS 계정 로그인</strong>
                    <div class="sns_login">
                        <a class="btn btn_kakao" id="custom-login-btn" >카카오톡으로 로그인</a>
                        <a href="${naverAuthUrl}" class="btn btn_naver" id="naver_id_login">네이버로 로그인</a>
                        <a href="${google_url}" class="btn btn_google" id="google">구글로 로그인</a>
                    </div>
                </div>
            </div>
            <div class="bottom_btn">
                    <a href="${pageContext.request.contextPath}/user/index" class="btn btn_aqua_br w100">다음에 하기</a>
            </div>
          </div>
        </div>
    </div>
  