<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<jsp:forward page="/login">
	<jsp:param value="${m_email}" name="m_email"/>
	<jsp:param value="${m_pwd}" name="m_email"/>
</jsp:forward>

</body>
</html>