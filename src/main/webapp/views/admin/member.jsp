<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
	<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
</head>

<script>
	let memberManage = {
		members: null,
		init: function () {
			$("#searchBtn").click(() => {
				let searchOption = $("select[name='searchOption'] option:selected").val();
				let searchTerm = $("#searchTerm").val();
				let searchUrl;

				if (searchOption === "id") {
					searchUrl = '<c:url value="/admin/searchId"/>';
				} else if (searchOption === "name") {
					searchUrl = '<c:url value="/admin/searchName"/>';
				} else if (searchOption === "email") {
					searchUrl = '<c:url value="/admin/searchEmail"/>';
				} else {
					searchUrl = '<c:url value="/admin/searchAll"/>';
				}

				$.ajax({
					url: searchUrl + "?term=" + encodeURIComponent(searchTerm),
					type: "GET",
					success: function(response) {
						memberManage.members = response;
						updateTable(response);
					},
					error: function(err) {
						console.error("검색 에러 발생: ", err);
					}
				});
			});
			$("#orderOption").change(() => {
				memberManage.sortMembers();
			});
		},
		sortMembers: function () {
			console.log("실행한다다다다다다다")
			let orderOption = $("select[name='orderOption'] option:selected").val();
			let members = this.members;

			$.ajax({
				url: "/admin/orderById",
				type: "POST",
				contentType: "application/json",
				data: JSON.stringify({ orderOption: orderOption, members: members }),
				success: function(response) {
					console.log(orderOption)
					console.log("정렬된 결과: ", response);
					updateTable(response);
				},
				error: function(err) {
					console.error("에러 발생: ", err);
				}
			});

		}
	};
	$(function () {
		memberManage.init();
	});

	function updateTable(members) {
		var tbody = $("<tbody></tbody>");

		members.forEach(function(member) {
			var row = "<tr>" +
					"<td>" + member.memberId + "</td>" +
					"<td>" + member.memberName + "</td>" +
					"<td>" + member.memberEmail + "</td>" +
					"<td>" + member.memberBirthDate + "</td>" +
					"<td>" + member.memberJoinDate + "</td>" +
					"</tr>";
			tbody.append(row); 
		});

		// 기존의 tbody를 비우고 새로 생성된 tbody를 페이지에 추가
		$(".adminTable tbody").replaceWith(tbody);
	}
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
  		  <select class="size" name="orderOption" id="orderOption">
          <option value=0 selected>아이디 오름차순</option>
          <option value=1>아이디 내림차순</option>
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
							  <td>${m.memberId}</td>
							  <td>${m.memberName}</td>
							  <td>${m.memberEmail}</td>
							  <td>${m.memberBirthDate}</td>
							  <td>${m.memberJoinDate}</td>
						  </tr>
					  </c:forEach>

  			  </tbody>
  			</table>
  		</div>
  	</div>
  </div>