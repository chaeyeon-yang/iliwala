<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<head>
  <link rel="stylesheet" href="<c:url value="/css/customer/checkPW.css"/>">
</head>

<div class="main">
    <form action="">
      <table>
        <tr>
          <td colspan="2">비밀번호입력</td>
        </tr>
        <tr>
          <td colspan="2">글 작성시 입력한 비밀번호를 입력하세요.</td>
        </tr>
        <tr>
          <td style="width: 20%;"><img src="<c:url value="/img/customer/txt_pass.gif"/>"></td>
          <td style="width: 80%;"><input type="password"></td>
        </tr>
        
      </table>
    </form>
    <div><input type="image" src="<c:url value="/img/customer/btn_confirm.gif"/>"></div>
    <div><input class="closeBtn" type="image" onclick="window.close()" src="<c:url value="/img/member/btn_close.gif"/>"></div>
  </div>
