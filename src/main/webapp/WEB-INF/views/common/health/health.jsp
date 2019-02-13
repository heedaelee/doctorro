<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img01.jpg" alt="">
                                <span class="health_label">유방암</span>
                            </span>
                            <p class="health_txt">
                                유방암 증가율 1위 한국! <br/>
                                경각심이 필요하다! 
                                <span>유방암 자가진단법 소개</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img02.jpg" alt="">
                                <span class="health_label">관절염</span>
                            </span>
                            <p class="health_txt">
                                다양한 관절염의 종류와
                                <span>비슷한 질환 바로 알기</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img03.jpg" alt="">
                                <span class="health_label">건강습관</span>
                            </span>
                            <p class="health_txt">
                                효과 따라 골라 마시자! 
                                <span>차(茶) 종류별 효능</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img04.jpg" alt="">
                                <span class="health_label">생활습관</span>
                            </span>
                            <p class="health_txt">
                                <span>열대야, </span>
                                현명하게 대처하기
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img03.jpg" alt="">
                                <span class="health_label">건강습관</span>
                            </span>
                            <p class="health_txt">
                                효과 따라 골라 마시자! 
                                <span>차(茶) 종류별 효능</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img04.jpg" alt="">
                                <span class="health_label">생활습관</span>
                            </span>
                            <p class="health_txt">
                                <span>열대야, </span>
                                현명하게 대처하기
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img01.jpg" alt="">
                                <span class="health_label">유방암</span>
                            </span>
                            <p class="health_txt">
                                유방암 증가율 1위 한국! <br/>
                                경각심이 필요하다! 
                                <span>유방암 자가진단법 소개</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img02.jpg" alt="">
                                <span class="health_label">관절염</span>
                            </span>
                            <p class="health_txt">
                                다양한 관절염의 종류와
                                <span>비슷한 질환 바로 알기</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                    <li>
                        <a href="#">
                            <span class="health_img">
                                <img src="${pageContext.request.contextPath}/resource_user/images/health_img03.jpg" alt="">
                                <span class="health_label">건강습관</span>
                            </span>
                            <p class="health_txt">
                                효과 따라 골라 마시자! 
                                <span>차(茶) 종류별 효능</span>
                            </p>
                        </a>
                        <div class="view_info">
                            <span class="i_clip">115</span>
                            <span class="i_view">999</span>
                        </div>
                    </li>
                </ul>
            </div>
            paging
            <div class="paging">
                <ul class="pagination">
                <li class="arrow first"><a href="#"></a></li>
                <li class="arrow prev disable"><a href="#"></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li class="arrow next"><a href="#"></a></li>
                <li class="arrow last"><a href="#"></a></li>
                </ul>
            </div>
        </div>
   