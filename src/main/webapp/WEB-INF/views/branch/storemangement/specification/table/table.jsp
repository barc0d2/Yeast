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
  <link rel="stylesheet" href="/css/branch/storemangement/specification/styleguide.css" />
</head>

<body>
<pre>${employee.salary}</pre>
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
                <c:choose>
                  <c:when test="${employee.status eq '수급 완료'}">
                    <button class="pay-button" disabled>
                      수급 완료
                    </button>
                  </c:when>
                  <c:otherwise>
                    <button class="pay-button"
                            data-user-name="${employee.userName}"
                            onclick="goToPayslip(this)">
                      수급
                    </button>
                  </c:otherwise>
                </c:choose>

              </td>
              <td>${employee.userName}</td>
              <td>${employee.UpdateAt}</td>
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

<script>
  // ✅ 직원 검색 기능 유지
  document.getElementById("employeeForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const userNameInput = document.getElementById("user-name");
    let userName = userNameInput.value.trim();
    if (!userName) {
      alert("직원 이름을 입력하세요.");
      return;
    }

    let encodedUserName = encodeURIComponent(userName);
    let requestUrl = "/branch/storemangement/specification/table/searchByName?userName=" + encodedUserName;

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
              renderEmployeeList(data);
            })
            .catch(error => console.error("Error:", error));
  });

  // ✅ 검색 후 직원 목록 동적 렌더링 유지
  function renderEmployeeList(employees) {
    const tableBody = document.getElementById("employeeTable");
    if (!tableBody) {
      console.error("employeeTable 요소가 존재하지 않습니다!");
      return;
    }

    tableBody.innerHTML = "";

    employees.forEach(employee => {

      let statusText = employee.status ?? "수급";
      let isCompleted = statusText === "수급 완료";
      let buttonClass = "pay-button";


      const row = document.createElement("tr");

      const button = document.createElement("button");
      button.className = buttonClass;
      button.textContent = statusText;
      button.setAttribute("data-user-name", employee.userName);

      if (!isCompleted) {
        button.setAttribute("onclick", "goToPayslip(this)");
      } else {
        button.disabled = true;
      }

      const tdButton = document.createElement("td");
      tdButton.appendChild(button);

      const tdUserName = document.createElement("td");
      tdUserName.textContent = employee.userName ?? "없음";

      const tdUpdateAt = document.createElement("td");
      tdUpdateAt.textContent = employee.updateAt ?? "없음";

      const tdPositionName = document.createElement("td");
      tdPositionName.textContent = employee.positionName ?? " 없음";

      const tdHeadName = document.createElement("td");
      tdHeadName.textContent = employee.headName ?? " 없음";

      const tdEmail = document.createElement("td");
      tdEmail.textContent = employee.email ?? " 없음";

      const tdSalary = document.createElement("td");
      tdSalary.textContent = employee.salary ? `${employee.salary}원` : " 없음";
      console.log("td샐러리", tdSalary);

      const tdPhone = document.createElement("td");
      tdPhone.textContent = employee.phone ?? " 없음";

      const tdGender = document.createElement("td");
      tdGender.textContent = employee.gender ?? "없음";

      row.appendChild(tdButton);
      row.appendChild(tdUserName);
      row.appendChild(tdUpdateAt);
      row.appendChild(tdPositionName);
      row.appendChild(tdHeadName);
      row.appendChild(tdEmail);
      row.appendChild(tdSalary);
      row.appendChild(tdPhone);
      row.appendChild(tdGender);

      tableBody.appendChild(row);

      console.log(row);
    });
  }

  function goToPayslip(button) {
    let userName = button.getAttribute("data-user-name");
    if (!userName) {
      alert("직원 정보가 없습니다.");
      return;
    }
    let encodedUserName = encodeURIComponent(userName);
    let payslipUrl = "../payslip/paySlip?userName=" + encodedUserName;
    window.location.href = payslipUrl;
  }
</script>

<jsp:include page="../../../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../../../sideBar/whiteTopBar.jsp"/>
</body>
</html>
