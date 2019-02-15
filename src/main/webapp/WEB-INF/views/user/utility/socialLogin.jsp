<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function calls()
{
	/* alert(document.getElementById("au_email").value); */
var f = document.getElementById("loginForm"); // form 엘리멘트 생성 
f.submit();
}
</script>
<body onload="calls()">
<form method="post" id="loginForm" action='${pageContext.request.contextPath}/login'>
<input class="form-control" type="hidden" id="au_email" name="au_email" value="${naver.au_email}" placeholder="수신 가능한 이메일을 입력해 주세요"   />
<input class="form-control" type="hidden" name="au_pwd"  id="au_pwd" value="${naver.au_pwd}" placeholder="비밀번호를 입력해 주세요"   />
</form>

</body>
</html>