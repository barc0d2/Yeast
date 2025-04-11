<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Employee List</title>
  <link rel="stylesheet" href="/css/company/employee/list/globals.css"/>
  <link rel="stylesheet" href="/css/company/employee/list/style.css"/>
  <link rel="stylesheet" href="/css/company/employee/list/styleguide.css"/>
</head>
<body>
<main class="frame">
  <div class="container">
    <div class="list">
      <div class="head">
        <div class="email">이메일</div>
        <div class="no">NO.</div>
        <div class="name">이름</div>
        <div class="id">아이디</div>
        <div class="phone">전화번호</div>
        <div class="text-wrapper-2">성별</div>
        <div class="text-wrapper-2">직무</div>
        <div class="enroll-date">입사일</div>
      </div>

      <c:forEach var="member" items="${list}">
        <div class="list-2" onclick="location.href='enrollForm?userNo=${member.userNo}'">
          <div class="email-2">${member.email}</div>
          <div class="no-2">${member.userNo}</div>
          <div class="name-2">${member.userName}</div>
          <div class="id-2">${member.userId}</div>
          <div class="phone-2">${member.phone}</div>
          <div class="text-wrapper-3">${member.gender}</div>
          <div class="text-wrapper-3">${member.positionName}</div>
          <div class="enroll-date-2">${member.enrollDate}</div>
        </div>
      </c:forEach>
    </div>
  </div>
  <div id="pagination">
    <ul>
      <c:choose>
        <c:when test="${ pi.currentPage eq 1 }">
        </c:when>
        <c:otherwise>
          <li class="pre-page"><a class="page-link" href="/company/introduction/allEmployeeList?currentPage=${pi.currentPage - 1}"><svg width="29" height="26" style="transform: translateX(-8px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
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
            <li class="page"><div class="unSelectPage"><a class="page-link" href="/company/introduction/allEmployeeList?currentPage=${p}">${p}</a></div></li>
          </c:otherwise>
        </c:choose>
      </c:forEach>

      <c:choose>
        <c:when test="${ pi.currentPage eq pi.maxPage }">
        </c:when>
        <c:otherwise>
          <li class="next-page">
            <a class="page-link" href="/company/introduction/allEmployeeList?currentPage=${pi.currentPage + 1}"><svg width="29" height="26" style="transform: translateX(-6px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M8.07745 3.52616C7.30752 4.22469 7.30752 5.35309 8.07745 6.05163L15.7373 13.0011L8.07745 19.9506C7.30752 20.6492 7.30752 21.7776 8.07745 22.4761C8.84738 23.1746 10.0911 23.1746 10.861 22.4761L19.9226 14.2549C20.6925 13.5564 20.6925 12.428 19.9226 11.7294L10.861 3.50825C10.1109 2.82763 8.84738 2.82763 8.07745 3.52616Z" fill="black"/>
            </svg></a></li>
        </c:otherwise>
      </c:choose>
    </ul>
  </div>
</main>

<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
