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
                        <th>발주금액</th>
                        <th>발주자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="dispatch" items="${list}">
                        <tr onclick="location.href='enrollForm?supplyNo=${dispatch.supplyNo}'">
                            <td>${dispatch.supplyNo}</td>
                            <td class="btn">
                                <div class="button">
                                    <c:choose>
                                        <c:when test="${dispatch.status == 'R'}">
                                            <span style="color: blue;">출하승인 대기중</span>
                                        </c:when>
                                        <c:when test="${dispatch.status == 'Y'}">
                                            <span style="color: red;">출하승인</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: gray;">알수없음</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                            <td>${dispatch.orderDate}</td>
                            <td>${dispatch.createDate}</td>
                            <td>${dispatch.price}</td>
                            <td>${dispatch.client}</td>
                        </tr>
                    </c:forEach>
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
        </div>
    </div>
</div>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
