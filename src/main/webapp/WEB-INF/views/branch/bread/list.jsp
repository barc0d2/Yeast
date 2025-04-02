<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/branch/bread/list/globals.css" />
    <link rel="stylesheet" href="/css/branch/bread/list/style.css" />
    <link rel="stylesheet" href="/css/branch/bread/list/styleguide.css" />
  </head>
  <body>
    <div class="screen">
      <div class="frame">
        <div class="container">
          <header class="header">
            <div class="left">
              <div class="line">메뉴 조회</div>
              <p class="text-wrapper">등록한 모든 메뉴를 조회하고 삭제합니다.</p>
            </div>
            <p class="right">
              <span class="span">메뉴관리</span>
              <span class="text-wrapper-2"> / </span>
              <span class="text-wrapper-3">조회</span>
            </p>
          </header>
          <div class="list">
            <c:forEach var="bread" items="${list}">
            <div class="div">
              <img class="image" src="/resources/uploadfile/${bread.imageChange}" />
              <div class="div-2">
                <div class="div-3">
                  <div class="text-wrapper-4">${bread.breadName}</div>
                  <div class="div-4">
                    <div class="text-wrapper-5">종류 : ${bread.categoryName} </div>
                    <div class="text-wrapper-6"> ${bread.enrollDate} </div>
                    <div class="text-wrapper-6">가격 : ${bread.price}￦</div>
                    <div class="text-wrapper-6"> 총 내용량당 칼로리(kcal): ${bread.calories}</div>
                    <p class="text-wrapper-6">알레리기 정보 : ${bread.allergy}</p>
                  </div>
                </div>
                <p class="text-wrapper-6">${bread.breadContent}</p>
              </div>
            </div>
            </c:forEach>
          </div>
        </div>
        <div class="page-bar">
          <ul class="pagination">

            <c:choose>
              <c:when test="${ pi.currentPage eq 1 }">
                <li class="page-item pre-page disabled"><a class="page-link" href="#">Previous</a></li>
              </c:when>
              <c:otherwise>
                <li class="page-item pre-page"><a class="page-link" href="/branch/bread/list?currentPage=${pi.currentPage - 1}">Previous</a></li>
              </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
              <li class="page-item text-wrapper-8"><a class="page-link" href="/branch/bread/list?currentPage=${p}">${p}</a></li>
            </c:forEach>

            <c:choose>
              <c:when test="${ pi.currentPage eq pi.maxPage }">
                <li class="page-item next-page disabled"><a class="page-link" href="#">Next</a></li>
              </c:when>
              <c:otherwise>
                <li class="page-item next-page"><a class="page-link" href="/branch/bread/list?currentPage=${pi.currentPage + 1}">Next</a></li>
              </c:otherwise>
            </c:choose>

          </ul>
          <div class="next-page"><img class="icon" src="img/icon.svg" /></div>
          <div class="pre-page"><img class="icon" src="img/image.svg" /></div>
          <div class="page"><div class="text-wrapper-7">1</div></div>
          <div class="div-wrapper"><div class="text-wrapper-7">2</div></div>
          <div class="page-2"><div class="text-wrapper-8">3</div></div>
          <div class="page-3"><div class="text-wrapper-7">4</div></div>
          <div class="page-4"><div class="text-wrapper-7">5</div></div>
          <div class="page-5"><div class="text-wrapper-7">6</div></div>
          <div class="page-6"><div class="text-wrapper-7">7</div></div>
          <div class="page-7"><div class="text-wrapper-7">8</div></div>
          <div class="page-8"><div class="text-wrapper-7">9</div></div>
          <div class="page-9"><div class="text-wrapper-9">10</div></div>
        </div>
      </div>
    </div>
  </body>
</html>
