
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="<c:url value="/css/community/community.css"/>">

<script>
    let notice = {
        init: function () {
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
<div class="search container">
    <table>
        <tr>
            <td>
                <select name="내용" id="">
                    <option value="">제목</option>
                    <option value="">내용</option>
                    <option value="">작성자</option>
                </select>
            </td>
            <td>
                <input type="text">
            </td>
            <td>
                <input type="image" src="<c:url value="/img/community/search.gif"/>">
            </td>
        </tr>
    </table>
</div>
