<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--list.네임  -->
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">건강정보</h3>
            </div>
            <div class="search_form">
                <div class="form-group search_input">
                    <label for="" class="sr-only">검색</label>
                    <input class="form-control" type="search" id="search" value="" placeholder="검색어를 입력하세요">
                    <button class="btn_search">검색</button>
                </div>
            </div>
            <h4 class="sub_title">전체 게시물 (${totalCount})</h4>
            <div class="health_list">
                <ul>
                <!--for each 시작  -->
                <c:forEach items="${list}" var="list">
	                    <li>
	                    <!--디테일 링크  -->
	                        <a href="#">
	                            <span class="health_img">
	                           <c:choose>
		                            <c:when test="${list.thumImg eq 'http://www.samsunghospital.com/upload/'}">
		                            	<img src="${pageContext.request.contextPath}/resource_user/images/no_img.jpg" alt="">
		                            </c:when>
		                            <c:when test="${list.thumImg eq 'http://www.samsunghospital.com/upload//'}">
		                            	<img src="${pageContext.request.contextPath}/resource_user/images/no_img.jpg" alt="">
		                            </c:when>
		                            <c:otherwise>
		                            <!--섬네일  -->
		                                <img src="${list.thumImg}" alt="" onerror="this.src='${pageContext.request.contextPath}/resource_user/images/no_img.jpg'">
		                                <!--요약내용이 삼성병원에서 너무 길게줌  -->
		                                <%-- <span class="health_label">${list.contTitle}</span> --%>
		                            </c:otherwise>
	                            </c:choose>
	                            </span>
	                            <!--제목  -->
	                            <p class="health_txt">${list.contTitle}</p>
	                        </a>
	                        <div class="view_info">
	                        <!--스크랩  -->
	                            <span class="i_clip">${list.recoCnt}</span>
	                        <!--조회수  -->
	                            <span class="i_view">${list.contViewCnt}</span>
	                        </div>
	                    </li>
                    </c:forEach>
                   <!--for each 종료 -->
                </ul>
            </div>
            paging<!--여기부터  -->
            <div class="paging">
            <!-- 5. paging view -->
				<ul class="pagination">
					<c:if test="${p.pageStartNum ne 1}">
						<!-- 이전 페이지가 필요한지 아닌지 -->
						<!--맨 첫페이지 이동 -->
						<li class="arrow first"><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
						<!--이전 페이지 이동 -->
						<li class="arrow prev"><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
					</c:if>
		
					<!--보여지는 페이지번호 -->
					<c:forEach var='i' begin="${p.pageStartNum}" end="${p.pageLastNum}"
						step="1">
						<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
					</c:forEach>
		
					<c:if test="${p.lastChk}">
						<!--false/true 다음페이지가 필요한지 아닌지  -->
						<!--다음 페이지 이동 -->
						<li class="arrow next"><a onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
						<!--마지막 페이지 이동 -->
						<li class="arrow last"><a onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
					</c:if>
					<!-- 백업 <ul부터..
		                <li class="arrow first"><a href="#"></a></li>
		                <li class="arrow prev disable"><a href="#"></a></li>
		                <li class="active"><a href="#">1</a></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li class="arrow next"><a href="#"></a></li>
		                <li class="arrow last"><a href="#"></a></li>
		                 -->
				</ul>
				
			<form action="health" method="post" id='frmPaging'>
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
   