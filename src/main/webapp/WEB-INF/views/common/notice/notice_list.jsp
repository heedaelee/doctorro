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
            <!-- paging -->
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
    </div>
    <!--// container -->
