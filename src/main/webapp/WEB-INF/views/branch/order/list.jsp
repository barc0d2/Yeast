<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/branch/order/list/style.css"/>
    <link rel="stylesheet" href="/css/branch/order/list/globals.css"/>
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
                    <div class="detail-btn" style="cursor: pointer" onclick="night()">상세보기</div>
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
                        <tr  style="cursor: pointer" onclick="location.href='updateForm?supplyNo=${order.supplyNo}'">
                            <td>${order.supplyNo}</td>
                            <td class="btn">
                                <div class="button">
                                    <c:choose>
                                        <c:when test="${order.status == 'N'}">
                                            <span style="color: blue;">발주등록</span>
                                        </c:when>
                                        <c:when test="${order.status == 'R'}">
                                            <span style="color: red;">처리완료</span>
                                        </c:when>
                                        <c:when test="${order.status == 'Y'}">
                                            <span style="color: #009e32;">출하중</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span style="color: gray;">알수없음</span>
                                        </c:otherwise>
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
                <span class="span">${pi.currentPage} </span>
                <span class="text-wrapper-7"> of </span>
                <span class="span">${pi.maxPage}</span>
            </p>
        </div>
    </div>
</div>
<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
<script>
        function night() {
            $.ajax({
                url: '/api/order/night',
                success: function () {
                    alert("22시가 되.");
                },
                error: function (err) {
                    console.error("에러:", err);
                }
            });
        }


</script>
</body>
</html>
