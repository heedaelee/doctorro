<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${pageName eq'login'||pageName eq'password'||pageName eq'join'}">
	    <%-- header web --%>
	    <div class="header hidden-xs">
	        <div class="inner_wrap">
	            <h1 class="logo"><a href="${pageContext.request.contextPath}/user/login">닥터로</a></h1>
	        </div>
	    </div>
	    <%--// header web --%>
	    <%-- header m --%>
	    <div class="m_header visible-xs hidden-sm">
	        <button class="btn_back">back</button>
	     <c:if test="${pageName eq'login'||pageName eq'join'}">
	        <h2>로그인 및 회원가입</h2>
	     </c:if>
	     <c:if test="${pageName eq'password'}">
	        <h2>비밀번호 찾기</h2>
	     </c:if>
	    </div>
	    <%--// header m --%>
	</c:when><%--여기까지  --%>
	<c:otherwise>
			<%-- header web --%>
		    <div class="header hidden-xs">
		        <button class="btn_menu" data-target="#gnb_modal" data-toggle="modal">매뉴</button>
		        <h1 class="logo"><a href="${pageContext.request.contextPath}/user/index">닥터로</a></h1>
		        <div class="inner_wrap">
			        <h2 class="title">
			        	<c:choose>
			        		<c:when test="${pageName eq'notice_list'||pageName eq'notice_view'}">
			        			공지사항
			        		</c:when>
			        		<c:when test="${pageName eq'event_list'||pageName eq'event_view'}">
			        			이벤트
			        		</c:when>
			        		<c:otherwise>
			        			건강정보
			        		</c:otherwise>
			        	</c:choose>
			        </h2>
		        </div>
		        <ul class="nav_link">
		            <li class="btn_alarm"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/main/index.html#">알림</a></li>
		            <li class="btn_mypage"><a href="http://rsad.co.kr/client/doctoro/dr_public/html/main/index.html#">마이페이지</a></li>
		        </ul>
		    </div>
		    <%--// header web --%>
		    <%-- header m --%>
		   <c:choose>
		   	<c:when test="${pageName eq'notice_list'||pageName eq'notice_view'}">
		   		 <div class="m_header visible-xs hidden-sm">
			        <button class="btn_back">back</button>
			        <h2 class="title">공지사항</h2>
			    </div>
		   	</c:when>
		   	<c:when test="${pageName eq'event_list'||pageName eq'event_view'}">
		   		 <div class="m_header visible-xs hidden-sm">
			        <button class="btn_back">back</button>
			        <h2 class="title">이벤트</h2>
			    </div>
		   	</c:when>
		   	<c:otherwise>
		   		<div class="m_header main_header visible-xs hidden-sm">
		        <button class="btn_menu_m" data-target="#gnb_modal" data-toggle="modal">메뉴</button>
		        <h1 class="logo"><a href="${pageContext.request.contextPath}/user/index">닥터로</a></h1>
		        <button class="btn_alarm">알람</button>
		    </div>
		   	</c:otherwise>
		   </c:choose>
		    <%--// header m --%>
		     <%-- container --%>
		    <div class="container">
		  <c:choose>
			  	<c:when test="${pageName eq'health'||pageName eq'disease'||pageName eq'drug'||pageName eq'drug'
			  	||pageName eq'notice_list'||pageName eq'event_list'||pageName eq'event_view'}">
			    	 <div class="sub_nav">
		                <ul>
		                	<c:choose>
		                		<c:when test="${pageName eq'health'||pageName eq'disease'||pageName eq'drug'||pageName eq'drug'}">
				                	<c:choose>
				                		<c:when test="${pageName eq'health'}">
				                		<li class="on"><a href="${pageContext.request.contextPath}/user/health">건강정보</a></li>
				                		</c:when>
					                    <c:otherwise>
					                    <li><a href="${pageContext.request.contextPath}/user/health">건강정보</a></li>
					                    </c:otherwise>
					                 </c:choose>
					                 <c:choose>
				                		<c:when test="${pageName eq'disease'}">
				                		<li class="on"><a href="${pageContext.request.contextPath}/user/disease">건강정보</a></li>
				                		</c:when>
					                    <c:otherwise>
					                    <li><a href="${pageContext.request.contextPath}/user/disease">질병정보</a></li>
					                    </c:otherwise>
					                 </c:choose>
					                 <c:choose>
				                		<c:when test="${pageName eq'drug'}">
				                		<li class="on"><a href="${pageContext.request.contextPath}/user/drug">제약정보</a></li>
				                		</c:when>
					                    <c:otherwise>
					                    <li><a href="${pageContext.request.contextPath}/user/drug">제약정보</a></li>
					                    </c:otherwise>
					                 </c:choose>
					            </c:when>
					            <c:when test="${pageName eq 'notice_list'}">
					            	<li><a href="#">알림</a></li>
                					<li class="on"><a href="#">공지사항</a></li>
					            </c:when>
					            <c:when test="${pageName eq 'event_list'||pageName eq 'event_view'}">
					            	 <li class="on"><a href="#">이벤트</a></li>
					            </c:when>     
			               </c:choose>  
		                </ul>
			        </div>
			      </c:when>
			     <c:when test="${pageName eq'health'||pageName eq'disease'||pageName eq'drug'||pageName eq'drug'
			  	||pageName eq'notice_list'||pageName eq'notice_view'||pageName eq'event_list'}">
			        <div class="breadcrumb_wrap hidden-xs">
			          <ul>
			            <li><a href="${pageContext.request.contextPath}/user/index">Home</a></li>
		           			 <c:if test="${pageName eq'health'}">
		                		 <li><a href="${pageContext.request.contextPath}/user/health">건강정보</a></li>
			           			 <li>건강정보</li>
			                 </c:if>
			                 <c:if test="${pageName eq'disease'}">
		                		 <li><a href="${pageContext.request.contextPath}/user/disease">질병정보</a></li>
			           			 <li>질병정보</li>
			                 </c:if>
			                 <c:if test="${pageName eq'drug'}">
		                		 <li><a href="${pageContext.request.contextPath}/user/drug">제약정보</a></li>
			           			 <li>제약정보</li>
			                 </c:if>
			                 <c:if test="${pageName eq'notice_list'||pageName eq'notice_list'}">
            					<li><a href="${pageContext.request.contextPath}/user/notice_list">공지사항</a></li>
			                 </c:if>
			                 <c:if test="${pageName eq'event_list'||pageName eq'event_view'}">
            					<li>이벤트</li>
			                 </c:if>
			          </ul>
			        </div>
			       </c:when>
		 </c:choose>
	</c:otherwise>
</c:choose>

