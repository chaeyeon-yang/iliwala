<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
  <link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>" />
</head>

    <!-- 메인 -->
    <!-- COMMON -->

    <div class="commonSection1">
      <div class="commonContent1">
        <img
          src="/img/member/sub-visual01.jpg"
          style="width: 100%; height: 100%"
        />
        <div class="commonContent2 text-center">
          <div>
            <h3>관리자페이지</h3>
          </div>
          <div>
            <p><img src="/img/icon-home.png" /> > 관리자페이지</p>
          </div>
        </div>
      </div>
    </div>

      <!-- 메인 -->
      <div id="adminMain">
        <!-- 사이드메뉴 -->
        <div id="adminSide">
          <ul>
            <li><a href="<c:url value="/admin/member" />">회원 관리</a></li>
            <li><a href="<c:url value="/admin/notice" />" class="adminSideActive">공지사항 관리</a></li>
          </ul>
        </div>
        <!-- 메인 -->
        <div id="adminSection">
          <div class="adminDiv">
            <h3>공지사항 관리</h3>
          </div>
          <div class="adminDiv">
            검색 옵션
            <select name="searchOption" id="search_select">
              <option value="all" selected>전체</option>
              <option value="id">아이디</option>
              <option value="name">성명</option>
              <option value="email">이메일</option>
            </select>
            <input type="text" name="search_keyword" id="searchTerm" value="">
            <input id="searchBtn" typeof="button" style="background-image: url('<c:url value="/img/community/search.gif"/>'); background-size: cover; width: 26px; height: 25px; border: 1px solid black; margin-bottom: 5px">
          </div>
          <div class="adminDiv">
            정렬
            <select class="size" name="orderOption" id="orderOption">
              <option value=0 selected>아이디 오름차순</option>
              <option value=1>아이디 내림차순</option>
              <option value=2>가입일 오름차순</option>
              <option value=3>가입일 내림차순</option>
            </select>
          </div>
          <div class="adminDiv2" id="tableTitle">
            <div>목록 ${noticeCnt}건</div>
            <div>한페이지 행수
              <select class="size" name="pageOption" id="pageOption">
                <option value="" selected>전체 보기</option>
                <option value="page5">5개만 보기</option>
                <option value="page10">10개만 보기</option>
              </select>
            </div>
          </div>
          <div class="">
            <table class="adminTable">
              <thead>
              <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="n" items="${notices}" varStatus="loop">
                <tr>
                  <td>${loop.index + 1}</td>
                  <td>${n.noticeTitle}</td>
                  <td>${n.noticeMemberId}</td>
                  <td>${n.noticeDate}</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <div class="d-flex justify-content-end"><a href="<c:url value="/admin/writeNotice"/>">공지글 쓰기</a></div>
          </div>
        </div>
      </div>
    </div>

    <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
    <!-- <script>CKEDITOR.replace('editor4');</script> -->
    <script>
      var ckeditor_config = {
        resize_enaleb: false,
        enterMode: CKEDITOR.ENTER_BR,
        shiftEnterMode: CKEDITOR.ENTER_P,
        filebrowserUploadUrl: "/ckUpload",
      };
      CKEDITOR.replace("editor4", ckeditor_config);
    </script>
