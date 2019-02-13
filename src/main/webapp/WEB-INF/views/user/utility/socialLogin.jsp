<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	 console.log('${pageContext.request.contextPath}');
	 var au_email = '${au_email}';
	var au_pwd = '${au_pwd}';
	
	/* $.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/login',
		data : {
			"au_email" : au_email,
			"au_pwd" : au_pwd
			},
		success : function() {
				 location.href = "${pageContext.request.contextPath}/user/index"; 
			}   
		}); */ 
}) 
</script>
<body>

</body>
</html>