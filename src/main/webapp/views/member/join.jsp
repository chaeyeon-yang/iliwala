<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
  <link rel="stylesheet" href="<c:url value="/css/member/join.css"/>">
</head>
<script>
  function agree() {
    //반복문전에 boolean변수에 초기값.
    var isAllCheck = true;
    var checkboxArray = document.getElementsByClassName('check');
    for(var cbx of checkboxArray) {
      if(cbx.checked == false){
        isAllCheck = false;
        break; //반복문을 탈출하는 키워드
        //continue; //반복문의 해당루프를 탈출하는 키워드
      }
    }
    if(isAllCheck == true){
      window.location.href = 'join2.html'

    }else{
      alert('이용약관에 모두 동의하셔야 회원으로 가입하실 수 있습니다.');
    }
  }
</script>


  <!-- 메인 -->
  <div class="commonSection1">
    <div class="commonContent1">
      <img src="<c:url value="/img/member/sub-visual02.jpg" />"
          style="width: 100%; height: 100%;">
      <div class="commonContent2 text-center">
        <div>
          <h3>MEMBER</h3>
        </div>
        <div>
          <p><img src="../img/icon-home.png"> > 회원가입</p>
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
      <h3>OOO사이트에 오신 것을 환영합니다.</h3>
      <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
    </div>

    <!-- 이용약관 -->
    <div class="term1">
      <div>이용약관</div>
      <div>
        <textarea name="" id="" cols="30" rows="10">
          이용약관
        </textarea>
        <div><input class="check" type="checkbox">위 약관에 동의합니다.</div>
      </div>
    </div>
    <!-- 개인정보보호정책 -->
    <div class="term2">
      <div>개인정보보호정책</div>
      <div>
        <textarea name="" id="" cols="30" rows="10">
          개인정보보호정책
        </textarea>
        <div><input class="check" type="checkbox">위 개인정보취급방침에 동의합니다.</div>
      </div>
    </div>
    <!-- 개인정보의 수집 및 이용목적 -->
    <div class="term3">
      <div>개인정보의 수집 및 이용목적</div>
      <div>
        <textarea name="" id="" cols="30" rows="10">
          개인정보의 수집 및 이용목적
        </textarea>
        <div><input class="check" type="checkbox">위 개인정보의 수집 및 이용목적에 동의합니다.</div>
      </div>
    </div>

    <div class="imageBtn">
      <input type="image" onclick="agree();" src="../img/member/btn_join.gif">
    </div>
  </div>