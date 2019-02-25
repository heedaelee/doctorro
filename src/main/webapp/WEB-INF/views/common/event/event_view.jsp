<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">이벤트</h3>
            </div>
            <div class="view_wrap">
                <div class="view_title">
                    <span class="status">
	                    <c:if test="${eventDto.ev_isIng_YN eq 'Y'}">진행중</c:if>
		                <c:if test="${eventDto.ev_isIng_YN eq 'N'}">종료</c:if>
                    </span>
                    <strong>${eventDto.ev_title}</strong>
                    <div class="add_info">
                        <span class="view_num">조회 <span>${eventDto.ev_hit}</span></span>
                        <span class="date">${eventDto.ev_regdate}</span>
                    </div>
                </div>
                <div class="view_con">
                    <img src="${pageContext.request.contextPath}/resource_user/images/health_img02.jpg" alt="">
                    <p>${eventDto.ev_content}</p>
                </div>
                <div class="view_bottom">
                    <div class="add_file">
                        <c:forEach items="${eventDto.ei_names}" var="imgList">
	                        <span>${imgList}</span>
                        </c:forEach>
                    </div>
                </div>
                <div class="bottom_btn hidden-xs">
                    <a href="${pageContext.request.contextPath}/user/event" class="list_btn">목록</a>
                </div>
            </div>
        </div>