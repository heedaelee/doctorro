<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <div class="contents">
            <div class="title_box hidden-xs">
                <h3 class="title">공지사항</h3>
            </div>
            <div class="list_table noti_table">
               <table class="table">
                <caption>list table</caption>
                <tbody>
                <!--noti for each 시작  -->
                <c:forEach items="${firstList}" var="firstList">
                <tr class="i_noti">
                    <td><a href="${pageContext.request.contextPath}/user/notice_view?no_seq=${firstList.no_seq}">${firstList.no_title}</a></td>
                    <td>${firstList.no_regdate}</td>
                </tr>
                </c:forEach>
                <!--normal for each 시작  -->
                <c:forEach items="${noticeList}" var="noticeList">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/user/notice_view?no_seq=${noticeList.no_seq}">${noticeList.no_title}</a></td>
                    <td>${noticeList.no_regdate}</td>
                </tr>
                </c:forEach>
                </tbody>
                </table> 
            </div>
	          <!--여기부터  -->
	            <div class="paging">
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
					
				<form action="notice" method="post" id='frmPaging'>
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
    </div>
    <!--// container -->
