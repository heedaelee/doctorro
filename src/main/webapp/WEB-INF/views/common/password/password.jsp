<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--이메일 체크랑, pwd update 하는거 해야함  -->
    <script>
    $(function(){
    	$('#submit').click(function(){
    		alert($('#userEmail').val());
    		$.ajax({
    			type:'post',
    			url:'${pageContext.request.contextPath}/pwd',
    			data :{
    				"mailto":$('#userEmail').val()
    			},
    			success:function(data){
    				console.log(data);
    				$('#alertmsg').text('비밀번호가 전송되었습니다.');
					$('#alertmsg2').text('');
					$('#userEmail').val("");
					$('#alert_pop').modal();
    			},
    			error : function(error){
    				console.log(error);
    				console.log(error.status);
    			}
    		})
    	})
    	
    	$('#alert_pop').click(function(){
		if($('#alertmsg').text()=='비밀번호가 전송되었습니다.'){
  			window.location.href="user/login";
  			}
	   })
    })
    </script>
    <!-- container -->
    <div class="container">
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">비밀번호 찾기</h3>
            </div>
            <form data-toggle="validator" role="form">
                <strong class="form_title">가입 때 입력하신 이메일 주소를 입력해 주세요</strong>
                <div class="form-group">
                    <label for="email" class="label_txt">이메일</label>
                    <input class="form-control" type="email" id="userEmail" name="userEmail" data-error="잘못된 이메일 형식입니다." id="email" placeholder="이메일을 입력해 주세요"/>
                    <div class="help-block with-errors"></div>
                </div>
            </form>
            <div class="bottom_btn">
                <a id="submit" class="btn btn_aqua" >임시 비밀번호 발송</a>
            </div>
        </div>
    </div>
    <!--// container -->
    <!-- footer web 
    <div class="footer hidden-xs">
        <p class="copy">&copy; Doktoro.All right served</p>
    </div>
    <!-- footer web -->

    <!-- footer m 
    <footer class="footer_m visible-xs hidden-sm">
        <ul class="clearfix">
            <li class="on"><a href=""><span class="f_home"></span>홈</a></li>
            <li><a href=""><span class="f_medical"></span>의료진 찾기</a></li>
            <li><a href=""><span class="f_consult"></span>의료상담</a></li>
            <li><a href=""><span class="f_health"></span>건강정보</a></li>
            <li><a href=""><span class="f_mypage"></span>마이페이지</a></li>
        </ul>
    </footer>
    <!--// footer m -->
</div>
</body>

</html>