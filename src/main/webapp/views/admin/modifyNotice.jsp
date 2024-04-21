<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
  <link rel="stylesheet" href="<c:url value="/css/admin/admin.css" />">
</head>
<script>
    let modifyNotice = {
        init: function () {
            $("#modifyBtn").click(() => {
                this.send();
            });
        },
        send: function () {
            // CKEditor에서 내용 가져오기
            let data = CKEDITOR.instances.noticeContent.getData();
            let idx = parseInt($("#noticeIdx").text());

            $.ajax({
                url: "<c:url value="/admin/modifyNotice" />",
                type: "POST",
                data: JSON.stringify({ noticeContent: data, idx: idx }),
                contentType: "application/json",
                success: function(res) {
                    if(res) {
                        alert("공지사항이 수정되었습니다.");
                        window.location.href = "<c:url value="/admin/noticeDetail"/>?no="+idx;
                    }
                },
                error: function(err) {
                    console.error("수정 에러 발생: ", err);
                }
            });
        }
    }
    $(function () {
        modifyNotice.init();
    })

</script>

  <!-- 메인 -->
  <!-- COMMON -->
  
  <div class="commonSection1">
    <div class="commonContent1">
      <img src="<c:url value="/img/member/sub-visual01.jpg" />"
          style="width: 100%; height: 100%;">
      <div class="commonContent2 text-center">
        <div>
          <h3>관리자페이지</h3>
        </div>
        <div>
          <p><img src="<c:url value="/img/icon-home.png"/>"> > 관리자페이지</p>
        </div>
      </div>
    </div>
  </div>
  
  <div id="adminMain">
    <!-- 사이드메뉴 -->
  	<div id="adminSide">
  	  <ul>
	  	  <li><a href="<c:url value="/admin/member"/>">회원 관리</a></li>
	  	  <li><a href="<c:url value="/admin/notice"/>" class="adminSideActive">공지사항 관리</a></li>
	  	  
  	  </ul>
  	</div>
  	<!-- 메인 -->
  	<form id="adminSection" method="post" action="<c:url value='/admin/writeNoticeImpl'/>">

        <div class="adminDiv">
  			<h3>공지사항 관리</h3>
  		</div>
  		<div class="noticeWriteTitle adminDiv2">
        <label style="width: 100px;">타이틀</label>
        <input type="text" name="noticeTitle" id="noticeTitle" value="${notice.noticeTitle}">
  		</div>
  		<div class="adminDiv2">
  		  <textarea rows="5" cols="50" id="noticeContent" name="noticeContent">${notice.noticeContent}</textarea>
  		</div>
        <div class="hidden">
            <input type="hidden" name="noticeMemberId" id="noticeMemberId" />
        </div>
        <div style="visibility: hidden" id="noticeIdx">
            ${notice.noticeIdx}
        </div>
        <div class="noticeViewBtns adminDiv2">
            <div>
                <button type="button" id="modifyBtn" style="border: none; background-color: white;">수정</button>
                <a href="/admin_notice_delete?notice_idx=1">삭제</a>
            </div>
            <div>
                <a href="<c:url value="/admin/notice"/>">목록</a>
            </div>
        </div>
  	</form>
  </div>


  <script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
  <!-- <script>CKEDITOR.replace('editor4');</script> -->
  <script>
  	var ckeditor_config = {
	   resize_enaleb : false,
	   enterMode : CKEDITOR.ENTER_BR,
	   shiftEnterMode : CKEDITOR.ENTER_P,
	   filebrowserUploadUrl : "/ckUpload"
	 };
	 CKEDITOR.replace("noticeContent", ckeditor_config);
  </script>