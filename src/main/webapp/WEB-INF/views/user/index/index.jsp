<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- 시큐리티 태그 삽입 -->
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<!--소셜 회원가입시 모달  -->
<c:if test="${sessionScope.join != null}">
				<script type="text/javascript">
				$(function(){
					$('#alertmsg').text('회원가입이 완료되었습니다.');
					$('#alertmsg2').text('');
					$('#alert_pop').modal();
				})
				</script>
		<c:remove var="join" scope="session"/>
</c:if>
		<div class="contents" style=";background: #ff00ff">
            <div class="title_box hidden-xs">
                <h3 class="title">메인페이지</h3>
            </div>
            sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>sss<br/>
        </div>