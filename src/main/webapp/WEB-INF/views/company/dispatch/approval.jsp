<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/company/dispatch/approval/style.css"/>
    <link rel="stylesheet" href="/css/company/dispatch/approval/global.css"/>
    <link rel="stylesheet" href="/css/company/dispatch/approval/styleguide.css"/>
</head>
<body>


<div class="screen">

    <form id="orderForm" class="container" method="post">
        <button type="button" class="purchase-btn" id="submitOrderBtn" onclick="openPaymentConfirmModal()">
            <div class="cancel">승인</div>
        </button>
        <a href="/company/dispatch/list">
        <div class="back">
            <div class="back-btn">이전</div>
        </div>
        </a>
        <div class="column">
            <div class="line">기본 정보</div>
            <div class="list">
                <div class="div">
                    <p class="p"><span class="text-wrapper">*</span> <span class="span">발주자</span></p>
                    <input name="branchName"  value="${list.branchName}" class="name" readonly>
                </div>
                <div class="div">
                    <div class="line-2">*배송요청일</div>
                    <div class="date">
                        <input type="date" name="orderDate" value="${list.orderDate}" class="date">
                        <input type="hidden" name="supplyNo" value="${list.supplyNo}">
                    </div>
                </div>
            </div>
        </div>
        <div class="total">
            <div class="total-amount-wrapper">
                <div class="total-amount" id="totalCount">총 수량 </div>
            </div>
            <div class="total-amount-wrapper">
                <div class="total-amount" id="sumPrice">총 발주 금액 </div>
            </div>
        </div>
        <div class="content">

            <div class="table">
                <table id="order-table">
                    <thead>
                    <tr>
                        <th>빵 종류</th>
                        <th>빵이름</th>
                        <th>갯수</th>
                        <th>구매가격</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <c:set var="totalPrice" value="0" />
                    <c:set var="totalQuantity" value="0" />
                    <script>
                        let totalPriceJS = 0;
                        let totalQuantityJS = 0;
                    </script>
                        <c:forEach var="supply"  items="${supply}">
                            <tr>
                                <td>${supply.categoryName}</td>
                                <td>${supply.breadName}</td>
                                <td>${supply.quantity}</td>
                                <td>${supply.price}</td>
                            </tr>

                            <script>
                                totalPriceJS += ${supply.price};
                                totalQuantityJS += ${supply.quantity};
                            </script>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </form>
    <div id="payment-confirm-modal" class="payment-confirm-modal hidden">
        <div class="payment-confirm-modal-content">
            <h3>정말로 승인하시겠습니까?</h3>
            <br>
            <div class="payment-confirm-buttons">
                <button onclick="submitConfirmedPayment()">승인</button>
                <button onclick="closePaymentConfirmModal()">취소</button>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        function updateTotalValues() {
            document.getElementById('totalCount').textContent = '총 수량: ' + totalQuantityJS  + ' 개';
            document.getElementById('sumPrice').textContent = '총 발주 금액: ' + totalPriceJS.toLocaleString() + ' 원';
        }

        updateTotalValues(); // 페이지 로딩 시 바로 실행

    });

    window.openPaymentConfirmModal = function () {
        document.getElementById("payment-confirm-modal").classList.remove("hidden");
    }

    window.closePaymentConfirmModal = function () {
        document.getElementById("payment-confirm-modal").classList.add("hidden");
    }

    window.submitConfirmedPayment = function() {
        const form = document.getElementById('orderForm');
        form.action = '/company/dispatch/approvalOk';
        form.submit();
        alert("승인이 완료되었습니다.");
        closePaymentConfirmModal();
    }

    document.addEventListener('DOMContentLoaded', function () {
        const status = "${list.status}";

        if (status === "Y") {
            const btn = document.getElementById('submitOrderBtn');
            const cancelDiv = document.querySelector('#submitOrderBtn .cancel');

            btn.onclick = function (e) {
                e.preventDefault();
                alert("이미 승인된 건입니다.");
            };

            cancelDiv.style.backgroundColor = '#5ea9f4'; // 연한 파란색
            cancelDiv.style.border = '1px solid #99ccff';
            cancelDiv.style.cursor = 'not-allowed';
            cancelDiv.style.opacity = '0.7';
            btn.querySelector('.cancel').innerText = '승인 완료';
        }
    });


</script>




<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
