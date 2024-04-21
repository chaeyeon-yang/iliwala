<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
  <script>
    <c:if test="${not empty showAlert}">
    window.onload = function() {
      alert("${showAlert}")
      window.location.href = "<c:url value='/member/login'/>";
    }
    </c:if>
  </script>
  <link rel="stylesheet" href="<c:url value='/css/customer/customer02.css'/>">
</head>

<script>
  function openPwPage(pw) {
    window.open('<c:url value="/customer/askanswerPw" />', '비밀번호 입력', 'width=430,height=300,location=no,status=no,scrollbars=no');
  }

  let askanswer = {
    init: function () {
      $("#searchBtn").click(() => {
        let searchOption = $("select[name='searchOption'] option:selected").val();
        let searchTerm = $("#searchTerm").val();
        if (searchOption === "title") {
          window.location.href = '<c:url value="/customer/searchTitle"/>?term=' + encodeURIComponent(searchTerm);
        } else if (searchOption === "content") {
          window.location.href = '<c:url value="/customer/searchContent"/>?term=' + encodeURIComponent(searchTerm);
        } else {
          window.location.href = '<c:url value="/customer/searchName"/>?term=' + encodeURIComponent(searchTerm);
        }
      })
    }
  };
  $(function () {
    askanswer.init();
  });
</script>

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
          <li><a class="dropdown-item" href="<c:url value="/customer/answeraskPw"/>">1:1문의</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="<c:url value="/customer/answeraskPw"/>">묻고답하기</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="<c:url value="/customer/answeraskPw"/>">FAQ</a></li>
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

      <c:forEach var="q" items="${qnaList}" varStatus="loop">
        <tr>
          <td onclick="openPwPage()">${loop.index + 1}</td>
          <td onclick="openPwPage()"><img src="<c:url value="/img/customer/icon_sct.gif"/>">${q.qnaTitle}</td>
          <td onclick="openPwPage()">${q.qnaName}</td>
          <td onclick="openPwPage()">${q.qnaDate}</td>
        </tr>
      </c:forEach>
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
        <select name="searchOption">
          <option value="title" selected>제목</option>
          <option value="content">내용</option>
          <option value="name">작성자</option>
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
</div>
