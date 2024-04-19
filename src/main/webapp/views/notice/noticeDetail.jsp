
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
  <link rel="stylesheet" href="<c:url value="/css/community/community.css" />">
</head>
<script>
  console.log("notice", notice)
</script>
  <!-- 메인 -->
  <!-- 공지사항 -->
  <!-- COMMON -->
  <div class="commonSection1">
    <div class="commonContent1">
      <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
          style="width: 100%; height: 100%;">
      <div class="commonContent2 text-center">
        <div>
          <h3>COMMUNITY</h3>
        </div>
        <div>
          <p><img src="<c:url value="/img/icon-home.png"/>"> > 커뮤니티 > 공지사항</p>
        </div>
      </div>
    </div>
  </div>
  <!-- COMMON - 드랍다운 -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="<c:url value="/"/>"><button class="homeBtn">H</button></a>
      <ul class="navbar-nav mr-auto navbar-nav-scroll" 
          style="max-height: 100px;">
        
        <li class="nav-item dropdown dropdownHide">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" 
            data-toggle="dropdown" aria-expanded="false">
            커뮤니티
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <li><a class="dropdown-item" href="#">회사소개</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">사업분야</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">제품안내</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">커뮤니티</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">고객지원</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" 
              role="button" data-toggle="dropdown" aria-expanded="false">
              공지사항
          </a>
          <ul class="dropdown-menu asd">
            <li><a class="dropdown-item" href="<c:url value="/notice/"/>">공지사항</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">홍보자료</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">채용안내</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </nav>

  <!-- 공지사항 상세 -->
  <div class="communitySection2 container text-center">
    <div>
      <div>공지사항</div>
      <div>The design and maintenance are excellent.</div>
    </div>
    <div class="NoticeContent">
      <table>
        <tr>
          <th>제목</th>
          <td>${notice.noticeTitle}</td>
        </tr>
        <tr>
          <th>작성일</th>
          <td>${notice.noticeDate}</td>
        </tr>
        <tr>
          <td colspan="2">${notice.noticeContent}</td>
        </tr>
      </table>
      <div>
        <input type="image" onclick="window.location.href = '<c:url value="/notice/"/>'"
          src="<c:url value="/img/community/list.gif"/>">
      </div>
    </div>

  </div>
