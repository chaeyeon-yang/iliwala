<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
	<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
</head>

<script>
	let memberManage = {
		init: function () {
			$("#searchBtn").click(() => {
				let searchOption = $("select[name='searchOption'] option:selected").val();
				let searchTerm = $("#searchTerm").val();
				if (searchOption === "id") {
					window.location.href = '<c:url value="/admin/searchId"/>?term=' + encodeURIComponent(searchTerm);
				} else if (searchOption === "name") {
					window.location.href = '<c:url value="/admin/searchName"/>?term=' + encodeURIComponent(searchTerm);
				} else if (searchOption === "email") {
					window.location.href = '<c:url value="/admin/searchEmail"/>?term=' + encodeURIComponent(searchTerm);
				} else {
					window.location.href = '<c:url value="/notice/searchContent"/>?term=' + encodeURIComponent(searchTerm);
				}
			})
		}
	};
	$(function () {
		memberManage.init();
	});
</script>
  <!-- 메인 -->
  <!-- COMMON -->
  
  <div class="commonSection1">
    <div class="commonContent1">
      <img src="<c:url value="/img/member/sub-visual01.jpg"/>"
          style="width: 100%; height: 100%;">
      <div class="commonContent2 text-center">
        <div>
          <h3>관리자페이지</h3>
        </div>
        <div>
          <p><img src="<c:url value="/img/icon-home.png" />"> > 관리자페이지</p>
        </div>
      </div>
    </div>
  </div>
  
  <div id="adminMain">
    <!-- 사이드메뉴 -->
  	<div id="adminSide">
  	  <ul>
	  	  <li><a href="<c:url value="/admin/member" />" class="adminSideActive">회원 관리</a></li>
	  	  <li><a href="./admin_notice.html">공지사항 관리</a></li>
  	  </ul>
  	</div>
  	<!-- 메인 -->
  	<div id="adminSection">
  		<div class="adminDiv">
  			<h3>회원관리</h3>
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
  		  <select class="size" name="order_select" id="order_select">
          <option value="id_asc" selected>아이디 오름차순</option>
          <option value="id_desc">아이디 내림차순</option>
          <option value="join_date_asc">가입일 오름차순</option>
          <option value="join_date_desc">가입일 내림차순</option>
        </select>
  		</div>
  		<div class="adminDiv2" id="tableTitle">
  		  <div>회원목록 ${memberCnt}건</div>
  		  <div>한페이지 행수
	  		  <select class="size" name="page_select" id="page_select">
	          <option value="page10" selected>5개만 보기</option>
	          <option value="page10">10개만 보기</option>
	        </select>
  		  </div>
  		</div>
  		<div class="">
  			<table class="adminTable">
  			  <thead>
  			  	<tr>
	  			  	<th>아이디</th>
	  			  	<th>성명</th>
	  			  	<th>이메일</th>
	  			  	<th>생일</th>
	  			  	<th>가입일</th>
  			  	</tr>
  			  </thead>
  			  <tbody>
				  <c:forEach var="m" items="${members}" varStatus="loop">
					  <tr>
						  <td><a href="<c:url value="/notice/get"/>?no=${n.noticeIdx}">${m.memberId}</a></td>
						  <td><a href="<c:url value="/notice/get"/>?no=${n.noticeIdx}">${m.memberName}</a></td>
						  <td><a href="<c:url value="/notice/get"/>?no=${n.noticeIdx}">${m.memberEmail}</a></td>
						  <td><a href="<c:url value="/notice/get"/>?no=${n.noticeIdx}">${m.memberBirthDate}</a></td>
						  <td><a href="<c:url value="/notice/get"/>?no=${n.noticeIdx}">${m.memberJoinDate}</a></td>
					  </tr>
				  </c:forEach>
  			  </tbody>
  			</table>
  		</div>
  	</div>
  </div>