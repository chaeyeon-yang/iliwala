
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
  <link rel="stylesheet" href="<c:url value="/css/member/join.css"/>">
</head>

<script>
    function idCheck() {
      let id = $("#memberId").val();
      $.ajax({
        url: "<c:url value='/member/checkIdDuplicate' />",
        data: {"id": id},
        success: (data) => {
          let msg = "아이디 사용가능합니다."
          if (data == 0) {
            msg = "아이디가 중복됩니다."
          }
          alert(msg);
        }
      });
    }

    function pwCheck() {
      let pw = $("#memberPw").val();
      return pw.length >= 4
    }

    function pwReCheck() {
      let pw = $("#memberPw").val();
      let pwRe = $("#memberPwRe").val()
      return pw === pwRe;
    }
    
    let join2 = {
      init: function () {
        $("form #registerBtn").click(() => {
          let id = $("#memberId").val();
          let pw = $("#memberPw").val();
          let name = $("#memberName").val();
          let email = $("#memberEmail").val();
          let emailReceive = $("input[name='memberEmailReceive']:checked").val();
          let pwQuestion = $("select[name='memberPwQuestion'] option:selected").val();
          let pwAnswer = $("#memberPwAnswer").val();
          let gender = $("input[name='memberGender']:checked").val();
          let birthDate = $("#memberBirthDate").val();

          msg = null;
          if (!pwCheck()) {
            msg = "비밀번호는 4자리 이상만 가능합니다."
          }
          if (!pwReCheck()) {
            msg = "암호가 일치하지 않습니다. 다시 입력해주세요."
          }

          if (!id) {
            msg = "아이디를 입력해야 합니다.";
          } else if (!pw) {
            msg = "비밀번호를 입력해야 합니다.";
          } else if (!name) {
            msg = "이름을 입력해야 합니다.";
          } else if (!email) {
            msg = "이메일을 입력해야 합니다.";
          } else if (!emailReceive) {
            msg = "이메일 수신여부를 선택해야 합니다.";
          } else if (pwQuestion == 0) {
            msg = "비밀번호 확인시 질문을 선택해야 합니다.";
          } else if (!pwAnswer) {
            msg = "비밀번호 확인시 답변을 입력해야 합니다.";
          } else if (!gender) {
            msg = "성별을 선택해야 합니다.";
          } else if (!birthDate) {
            msg = "생년월일을 입력해야 합니다.";
          }

          if (msg) {
            alert(msg);
          }
        })
      },
    }
    $(function () {
      join2.init();
    })
</script>

<!-- 메인 -->
<div>
<div class="commonSection1">
  <div class="commonContent1">
    <img src="<c:url value="/img/member/sub-visual02.jpg" />"
         style="width: 100%; height: 100%;">
    <div class="commonContent2 text-center">
      <div>
        <h3>MEMBER</h3>
      </div>
      <div>
        <p><img src="<c:url value="/img/icon-home.png"/>"> > 회원가입</p>
      </div>
    </div>
  </div>
</div>

<!-- 메인 -->
<!-- 회원가입 -->
<div class="joinForm container">
  <div class="joinSection1">
    <div><h3>회원가입</h3></div>
    <div><p>The design and maintenance are excellent.</p></div>
  </div>
  <div class="wellcome">
    <h3>iliwala 사이트에 오신 것을 환영합니다.</h3>
    <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
  </div>
    <br><br>
  <div class="contents">
    <h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
    <h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다.
      자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
  </div>
<!-- 입력폼 -->

    <div class="information1">
    <div>기본정보</div>
      <form>
        <table>
        <tr>
          <td>아이디</td>
          <td>
            <input type="text" name="memberId" id="memberId">
            <img src="<c:url value="/img/member/btn_iddupl.gif" />" onclick="idCheck()">
            (영문 소문자, 숫자로 4~16자)
          </td>
        </tr>
        <tr>
          <td>비밀번호</td>
          <td>
            <input type="password" name="memberPw" id="memberPw">
            영문/숫자/특수문자조합으로 8~16자리. 첫글자는 영문자로 사용
          </td>
        </tr>
        <tr>
          <td>비밀번호 확인</td>
          <td><input type="password" id="memberPwRe"></td>
        </tr>
        <tr>
          <td>이름</td>
          <td><input type="text" name="memberName" id="memberName"></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" name="memberEmail" id="memberEmail"></td>
        </tr>
        <tr>
          <td>이메일 수신여부</td>
          <td>
            <input type="radio" name="memberEmailReceive" class="memberEmailReceive" value="1">수신
            <input type="radio" name="memberEmailReceive" class="memberEmailReceive" value="0">수신안함
          </td>
        </tr>
        <tr>
          <td>비밀번호 확인시 질문</td>
          <td>
            <select class="size" name="memberPwQuestion" id="memberPwQuestion">
              <option value="0">========선택========</option>
              <option value="1">기억에 남는 추억의 장소는?</option>
              <option value="2">자신의 인생 좌우명은?</option>
              <option value="3">자신의 보물 제1호는?</option>
              <option value="4">가장 기억에 남는 선생님 성함은?</option>
              <option value="5">내가 좋아하는 캐릭터는?</option>
            </select>
          </td>
        </tr>
        <tr>
          <td>비밀번호 확인시 답변</td>
          <td><input type="text" name="memberPwAnswer" id="memberPwAnswer" value=""></td>
        </tr>
        <tr>
          <td>성별</td>
          <td>
            <input type="radio" name="memberGender" class="memberGender" value="male">남자
            <input type="radio" name="memberGender" class="memberGender" value="female">여자
          </td>
        </tr>
        <tr>
          <td>생년월일</td>
          <td>
            <input type="date" name="memberBirthDate" id="memberBirthDate" />
          </td>
        </tr>
      </table>
        <div class="Information2">부가정보</div>
        <div class="imageBtn2">
          <input type="button" id="registerBtn" style="background-image: url('<c:url value='/img/member/btn_confirm.gif'/>'); background-size: cover; padding: 16px 32px; border: none">
          <input type="button" style="background-image: url('<c:url value='/img/member/btn_cancel.gif'/>'); background-size: cover; padding: 16px 32px; border: none">
        </div>
      </form>
  </div>
</div>
</div>