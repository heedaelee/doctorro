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
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<script>
$(document).ready(function() {
	 console.log('${pageContext.request.contextPath}dd');
	//테스트
	/* $('#google').click(function() {
		alert('버튼클릭');
		$.ajax({ 
			type : 'post',
			url : '/doctorro/user/test', //현재페이지가 /user/login -> 원하는건 /user/test 2. user/test 3.${pageContext.request.contextPath}/user/login
			data : {"m_email" : $('#m_email').val(),
				"m_pwd" : $('#m_pwd').val()},
			success : function(data){
				alert("success");
				},
			error : function(error){
				alert('fail');				
			}	
			})
	})  */
	
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
						$.ajax({
							type : 'post',
							url : '${pageContext.request.contextPath}/login',
							data : {
								"m_email" : $('#m_email').val(),
								"m_pwd" : $('#m_pwd').val()
								},
							success : function() {
									location.href = "${pageContext.request.contextPath}/user/index"; 
								} 
							})
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
	$('#alert_pop').click(function(){
		if($('#alertmsg').text()=='아이디가 존재하지 않습니다.'||$('#alertmsg').text()=='로그인에 실패하였습니다.'){
   			window.location.href="login";
   			}
    }
)
	
	
		 //로그인처리
		/* $('#login').click(function() {
			alert('${pageContext.request.contextPath}/user/logincheck');
			// ajax 경로 문제
			$.ajax({ 
				type : 'post',
				url : '${pageContext.request.contextPath}/user/logincheck',
				data : {
					"m_email" : $('#m_email').val().trim(),
					"m_pwd" : $('#m_pwd').val().trim()
						},
				success : function(data) {
					console.log(data)
					if (data == "idfail") {
						alert('로그인실패');
						// location.href = "index.htm?error=id"; 
						} 
					if (data == "passfail") {
						alert('로그인실패');
						// location.href = "index.htm?error=pass"; 
						} 
					else {
						$.ajax({
							type : 'post',
							url : '${pageContext.request.contextPath}/login',
							data : {
								"m_email" : $('#m_email').val().trim(),
								"m_pwd" : $('#m_pwd').val().trim()},
							success : function(data) {
								console.log(data.result);
								if (data.result == "success") {
									alert('로그인성공')
									// location.href = "index.htm"; 
								} 
							}
						})
					}//else 끝
				}
			})//ajax끝
		})//로그인처리 끝 */
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
                <form method="post" data-toggle="validator" role="form" >
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
                        <a href="" class="btn btn_kakao">카카오톡으로 로그인</a>
                        <a href="${naverAuthUrl}" class="btn btn_naver" id="naver_id_login">네이버로 로그인</a>
                        <!-- //네이버아이디로로그인 버튼 노출 영역 보류 -->
						  <!-- <script type="text/javascript">
						  	var naver_id_login = new naver_id_login("sLKp6zrzm0kadWwbPdE0", "http://localhost:8080/doctorro/user/naver");
						  	var state = naver_id_login.getUniqState();
						  	naver_id_login.setButton("white", 2,40);
						  	naver_id_login.setDomain("http://localhost:8080/doctorro/user/login");
						  	naver_id_login.setState(state);
						  	naver_id_login.setPopup();
						  	naver_id_login.init_naver_id_login();
						  </script> -->
                        <a href="" class="btn btn_google" id="google">구글로 로그인</a>
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