<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/branch/order/list/style.css" />
    <link rel="stylesheet" href="/css/branch/order/list/global.css" />
    <link rel="stylesheet" href="/css/branch/order/list/styleguide.css" />
  </head>
  <body>
  <div class="main">
    <div class="container">
      <div class="content">
        <header class="header">
          <input type="date" class="input">
          <div class="wave-sym">
            <div class="to">~</div>
          </div>
          <input type="date" class="input">
          <div class="cancel">
            <div class="detail-btn">상세보기</div>
          </div>
        </header>
        <div class="navbar">
          <table>
            <thead>
            <tr>
              <th>발주번호</th>
              <th>상태</th>
              <th>배송요청일</th>
              <th>발주일자</th>
              <th>담당자</th>
              <th>발주금액</th>
              <th>발주자</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>1231265683</td>
              <td class="btn"><div class="button">출하완료</div></td>
              <td>2025-03-22</td>
              <td>2025-03-19</td>
              <td>호원준</td>
              <td>500,000,000</td>
              <td>지점A</td>
            </tr>
            <tr>
              <td>1231265683</td>
              <td class="btn"><div class="button">출하완료</div></td>
              <td>2025-03-19</td>
              <td>2025-03-19</td>
              <td>호원준</td>
              <td>500,000,000</td>
              <td>지점A</td>
            </tr>
            <tr>
              <td>1231265683</td>
              <td class="btn"><div class="button">출하완료</div></td>
              <td>2025-03-19</td>
              <td>2025-03-19</td>
              <td>호원준</td>
              <td>500,000,000</td>
              <td>지점A</td>
            </tr>
            <tr>
              <td>1231265683</td>
              <td class="btn"><div class="button">출하완료</div></td>
              <td>2025-03-19</td>
              <td>2025-03-19</td>
              <td>호원준</td>
              <td>500,000,000</td>
              <td>지점A</td>
            </tr>
            <tr>
              <td>1231265683</td>
              <td class="btn"><div class="button">출하완료</div></td>
              <td>2025-03-19</td>
              <td>2025-03-19</td>
              <td>호원준</td>
              <td>500,000,000</td>
              <td>지점A</td>
            </tr>
            <tr>
              <td>1231265683</td>
              <td class="btn"><div class="button">출하완료</div></td>
              <td>2025-03-19</td>
              <td>2025-03-19</td>
              <td>호원준</td>
              <td>500,000,000</td>
              <td>지점A</td>
            </tr>
            </tbody>
          </table>
        </div>
        <p class="page-no">
          <span class="span">${currentPage} </span>
          <span class="text-wrapper-7"> to </span>
          <span class="span">4</span>
          <span class="text-wrapper-7"> of </span>
          <span class="span">4</span>
        </p>
        <p class="total-amount">총 발주 금액 1,000,000,000 원</p>
      </div>
    </div>
  </div>
  <jsp:include page="../sideBar/whiteSideBar.jsp"/>
  <jsp:include page="../sideBar/whiteTopBar.jsp"/>
  </body>
</html>
