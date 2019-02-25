<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <div class="contents pd0">
            <div class="title_box hidden-xs">
                <h3 class="title">이벤트</h3>
            </div>
            <div class="event_list">
                <ul>
                	<!--event for each 시작  -->
                	<c:forEach items="${eventList}" var="eventList">
	                  <c:if test="${eventList.ev_isIng_YN eq 'Y'}">
	                    <li>
	                  </c:if>
	                  <c:if test="${eventList.ev_isIng_YN eq 'N'}">
	                    <li class="evnet_end">
	                  </c:if>
	                        <a href="${pageContext.request.contextPath}/user/event_view?ev_seq=${eventList.ev_seq}">
	                            <div class="event_txt">
	                                <span class="status">
	                                <c:if test="${eventList.ev_isIng_YN eq 'Y'}">진행중</c:if>
	                                <c:if test="${eventList.ev_isIng_YN eq 'N'}">종료</c:if>
	                                </span>
	                                <strong>${eventList.ev_title}</strong>
	                                <p>${eventList.ev_subTitle}</p>
	                                <span class="date">${eventList.ev_from}~${eventList.ev_to}</span>
	                            </div>
	                            <span class="event_img">
	                                <img src="${pageContext.request.contextPath}/resource_user/images/event/event_img01.jpg" alt="">
	                            </span>
	                        </a>
	                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="paging hidden-xs">
                <!-- 5. paging view -->
					<ul class="pagination">
						<c:if test="${p.pageStartNum ne 1}">
							<!-- 이전 페이지가 필요한지 아닌지 -->
							<!--맨 첫페이지 이동 -->
							<li class="arrow first"><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'></a></li>
							<!--이전 페이지 이동 -->
							<li class="arrow prev"><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'></a></li>
						</c:if>
						<!--보여지는 페이지번호 -->
						<c:forEach var='i' begin="${p.pageStartNum}" end="${p.pageLastNum}"
							step="1">
							<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
						</c:forEach>
			
						<c:if test="${p.lastChk}">
							<!--false/true 다음페이지가 필요한지 아닌지  -->
							<!--다음 페이지 이동 -->
							<li class="arrow next"><a onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'></a></li>
							<!--마지막 페이지 이동 -->
							<li class="arrow last"><a onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'></a></li>
						</c:if>
					</ul>
					<form action="event" method="post" id='frmPaging'>
						<!--출력할 페이지번호, 출력할 페이지 시작 번호, 출력할 리스트 갯수 -->
						<input type='hidden' name='index' id='index' value='${p.index}'>
						<input type='hidden' name='pageStartNum' id='pageStartNum'value='${p.pageStartNum}'> 
						<input type='hidden'name='listCnt' id='listCnt' value='${p.listCnt}'> 
						<input type="hidden" name="searchFiled" value="${p.searchFiled }" />
						<!-- //검색조건 -->
						<input type="hidden" name="searchValue" value="${p.searchValue }" />
						<!-- //검색어 -->
					</form>
           	 </div>
        </div>