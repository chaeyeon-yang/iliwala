<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">
</head>
<script>
    let login = {
        init: function () {
            $("#loginForm #loginBtn").click(() => {
                let memberId = $("#memberId").val();
                let memberPw = $("#memberPw").val();
                $.ajax({
                    url: "<c:url value="/member/loginimpl" />",
                    data: {"memberId": memberId, "memberPw": memberPw},
                    success: (res) => {
                        if (res === 2) {
                            alert("로그인되었습니다.")
                            window.location.href = "<c:url value="/" />"
                        } else if (res === 0) {
                            alert("아이디가 존재하지 않습니다.")
                        } else {
                            alert("비밀번호가 다릅니다.")
                        }
                    }
                })
            })
        },
    }
    $(function () {
      login.init();
    })
</script>

<!-- 메인 -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual01.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 로그인</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="container text-center">
    <div class="loginSection1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <form class="loginMain" id="loginForm">
        <table class="main1">
            <tr>
                <td>
                    아이디 <br>
                    비밀번호
                </td>
                <td>
                    <input type="text" id="memberId"> <br>
                    <input type="password" id="memberPw">
                </td>
                <td>
                    <input id="loginBtn" type="button" style="background-image: url('<c:url value="/img/member/btn_login.gif" />'); background-size: cover; width: 70px;  height: 48px;
                            border: none;">
                </td>
            </tr>
        </table>
        <div class="loginSection2">
            <table class="main2">
                <tr>
                    <td>-아이디를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('idFind.html','아이디찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src="<c:url value="/img/member/btn_id_find.gif"/>" >
                    </td>
                </tr>
                <tr>
                    <td>-비밀번호를 잊으셨나요?</td>
                    <td>
                        <input type="image"
                               onclick="window.open('passwordFind.html','비밀번호찾기', 'width=430,height=300,location=no,status=no,scrollbars=no')",
                               src="<c:url value="/img/member/btn_pw_find.gif" />" >
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>