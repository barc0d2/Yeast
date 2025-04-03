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
        <form class="filter" action="#" method="get">
            <div class="overlap-group">
                <div class="bg"></div>
                <button type="reset" class="reset-filter">
                    <div class="frame-wrapper">
                        <div class="div-2">
                            <svg width="12" height="16" viewBox="0 0 12 16" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M6 3.75V0.75L2.25 4.5L6 8.25V5.25C8.4825 5.25 10.5 7.2675 10.5 9.75C10.5 12.2325 8.4825 14.25 6 14.25C3.5175 14.25 1.5 12.2325 1.5 9.75H0C0 13.065 2.685 15.75 6 15.75C9.315 15.75 12 13.065 12 9.75C12 6.435 9.315 3.75 6 3.75Z"
                                      fill="#EA0234"/>
                            </svg>

                            <span class="text-wrapper">Reset Filter</span>
                        </div>
                    </div>
                </button>
                <div class="enroll-filter">
                    <div class="order-status">입사일
                        <svg width="13" height="8" viewBox="0 0 13 8" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M2.34197 0.584961L6.7892 5.16996L11.2364 0.584961L12.6089 1.99996L6.7892 7.99996L0.969482 1.99996L2.34197 0.584961Z"
                                  fill="black"/>
                        </svg>
                    </div>
                </div>
                <div class="department-filter">
                    <div class="order-type">부서명
                        <svg width="13" height="8" viewBox="0 0 13 8" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M2.34197 0.584961L6.7892 5.16996L11.2364 0.584961L12.6089 1.99996L6.7892 7.99996L0.969482 1.99996L2.34197 0.584961Z"
                                  fill="black"/>
                        </svg>
                    </div>
                </div>
                <div class="position-filter">
                    <div class="filter-by">직무
                        <svg width="13" height="8" viewBox="0 0 13 8" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M2.34197 0.584961L6.7892 5.16996L11.2364 0.584961L12.6089 1.99996L6.7892 7.99996L0.969482 1.99996L2.34197 0.584961Z"
                                  fill="black"/>
                        </svg>
                    </div>
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

            <c:forEach var="m" items="${list}">
                <div class="list-2" onclick="location.href='enrollForm?userNo=${m.userNo}'">
                    <div class="email-2">${m.email}</div>
                    <div class="no-2">${m.userNo}</div>
                    <div class="name-2">${m.userName}</div>
                    <div class="id-2">${m.userId}</div>
                    <div class="phone-2">${m.phone}</div>
                    <div class="text-wrapper-3">${m.gender}</div>
                    <div class="text-wrapper-3">${m.positionName}</div>
                    <div class="enroll-date-2">${m.enrollDate}</div>
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
                    <li class="pre-page"><a class="page-link" href="/company/employee/list?currentPage=${pi.currentPage - 1}"><svg width="29" height="26" style="transform: translateX(-8px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
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
                        <li class="page"><div class="text-wrapper-7"><a class="page-link" href="/company/employee/list?currentPage=${p}">${p}</a></div></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                </c:when>
                <c:otherwise>
                    <li class="next-page"><a class="page-link" href="/company/employee/list?currentPage=${pi.currentPage + 1}"><svg width="29" height="26" style="transform: translateX(-6px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
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
