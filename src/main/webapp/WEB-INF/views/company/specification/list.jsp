<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>직원 급여 관리</title>
  <link rel="stylesheet" href="/css/company/storemangement/specification/globals.css" />
  <link rel="stylesheet" href="/css/company/storemangement/specification/style.css" />
  <link rel="stylesheet" href="/css/comapany/storemangement/specification/styleguide.css" />
</head>

<body>
<pre>${employee.salary}</pre>
<div class="first">
  <main class="frame">
    <section class="content">
      <header class="header">
        <form id="employeeForm" class="input">
          <label for="user-name" class="user-name">이름</label>
          <input type="text" id="user-name" name="userName" class="user-name-input" aria-label="직원 이름 입력" />
          <button type="submit">검색</button>
        </form>
      </header>
      <div id="tableContainer">
        <table class="table-container">
          <thead>
          <tr>
            <th>수급 상태</th>
            <th>이름</th>
            <th>명세 등록일</th>
            <th>직무</th>
            <th>담당자</th>
            <th>이메일</th>
            <th>월급</th>
            <th>전화번호</th>
            <th>성별</th>
          </tr>
          </thead>
          <tbody id="employeeTable">
          <c:forEach var="employee" items="${employees}">
            <tr>
              <td>
                <fmt:formatDate value="${employee.updateAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="formattedDate" />
                <button class="procure" data-update="${formattedDate}" onclick="location.href='/company/specification/detail?userNo=${employee.userNo}'">
                </button>
              </td>
              <td>${employee.userName}</td>
              <td>${employee.enrollDate}</td>
              <td>${employee.positionName}</td>
              <td>${employee.headName}</td>
              <td>${employee.email}</td>
              <td>${employee.salary}</td>
              <td>${employee.phone}</td>
              <td>${employee.gender}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </section>
  </main>
</div>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const today = new Date();
    const todayYear = today.getFullYear();
    const todayMonth = today.getMonth() + 1;
    document.querySelectorAll(".procure").forEach(button => {
      const updateAt = button.dataset.update;
      if (updateAt) {
        const sqlDate = new Date(updateAt);
        const sqlYear = sqlDate.getFullYear();
        const sqlMonth = sqlDate.getMonth() + 1;
        if (todayYear === sqlYear && todayMonth === sqlMonth) {
          button.classList.add('pay-button');
          button.textContent = '수급완료';
        } else {
          button.classList.add('needpay-button');
          button.textContent = '수급';
        }
      }
    })
  });
</script>
</body>
</html>
