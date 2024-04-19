<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
  <link rel="stylesheet" href="<c:url value="/css/customer/customer02.css"/>">
</head>

<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
  <div class="commonContent1">
    <img src="<c:url value="/img/member/sub-visual02.jpg" />"
        style="width: 100%; height: 100%;">
    <div class="commonContent2 text-center">
      <div>
        <h3>COSTOMER</h3>
      </div>
      <div>
        <p><img src="<c:url value="/img/icon-home.png"/>"> > 고객지원 > 묻고답하기</p>
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
          고객지원
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
            묻고답하기
        </a>
        <ul class="dropdown-menu asd">
          <li><a class="dropdown-item" href="<c:url value="/customer/inquiry"/>">1:1문의</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="<c:url value="/customer/askanswer"/>">묻고답하기</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="<c:url value="/customer/askanswer"/>">FAQ</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

<!-- 묻고답하기 -->
<div class="communitySection2 container text-center">
  <div>
    <div>묻고답하기</div>
    <div>The design and maintenance are excellent.</div>
  </div>
  <div class="qna">
    <table>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
      <tr onclick="openWindow(5)">
        <td>5</td>
        <td><img src="<c:url value="/img/customer/icon_sct.gif" />">문의사항에 대해 자세한 답변 부탁합니다.</td>
        <td>hong</td>
        <td>2019-06-19</td>
      </tr>
      <tr onclick="openWindow(4)">
        <td>4</td>
        <td><img src="<c:url value="/img/customer/icon_sct.gif"/>">문의사항에 대해 자세한 답변 부탁합니다.</td>
        <td>hong</td>
        <td>2019-06-19</td>
      </tr>
      <tr onclick="openWindow(3)">
        <td>3</td>
        <td><img src="<c:url value="/img/customer/icon_sct.gif" />">문의사항에 대해 자세한 답변 부탁합니다.</td>
        <td>hong</td>
        <td>2019-06-19</td>
      </tr>
      <tr onclick="openWindow(2)">
        <td>2</td>
        <td><img src="<c:url value="/img/customer/icon_sct.gif"/>">문의사항에 대해 자세한 답변 부탁합니다.</td>
        <td>hong</td>
        <td>2019-06-19</td>
      </tr>
      <tr onclick="openWindow(1)">
        <td>1</td>
        <td><img src="<c:url value="/img/customer/icon_sct.gif" />">문의사항에 대해 자세한 답변 부탁합니다.</td>
        <td>hong</td>
        <td>2019-06-19</td>
      </tr>
    </table>
  </div>
</div>

<!-- search bar -->
<div class="search container">
  <div>
    <img onclick="window.location.href='customer02_2.html'"
    src="<c:url value="/img/customer/write.gif" />">
  </div>
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
        <input type="image" src="<c:url value="/img/customer/search.gif" />">
      </td>
    </tr>
  </table>
</div>
