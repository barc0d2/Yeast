<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>직원 급여 관리</title>
  <link rel="stylesheet" href="/css/branch/storemangement/specification/globals.css" />
  <link rel="stylesheet" href="/css/branch/storemangement/specification/style.css" />
  <link rel="stylesheet" href="/css/branch/storemangement/specification/styleguide.css" />
</head>

<body>
<div class="first">
  <main class="frame">
    <section class="content">
      <header class="header">
        <div class="date">
          <input type="date" id="selectedDate" class="date-picker" />
        </div>
        <form id="employeeForm" class="input">
          <label for="user-name" class="user-name">이름</label>
          <input type="text" id="user-name" name="userName" class="user-name-input" aria-label="직원 이름 입력" />
          <button type="submit">검색</button>
        </form>
      </header>

      <table class="table-container">
        <thead>
        <tr>
          <th>수급 상태</th>
          <th>결제 번호</th>
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
        <c:forEach var="member" items="${members}">
          <tr>
            <td>
              <c:choose>
                <c:when test="${member.status == '수급 완료'}">
                  <button class="pay-button">${member.status}</button>
                </c:when>
                <c:otherwise>
                  <button class="needpay-button">${member.status}</button>
                </c:otherwise>
              </c:choose>
            </td>
            <td>${member.paymentId}</td>
            <td>${member.userName}</td>
            <td>${member.createDate}</td>
            <td>${member.positionNo}</td>
            <td>${member.headName}</td>
            <td>${member.email}</td>
            <td>${member.salary}</td>
            <td>${member.phone}</td>
            <td>${member.gender}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

      <nav class="pagination" aria-label="페이지 네비게이션">
        <button class="pre-page" aria-label="이전 페이지">&laquo;</button>
        <c:forEach begin="1" end="10" var="i">
          <button class="page" aria-label="${i} 페이지">${i}</button>
        </c:forEach>
        <button class="next-page" aria-label="다음 페이지">&raquo;</button>
      </nav>
    </section>
  </main>
</div>

<script>
  function renderEmployeeList(employees) {
    if (!Array.isArray(employees) || employees.length === 0) {
      console.warn("표시할 직원 데이터가 없음");
      return;
    }

    const tableBody = document.querySelector("#employeeTable");
    if (!tableBody) {
      console.error("직원 테이블 x");
      return;
    }

    tableBody.innerHTML = "";

    employees.forEach(employee => {
      const row = document.createElement("tr");
      row.innerHTML = `
            <td>${employee.userNo}</td>
            <td>${employee.userName}</td>
            <td>${employee.headName || "없음"}</td>
            <td>${employee.userId}</td>
            <td>${employee.email}</td>
            <td>${employee.phone}</td>
            <td>${employee.salary.toLocaleString()}원</td>
        `;
      tableBody.appendChild(row);
    });

    console.log("직원 목록이 화면에 출력됨!");
  }

  document.getElementById("employeeForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const userNameInput = document.getElementById("user-name");

    if (!userNameInput) {
      console.error("user-name input x");
      return;
    }

    let userName = userNameInput.value.trim();
    console.log("🔍 검색 요청 userName:", userName);

    if (!userName) {
      alert("직원 이름을 입력하세요.");
      return;
    }

    let encodedUserName = encodeURIComponent(userName);
    console.log("userName:", encodedUserName, typeof encodedUserName);

    if (!encodedUserName || encodedUserName === "undefined" || encodedUserName === "null") {
      console.error("encodedUserName=", encodedUserName);
      return;
    }

    let requestUrl = "/branch/storemangement/specification/table/searchByName?userName=" + String(encodedUserName);
    console.log("최종 요청 URL:", requestUrl);

    fetch(requestUrl, {
      method: "GET",
      headers: { "Content-Type": "application/json" }
    })
            .then(response => {
              if (!response.ok) {
                throw new Error(`검색 실패: ${response.status}`);
              }
              return response.json();
            })
            .then(data => {
              console.log("검색된 직원 리스트:", data);
              console.log("직원 리스트 길이:", data.length);

              if (!Array.isArray(data) || data.length === 0) {
                console.warn("직원 리스트 x");
                return;
              }

              renderEmployeeList(data);
            })
            .catch(error => console.error("Error:", error));

  })
</script>

<jsp:include page="../../../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../../../sideBar/whiteTopBar.jsp"/>
</body>
</html>
