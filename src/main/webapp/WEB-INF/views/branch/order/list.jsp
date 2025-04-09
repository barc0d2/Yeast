<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/css/branch/order/list/style.css"/>
    <link rel="stylesheet" href="/css/branch/order/list/global.css"/>
    <link rel="stylesheet" href="/css/branch/order/list/styleguide.css"/>
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
                    <c:forEach var="order" items="${list}">
                        <tr>
                            <td>${order.supplyNo}</td>
                            <td class="btn">
                                <div class="button">
                                    <c:choose>
                                        <c:when test="${order.status == 'N'}">발주등록</c:when>
                                        <c:when test="${order.status == 'Y'}">처리완료</c:when>
                                        <c:otherwise>알수없음</c:otherwise>
                                    </c:choose>
                                </div>
                            </td>
                            <td>${order.orderDate}</td>
                            <td>${order.createDate}</td>
                            <td>${order.price}</td>
                            <td>${order.client}</td>
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
            <p class="total-amount">총 발주 금액 1,000,000,000 원</p>
        </div>
    </div>
</div>
<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>
</html>
