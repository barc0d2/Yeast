<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee List</title>
    <link rel="stylesheet" href="/css/company/employee/list/globals.css" />
    <link rel="stylesheet" href="/css/company/employee/list/style.css" />
    <link rel="stylesheet" href="/css/company/employee/list/styleguide.css" />
  </head>
  <body>
    <main class="frame">
      <section class="div">
        <div class="container">
          <form class="filter" action="#" method="get">
            <div class="overlap-group">
              <div class="bg"></div>
              <button type="reset" class="reset-filter">
                <div class="frame-wrapper">
                  <div class="div-2">
                    <img class="under-arrow" src="img/image.png" alt="Reset icon" />
                    <span class="text-wrapper">Reset Filter</span>
                  </div>
                </div>
              </button>
              <div class="enroll-filter">
                <img class="line" src="img/line-2.svg" alt="" />
                <img class="img" src="img/under-arrow.png" alt="Down arrow" />
                <label for="enroll-date" class="order-status">입사일</label>
                <select id="enroll-date" name="enroll-date" hidden>
                  <option value="">Select enrollment date</option>
                </select>
              </div>
              <div class="department-filter">
                <img class="line-2" src="img/line.svg" alt="" />
                <img class="ic-keyboard-arrow" src="img/ic-keyboard-arrow-down-48px.png" alt="Down arrow" />
                <label for="department" class="order-type">부서명</label>
                <select id="department" name="department" hidden>
                  <option value="">Select department</option>
                </select>
              </div>
              <div class="position-filter">
                <img class="under-arrow-2" src="img/under-arrow-2.png" alt="Down arrow" />
                <img class="line-3" src="img/image.svg" alt="" />
                <label for="position" class="filter-by">직무</label>
                <select id="position" name="position" hidden>
                  <option value="">Select position</option>
                </select>
              </div>
            </div>
          </form>
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
            <div class="list-2">
              <input class="input" placeholder="qwer1234@gmail.com" type="email" aria-label="Employee email" />
              <div class="no-2">00001</div>
              <div class="name-2">전진영</div>
              <div class="id-2">abc123</div>
              <div class="phone-2">010-1234-5649</div>
              <div class="text-wrapper-3">남</div>
              <div class="text-wrapper-3">직원</div>
              <div class="enroll-date-2">25/01/12</div>
            </div>
            <div class="list-2">
              <input class="input" placeholder="qwer1234@gmail.com" type="email" aria-label="Employee email" />
              <div class="no-2">00001</div>
              <div class="name-2">전진영</div>
              <div class="id-2">abc123</div>
              <div class="phone-2">010-1234-5649</div>
              <div class="text-wrapper-3">남</div>
              <div class="text-wrapper-3">직원</div>
              <div class="enroll-date-2">25/01/12</div>
            </div>
          </div>
        </div>
        <nav class="page-bar" aria-label="Pagination">
          <button class="next-page" aria-label="Next page"><img class="icon" src="img/icon-2.svg" alt="" /></button>
          <button class="pre-page" aria-label="Previous page"><img class="icon" src="img/icon.svg" alt="" /></button>
          <button class="page" aria-current="page"><span class="text-wrapper-4">1</span></button>
          <button class="div-wrapper"><span class="text-wrapper-4">2</span></button>
          <button class="page-2"><span class="text-wrapper-5">3</span></button>
          <button class="page-3"><span class="text-wrapper-4">4</span></button>
          <button class="page-4"><span class="text-wrapper-4">5</span></button>
          <button class="page-5"><span class="text-wrapper-4">6</span></button>
          <button class="page-6"><span class="text-wrapper-4">7</span></button>
          <button class="page-7"><span class="text-wrapper-4">8</span></button>
          <button class="page-8"><span class="text-wrapper-4">9</span></button>
          <button class="page-9"><span class="text-wrapper-6">10</span></button>
        </nav>
      </section>
    </main>
  </body>
</html>
