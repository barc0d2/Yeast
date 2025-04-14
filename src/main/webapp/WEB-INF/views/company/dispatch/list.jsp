<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/css/company/dispatch/list/style.css"/>
    <link rel="stylesheet" href="/css/company/dispatch/list/globals.css"/>
    <link rel="stylesheet" href="/css/company/dispatch/list/styleguide.css"/>
</head>
<body>
<div class="main">
    <div class="container">
        <div class="content">
            <div class="navbar">
                <table>
                    <thead>
                    <tr>
                        <th>발주번호</th>
                        <th>상태</th>
                        <th>배송요청일</th>
                        <th>발주일자</th>
                        <th>발주금액</th>
                        <th>발주자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dispatch" items="${list}">
                        <tr  style="cursor: pointer" onclick="location.href='approval?supplyNo=${dispatch.supplyNo}'">
                            <td>${dispatch.supplyNo}</td>
                            <td class="btn">
                                <div class="button">
                                    <c:choose>
                                        <c:when test="${dispatch.status == 'R'}">
                                            <span style="color: red;">출하승인 대기중</span>
                                        </c:when>
                                        <c:when test="${dispatch.status == 'Y'}">
                                            <span style="color: blue;">출하승인 완료</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: gray;">알수없음</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                            <td>${dispatch.orderDate}</td>
                            <td>${dispatch.createDate}</td>
                            <td>${dispatch.price * 0.25}</td>
                            <td>${dispatch.client}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <p class="page-no">
                <span class="span">${pi.currentPage} </span>
                <span class="text-wrapper-7"> of </span>
                <span class="span">${pi.maxPage}</span>
            </p>
        </div>
        <div style="background: white; border: #6e6e6e 1px solid; border-radius: 10px">
            <div class="indicator">
                <a  href="/company/dispatch/list?currentPage=${pi.currentPage - 1}"><svg width="45" height="53" viewBox="0 0 45 53" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g opacity="0.9">
                        <path d="M29.8623 16.6313L21.3142 26.5228L29.8623 36.4143L27.2307 39.4529L16.0322 26.5228L27.2307 13.5928L29.8623 16.6313Z" fill="#202224"/>
                    </g>
                </svg>
                </a>

                <a  href="/company/dispatch/list?currentPage=${pi.currentPage + 1}">
                    <svg width="46" height="53" viewBox="0 0 46 53" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g opacity="0.9">
                            <path d="M16.6923 36.4143L25.2405 26.5228L16.6923 16.6313L19.324 13.5928L30.5225 26.5228L19.324 39.4529L16.6923 36.4143Z" fill="#202224"/>
                        </g>
                    </svg>
                </a>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
