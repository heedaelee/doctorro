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
            <h4 class="sub_title">전체 건강정보 100</h4>
            <div class="health_list">
                <ul>
                <!--for each 시작  -->
                <c:forEach items="${list}" var="list">
	                    <li>
	                    <!--디테일 링크  -->
	                        <a href="#">
	                            <span class="health_img">
	                            <!--섬네일  -->
	                                <img src="${list.thumImg}" alt="">
	                                <!--제목  -->
	                                <span class="health_label">${list.contTitle}</span>
	                            </span>
	                            <!--요약내용  -->
	                            <p class="health_txt">${list.Summary}</p>
	                        </a>
	                        <div class="view_info">
	                        <!--추천수  -->
	                            <span class="i_clip">${list.recoCnt}</span>
	                        <!--카운트  -->
	                            <span class="i_view">${list.contViewCnt}</span>
	                        </div>
	                    </li>
                    </c:forEach>
                   <!--for each 종료 -->
                </ul>
            </div>
            paging<!--여기부터  -->
            <div class="paging">
                <ul class="pagination">
                <!-- <li class="arrow first"><a href="#"></a></li> -->
                <li class="arrow prev disable"><a href="#"></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li class="arrow next"><a href="#"></a></li>
                <!-- <li class="arrow last"><a href="#"></a></li> -->
                </ul>
            </div>
        </div>
   