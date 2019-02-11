<%--
  Created by IntelliJ IDEA.
  User: adguy
  Date: 2019-01-29
  Time: 오전 10:16
  To change this template use File | Settings | File Templates.
--%>
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
    <!--네이버 로그인 추가  -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <!--네이버 로그인 추가 종료  -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/validator.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/slick.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <!--카카오톡 로그인  -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<script>
$(document).ready(function() {
	 console.log('${pageContext.request.contextPath}dd');
	
	//네이버
	var na="${naver.m_email}"
	var nap="${naver.m_pwd}"
	if(na){
		alert(na);
		$('#m_email').val(na);
		$('#m_pwd').val(nap);
		login();
	}
	//구글
	var go="${google.m_email}"
	var gop="${google.m_pwd}"
	if(go){
		alert(go);
		$('#m_email').val(go);
		$('#m_pwd').val(gop);
		login();
	}	
	
	//로그인 처리
	 $('#login').click(function() {
		 event.preventDefault()
		 alert('아뒤'+$('#m_email').val() + '\n'+ '비번'+$('#m_pwd').val());
		 
		$.ajax({
			type:'post',
			url : '${pageContext.request.contextPath}/user/logincheck',
			data : {
				"m_email" : $('#m_email').val(),
				"m_pwd" : $('#m_pwd').val()
					},
				success : function(data) {
					if (data == "success") {
						/*로그인 형식 no ajax 변경
						$.ajax({
							type : 'post',
							async : false,
							url : '${pageContext.request.contextPath}/login',
							data : {
								"m_email" : $('#m_email').val(),
								"m_pwd" : $('#m_pwd').val()
								},
							success : function() {
									 location.href = "${pageContext.request.contextPath}/user/index";  
								}
							}) */
							login();
						}
					 if (data == "idfail") {
						$('#alertmsg').text('아이디가 존재하지 않습니다.');
						$('#m_pwd').val("");
	                    $('#alert_pop').modal();
						/* location.href = "login?error=id"; */ 
						} 
					if (data == "passfail") {
						$('#alertmsg').text('비밀번호가 맞지 않습니다.');
						$('#m_pwd').val("");
						$('#alert_pop').modal();
						/* location.href = "login?error=pass"; */ 
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
	
	$('#alert_pop').click(function(){
		if($('#alertmsg').text()=='아이디가 존재하지 않습니다.'||$('#alertmsg').text()=='로그인에 실패하였습니다.'){
   			window.location.href="login";
   			}
	   }
	)
	
	$(function(){
  /*카카오톡 로그인  */ 
  Kakao.init('f2911550662316c4cd821fd8300158df');
  
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
        	  alert(res);
          $.ajax({
        	  type:'post',
        	  url:'${pageContext.request.contextPath}/user/logincheck',
        	  data : {
        		  "m_email":res.kakao_account.email,
        		  "m_pwd" : res.id
        		  },
        	  success:function(data){ 
        		  console.log(data);
        		  if(data =="success"){
        			  $('#m_email').val(res.kakao_account.email);
        			  $('#m_pwd').val(res.id);
        			  /* $.ajax({
                          type : 'post',
                          url : '${pageContext.request.contextPath}/login',
                          data :{"m_email":res.kakao_account.email,
                        	  	 "m_pwd" : res.id},
                          success : function(){
                        	  alert('${pageContext.request.contextPath}/user/index')
                        	  location.href="${pageContext.request.contextPath}/user/index";
                          }
                          }); */
        			  login();
        		  }if(data=="idfail"){
        			  $.ajax({
        		             type : 'post',
        		             url : '${pageContext.request.contextPath}/user/kakaojoin',
        		             data : {"m_email":res.kakao_account.email,
        		            		 "m_pwd": res.id,
        		           	  	  	 "m_nick":res.properties.nickname,
        		           	  		 // "m_age_range":res.kakao_account.age_rage, 
        		           	  		 // "m_birthday":res.kakao_account.birthday,
        		           	  	  	 "m_gender":res.kakao_account.gender,
        		           	      	 "m_img":res.properties.profile_image,
        		         	  	  	},
        		             dataType:"json",
        		          	 success : function(data) {
        		          		 alert(data.m_email+data.m_pwd);
        		          		  $('#m_email').val(res.kakao_account.email);
        	        			  $('#m_pwd').val(res.id);
        		          		  /* $.ajax({
        		                      type : 'post',
        		                      url : '${pageContext.request.contextPath}/login',
        		                      data :{"m_email":data.m_email,
        		                    	  	 "m_pwd" : data.m_pwd},
        		                      success : function(){
        		                    	   location.href="${pageContext.request.contextPath}/user/index"; 
        		                      }
        		                      }); */
        	        			  login();
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
 })
		 
	})
</script>
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
                <form method="post" data-toggle="validator" role="form" id="loginForm" action='${pageContext.request.contextPath}/login'>
                    <div class="">
                        <strong class="form_title">이메일</strong>
                        <div class="form-group">
                            <label for="" class="sr-only">이메일</label>
                            <input class="form-control" type="email" id="m_email" name="m_email"  placeholder="수신 가능한 이메일을 입력해 주세요" data-error="입력하신 정보가  올바르지 않습니다, 다시 한번 입력해 주세요." required />
                            <div class="help-block with-errors"></div>
                        </div>
                        <strong class="form_title">비밀번호</strong>
                        <div class="form-group">
                            <label for="" class="sr-only">비밀번호</label>
                            <input class="form-control" type="password" name="m_pwd"  id="m_pwd" data-minlength="8" placeholder="비밀번호를 입력해 주세요" data-error="입력하신 정보가  올바르지 않습니다, 다시 한번 입력해 주세요." required />
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
                        <a href="search_id.html">비밀번호 찾기</a>
                    </div>
                </form> 
            </div>
            <div class="sns_wrap">
                <div class="sns_inner">
                    <strong>SNS 계정 로그인</strong>
                    <div class="sns_login">
                        <a class="btn btn_kakao" id="kakao-login-btn">카카오톡으로 로그인</a>
                        <a href="${naverAuthUrl}" class="btn btn_naver" id="naver_id_login">네이버로 로그인</a>
                        <a href="${google_url}" class="btn btn_google" id="google">구글로 로그인</a>
                    </div>
                </div>
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
                        <p>다시 확인해 주세요</p>
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
    <!--// alert -->
</div>
</body>

</html>