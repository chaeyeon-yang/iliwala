
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/community/community.css"/>">

<script>
    let notice = {
        init: function () {
            $("#searchBtn").click(() => {
                let searchOption = $("select[name='searchOption'] option:selected").val();
                let searchTerm = $("#searchTerm").val();
                if (searchOption === "title") {
                    window.location.href = '<c:url value="/notice/searchTitle"/>?term=' + encodeURIComponent(searchTerm);
                }
                <%--else {--%>
                <%--    window.location.href = '<c:url value="/notice/searchTitle"/>?term=' + encodeURIComponent(searchTerm);--%>
                <%--}--%>
            })
        }
    };
    $(function () {
        notice.init();
    });
</script>
<!-- 공지사항 -->
<div class="communitySection2 container text-center">
    <div>
        <div>공지사항</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="Notice">
        <table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
            <c:forEach var="n" items="${notices}" varStatus="loop">
                <tr>
                    <td><a href="<c:url value="/notice/get"/>?no=${n.noticeIdx}">${loop.index + 1}</a></td>
                    <td>${n.noticeTitle}</td>
                    <td>${n.noticeDate}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<!-- search bar -->
<form class="search container">
    <table>
        <tr>
            <td>
                <select name="searchOption">
                    <option value="title" selected>제목</option>
                    <option value="content">내용</option>
                </select>
            </td>
            <td>
                <input type="text" id="searchTerm">
            </td>
            <td>
                <input id="searchBtn" typeof="button" style="background-image: url('<c:url value="/img/community/search.gif"/>'); background-size: cover; width: 26px; height: 25px; border: 1px solid black; margin-bottom: 5px">
            </td>
        </tr>
    </table>
</form>
