<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="../../css/global/employeeManagement.css" />
  <link rel="stylesheet" href="../../css/styleguide/employeeManagement.css" />
  <link rel="stylesheet" href="../../css/style/employeeManagement.css" />
</head>
<body>
<div class="div-wrapper">
  <div class="frame">
    <div class="container">
      <div class="filter">
        <div class="overlap-group">
          <div class="bg"></div>
          <div class="reset-filter">
            <div class="frame-wrapper">
              <div class="div">
                <img class="under-arrow" src="../resources/static/image/employeeManagement/underArrow.png" />
                <div class="text-wrapper">Reset Filter</div>
              </div>
            </div>
          </div>
          <div class="enroll-filter">
            <img class="line" src="img/line-2.svg" />
            <img class="img" src="../resources/uploadfile/image/employeeManagement/underArrow.png" />
            <div class="order-status">입사일</div>
          </div>
          <div class="department-filter">
            <img class="line-2" src="img/line.svg" />
            <img class="ic-keyboard-arrow" src="../resources/uploadfile/image/employeeManagement/underArrow.png" />
            <div class="order-type">부서명</div>
          </div>
          <div class="position-filter">
            <img class="under-arrow-2" src="../resources/uploadfile/image/employeeManagement/underArrow.png" />
            <img class="line-3" src="img/image.svg" />
            <div class="filter-by">직무</div>
          </div>
        </div>
      </div>
      <div class="list">
        <div class="head">
          <div class="email">이메일</div>
          <div class="no">NO.</div>
          <div class="name">이름</div>
          <div class="id">소속</div>
          <div class="phone">전화번호</div>
          <div class="text-wrapper-2">성별</div>
          <div class="text-wrapper-2">직무</div>
          <div class="enroll-date">입사일</div>
        </div>
        <% for (int i = 0; i < 10; i++) { %>
        <div class="row">
          <input class="input" placeholder="qwer1234@gmail.com" type="email" />
          <div class="no-2"><%= String.format("%05d", i + 1) %></div>
          <div class="name-2">전진영</div>
          <div class="id-2">소속 부서</div>
          <div class="phone-2">010-1234-5678</div>
          <div class="gender">남</div>
          <div class="position">직책</div>
          <div class="enroll-date-2">25/01/12</div>
        </div>
        <% } %>
      </div>
    </div>
    <nav class="page-bar" aria-label="Pagination">
      <button class="next-page" aria-label="Next page"><img class="icon" src="img/icon-2.svg" alt="" /></button>
      <button class="pre-page" aria-label="Previous page"><img class="icon" src="img/icon.svg" alt="" /></button>
      <button class="page" aria-current="page"><span class="text-wrapper-6">1</span></button>
      <button class="page-10"><span class="text-wrapper-6">2</span></button>
      <button class="page-2"><span class="text-wrapper-5">3</span></button>
      <button class="page-3"><span class="text-wrapper-6">4</span></button>
      <button class="page-4"><span class="text-wrapper-6">5</span></button>
      <button class="page-5"><span class="text-wrapper-6">6</span></button>
      <button class="page-6"><span class="text-wrapper-6">7</span></button>
      <button class="page-7"><span class="text-wrapper-6">8</span></button>
      <button class="page-8"><span class="text-wrapper-6">9</span></button>
      <button class="page-9"><span class="text-wrapper-6">10</span></button>
    </nav>
</div>
</div>
</body>
</html>
