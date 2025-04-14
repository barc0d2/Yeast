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
              <img class="image" src="${bread.imageChange}" />
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

        <div id="pagination">
          <ul>
          <c:choose>
            <c:when test="${ pi.currentPage eq 1 }">
            </c:when>
            <c:otherwise>
              <li class="pre-page"><a class="page-link" href="/branch/bread/list?currentPage=${pi.currentPage - 1}"><svg width="29" height="26" style="transform: translateX(-8px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M19.9226 22.4738C20.6925 21.7753 20.6925 20.6469 19.9226 19.9484L12.2627 12.9989L19.9226 6.04936C20.6925 5.35083 20.6925 4.22243 19.9226 3.5239C19.1526 2.82537 17.9089 2.82537 17.139 3.5239L8.07745 11.7451C7.30752 12.4436 7.30752 13.572 8.07745 14.2706L17.139 22.4918C17.8891 23.1724 19.1526 23.1724 19.9226 22.4738Z" fill="black"/>
              </svg></a></li>
            </c:otherwise>
          </c:choose>

              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:choose>
                <c:when test="${p == pi.currentPage}">
                  <li class="cpage"><div class="text-wrapper-8">${p}</div></li>
                </c:when>
                <c:otherwise>
                  <li class="page"><div class="text-wrapper-7"><a class="page-link" href="/branch/bread/list?currentPage=${p}">${p}</a></div></li>
                </c:otherwise>
                </c:choose>
              </c:forEach>

          <c:choose>
            <c:when test="${ pi.currentPage eq pi.maxPage }">
            </c:when>
            <c:otherwise>
              <li class="next-page"><a class="page-link" href="/branch/bread/list?currentPage=${pi.currentPage + 1}"><svg width="29" height="26" style="transform: translateX(-6px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M8.07745 3.52616C7.30752 4.22469 7.30752 5.35309 8.07745 6.05163L15.7373 13.0011L8.07745 19.9506C7.30752 20.6492 7.30752 21.7776 8.07745 22.4761C8.84738 23.1746 10.0911 23.1746 10.861 22.4761L19.9226 14.2549C20.6925 13.5564 20.6925 12.428 19.9226 11.7294L10.861 3.50825C10.1109 2.82763 8.84738 2.82763 8.07745 3.52616Z" fill="black"/>
              </svg></a></li>
            </c:otherwise>
          </c:choose>
          </ul>
        </div>

          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../sideBar/whiteSideBar.jsp"/>
    <jsp:include page="../sideBar/whiteTopBar.jsp"/>
  </body>
</html>
