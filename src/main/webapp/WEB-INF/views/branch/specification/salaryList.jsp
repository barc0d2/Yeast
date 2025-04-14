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
  <link rel="stylesheet" href="/css/branch/storemangement/specification/globals.css" />
  <link rel="stylesheet" href="/css/branch/storemangement/specification/style.css" />
</head>

<body>
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
                <fmt:formatDate value="${employee.payday}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="formattedDate" />
                <button class="procure" data-update="${formattedDate}" onclick="location.href='/branch/specification/salaryDetail?userNo=${employee.userNo}'">
                </button>
              </td>
              <td>${employee.userName}</td>
              <td>${employee.enrollDate}</td>
              <td>${employee.positionName}</td>
              <td>${employee.email}</td>
              <td>${employee.salary}</td>
              <td>${employee.phone}</td>
              <td>${employee.gender}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
      <div id="pagination">
        <ul>
          <c:choose>
            <c:when test="${ pi.currentPage eq 1 }">
            </c:when>
            <c:otherwise>
              <li class="pre-page"><a class="page-link" href="/branch/specification/salaryList?cpage=${pi.currentPage - 1}"><svg width="29" height="26" style="transform: translateX(-8px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M19.9226 22.4738C20.6925 21.7753 20.6925 20.6469 19.9226 19.9484L12.2627 12.9989L19.9226 6.04936C20.6925 5.35083 20.6925 4.22243 19.9226 3.5239C19.1526 2.82537 17.9089 2.82537 17.139 3.5239L8.07745 11.7451C7.30752 12.4436 7.30752 13.572 8.07745 14.2706L17.139 22.4918C17.8891 23.1724 19.1526 23.1724 19.9226 22.4738Z" fill="black"/>
              </svg></a></li>
            </c:otherwise>
          </c:choose>

          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <c:choose>
              <c:when test="${p == pi.currentPage}">
                <li class="cpage"><div class="selectPage">${p}</div></li>
              </c:when>
              <c:otherwise>
                <li class="page"><div class="unSelectPage"><a class="page-link" href="/branch/specification/salaryList?cpage=${p}">${p}</a></div></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <c:choose>
            <c:when test="${ pi.currentPage eq pi.maxPage }">
            </c:when>
            <c:otherwise>
              <li class="next-page"><a class="page-link" href="/branch/specification/salaryList?cpage=${pi.currentPage + 1}"><svg width="29" height="26" style="transform: translateX(-6px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M8.07745 3.52616C7.30752 4.22469 7.30752 5.35309 8.07745 6.05163L15.7373 13.0011L8.07745 19.9506C7.30752 20.6492 7.30752 21.7776 8.07745 22.4761C8.84738 23.1746 10.0911 23.1746 10.861 22.4761L19.9226 14.2549C20.6925 13.5564 20.6925 12.428 19.9226 11.7294L10.861 3.50825C10.1109 2.82763 8.84738 2.82763 8.07745 3.52616Z" fill="black"/>
              </svg></a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </section>
  </main>
</div>

<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const today = new Date();
    const todayYear = today.getFullYear();
    const todayMonth = today.getMonth() + 1;
    document.querySelectorAll(".procure").forEach(button => {
      const payday = button.dataset.update;
      if (payday) {
        const sqlDate = new Date(payday);
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
