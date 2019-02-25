<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">공지사항</h3>
            </div>
            <div class="view_wrap">
                <div class="view_title">
                    <strong>${noticeDto.no_title}</strong>
                    <div class="add_info">
                        <span class="view_num">조회 <span>${noticeDto.no_hit}</span></span>
                        <span class="date">${noticeDto.no_regdate}</span>
                    </div>
                </div>
                <div class="view_con">
                <!--api게시판 형태라 어떻게 들어갈지 나중에  -->
                    <img src="${pageContext.request.contextPath}/resource_user/images/health_img02.jpg" alt="">
                    <p>${noticeDto.no_content}</p>
                </div>
                <div class="view_bottom">
                    <div class="tag_list">
                    	<c:forEach items="${noticeDto.tage_names}" var="tagList">
	                        <span>#${tagList}</span>
                        </c:forEach>
                    </div>
                    <div class="add_file">
                    	<c:forEach items="${noticeDto.ni_names}" var="imgList">
	                        <span>${imgList}</span>
                        </c:forEach>
                    </div>
                </div>
                <div class="bottom_btn">
                    <a href="${pageContext.request.contextPath}/resource_user/images/health_img02.jpg" class="list_btn">목록</a>
                </div>
            </div>
        </div>
    </div>
    <!--// container -->
  