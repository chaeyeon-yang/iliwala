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
  <link rel="stylesheet" href="<c:url value='/css/customer/customer01.css'/>">
</head>

<script>
  let inquiry = {
    init: function () {
      if (msg) {

      }
      $("#okBtn").click(() => {
        this.send();
      })
    },
    send: function () {
      $("#questionForm").attr({
        'method': 'post',
        'action': "<c:url value="/customer/inquiryimpl" />"
      });
      $("#questionForm").submit()
      alert("문의가 접수되었습니다.")
    }
  }
  $(function () {
    inquiry.init()
  })
</script>


<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
  <div class="commonContent1">
    <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
        style="width: 100%; height: 100%;">
    <div class="commonContent2 text-center">
      <div>
        <h3>COSTOMER</h3>
      </div>
      <div>
        <p><img src="<c:url value="/img/icon-home.png"/>"> > 고객지원 > 1:1문의</p>
      </div>
    </div>
  </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="<c:url value="/index.html"/>"><button class="homeBtn">H</button></a>
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
            1:1문의
        </a>
        <ul class="dropdown-menu asd">
          <li><a class="dropdown-item" href="<c:url value="/customer/costomer01.html" />">1:1문의</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="<c:url value="/customer/costomer02.html" />">묻고답하기</a></li>
          <li><hr class="dropdown-divider"></li>
          <li><a class="dropdown-item" href="<c:url value="/customer/costomer03.html" />">FAQ</a></li>
        </ul>
      </li>
    </ul>
  </div>
</nav>

<!-- 1:1문의 -->
<div class="communitySection2 container text-center">
  <div>
    <div>1:1문의</div>
    <div>The design and maintenance are excellent.</div>
  </div>
  <div class="question">
    <form action="" name="questionForm" id="questionForm">
      <table>
        <tr>
          <td>구분</td>
          <td><select>
                <option value="1">로그인</option>
                <option value="2">회원가입</option>
                <option value="3">이용안내</option>
              </select>
          </td>
        </tr>
        <tr>
          <td>성명</td>
          <td><input type="text" class="inputStyle1" id="name" name="one2oneName"></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td><input type="text" class="inputStyle1" id="phone" name="one2onePhone"></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" class="inputStyle2" id="email" name="one2oneEmail"></td>
        </tr>
        <tr>
          <td>주소</td>
          <td><input type="text" class="inputStyle2" id="address" name="one2oneAddress"></td>
        </tr>
        <tr>
          <td>제목</td>
          <td><input type="text" class="inputStyle2" id="title" name="one2oneTitle"></td>
        </tr>
        <tr>
          <td>설명</td>
          <td><textarea title="content" name="one2oneContent" rows="10" style="width: 90%;"></textarea></td>
        </tr>
      </table>
      <div class="btn">
        <input id="okBtn" type="button" style="background-image: url('<c:url value="/img/customer/btn_confirm.gif"/>'); background-size: cover; width: 68px; height: 32px; border: none;">
        <input type="image" src="<c:url value="/img/customer/btn_cancel.gif"/>">
      </div>
    </form>
  </div>
</div>
