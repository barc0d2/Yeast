<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/branch/order/updateForm/style.css"/>
    <link rel="stylesheet" href="/css/branch/order/updateForm/global.css"/>
    <link rel="stylesheet" href="/css/branch/order/updateForm/styleguide.css"/>
</head>
<body>


<div class="screen">

    <form id="orderForm" class="container" method="post">
        <div id="myModal" class="modal">
            <div class="modalHead">
                빵 품목리스트
                <button type="button" id="modalClose">닫기</button>
            </div>
            <div id="modalSecond">
                <div id="modalBody">
                    <table class="listTable">
                        <thead>
                        <tr>
                            <th>NO</th>
                            <th>빵 종류</th>
                            <th>빵 이름</th>
                            <th>가격</th>
                            <th>선택</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="bread" items="${bread}">
                            <tr>
                                <td>${bread.breadNo}</td>
                                <td class="category">${bread.categoryName}</td>
                                <td class="breadName">${bread.breadName}</td>
                                <td class="price">${bread.price}</td>
                                <td><input class="radio" name="select" onchange="select(event)" style="transform: scale(1.5)" type="radio"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div id="modalFooter">
                    <div id="breadCount">수량: <input id="quantityInput" type="number" min="0" max="200" step="1" value="0"/></div>
                    <p id="count">갯수 : </p>
                    <p id="price">가격 : </p>
                    <p id="totalPrice">합산: ?</p>
                    <button type="button" id="pushBtn">가져오기</button>
                </div>
            </div>
        </div>
        <button type="button" class="purchase-btn" id="submitOrderBtn" onclick="openPaymentConfirmModal()">
            <div class="cancel">추가</div>
        </button>

        <a href="/branch/order/list">
            <div class="back">
                <div class="back-btn">이전</div>
            </div>
        </a>
        <div class="column">
            <div class="line">기본 정보</div>
            <div class="list">
                <div class="div">
                    <p class="p"><span class="text-wrapper">*</span> <span class="span">발주자</span></p>
                    <input name="branchName"  value="${sessionScope.loginUser.businessName}" class="name">
                </div>
                <div class="div">
                    <div class="line-2">*배송요청일</div>
                    <div class="date">
                        <input type="date" name="orderDate" value="${list.orderDate}" class="date">
                    </div>
                </div>
                    <div class="box" id="modalOpen">
                        <div class="btn" >
                            <div class="div-wrapper" >
                                <div class="text" >
                                    <div class="line-3" >빵 품목 확인</div>
                                </div>
                            </div>
                        </div>

                    </div>
                <br>

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
                    <input type="hidden" name="supplyNo" value="${list.supplyNo}">
                    <input type="hidden" name="status" value="${list.status}">
                    <thead>
                    <tr>
                        <th>빵 종류</th>
                        <th>빵이름</th>
                        <th>갯수</th>
                        <th>구매가격</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody class="tbody">
                    <c:forEach var="supply" items="${supply}">
                        <tr>
                            <td class="category">${supply.categoryName}</td>
                            <td class="breadName">${supply.breadName}</td>
                            <td class="quantity">${supply.quantity}</td>
                            <td class="price">${supply.price}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>


        </div>
    </form>
    <div id="payment-confirm-modal" class="payment-confirm-modal hidden">
        <div class="payment-confirm-modal-content">
            <h3>정말로 송금하시겠습니까?</h3>

            <div class="payment-confirm-row">
                <span>현 자금</span>
                <span id="confirm-current">80,667,020원</span>
            </div>
            <div class="payment-confirm-row">
                <span>결제 금액</span>
                <span id="confirm-payment">350,000원</span>
            </div>
            <div class="payment-confirm-row">
                <span>남은 잔액</span>
                <span id="confirm-remaining">80,317,020원</span>
            </div>

            <div class="payment-confirm-buttons">
                <button onclick="submitConfirmedPayment()">보내기</button>
                <button onclick="closePaymentConfirmModal()">취소</button>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const modal = document.getElementById('modalOpen');
        const mymodal = document.getElementById('myModal');
        const modalClose = document.getElementById('modalClose');
        const quantityInput = document.querySelector('#quantityInput');
        const countDisplay = document.querySelector('#count');
        const totalPrice = document.querySelector('#totalPrice');
        const tbody = document.querySelector('.tbody');
        const totalCount = document.querySelector('#totalCount');
        const sumPrice = document.querySelector('#sumPrice');
        const pushBtn = document.querySelector('#pushBtn');
        const submitOrderBtn = document.getElementById('submitOrderBtn');
        const modalOpenBtn = document.getElementById('modalOpen');

        // status 값 가져오기
        const status = document.querySelector('input[name="status"]').value;

        // status가 'R' 또는 'Y'인 경우 버튼 비활성화
        if (status === 'R' || status === 'Y') {
            // 추가 버튼 비활성화 및 스타일 변경
            // submitOrderBtn.disabled = true;
            submitOrderBtn.style.opacity = '0.5';
            submitOrderBtn.style.cursor = 'not-allowed';

            // 품목 확인 버튼도 비활성화
            //modalOpenBtn.style.pointerEvents = 'none';
            modalOpenBtn.style.opacity = '0.5';
            modalOpenBtn.style.cursor = 'not-allowed';

            // 원래 클릭 이벤트를 제거하고 새 이벤트 추가
            submitOrderBtn.onclick = function() {
                const message = status === 'R' ? '이미 승인 신청된 발주입니다.' : '이미 승인된 발주입니다.';
                alert(message);
            };

            modalOpenBtn.onclick = function() {
                const message = status === 'R' ? '이미 승인 신청된 발주입니다.' : '이미 승인된 발주입니다.';
                alert(message);
                return false;
            };
        }

        let SumCount = 0;
        let SumPrice = 0;

        const quantity = document.querySelectorAll('.quantity');
        const priceList = document.querySelectorAll('.price');

        quantity.forEach((qtyEl, index) => {
            const qty = parseInt(qtyEl.textContent.trim()) || 0;
            const price = parseInt(priceList[index].textContent.trim()) || 0;

            SumCount += qty;
            SumPrice += price;
        });
        totalCount.innerText = "총 수량 "+SumCount + "개";
        sumPrice.innerText = "총 발주 금액" + SumPrice + "원";

        let breadList = [];
        let categoryList = [];
        let quantityList = [];
        let totalPriceList = [];

        let selectedInfo = null;

        // status가 'N'일 때만 모달 이벤트 활성화
        if (status === 'N') {
            modal.onclick = function () {
                mymodal.style.display = "block";
            };
        }

        modalClose.onclick = function () {
            mymodal.style.display = "none";
        };
        document.querySelectorAll('.radio').forEach(radio => {
            radio.addEventListener('change', select);
        });
        function select(event) {
            const selectedRow = event.target.closest('tr');
            const category = selectedRow.querySelector('.category').textContent;
            const breadName = selectedRow.querySelector('.breadName').textContent;
            const price = parseInt(selectedRow.querySelector('.price').textContent);
            selectedInfo = { category, breadName, price };
            document.querySelector('#modalFooter').querySelector('#price').innerText = "가격 : " + price + "₩";
            quantityInput.value = 1;
            countDisplay.innerText = "갯수: 1개";
            totalPrice.innerText = "합산: " + price + "₩";
        }
        quantityInput.addEventListener('input', () => {
            if (selectedInfo) {
                const qty = parseInt(quantityInput.value);
                countDisplay.innerText = "갯수: " + qty + "개";
                totalPrice.innerText = "합산: " + (qty * selectedInfo.price) + "₩";
            }
        });

        pushBtn.addEventListener('click', () => {
            if (!selectedInfo) return;
            const quantity = parseInt(quantityInput.value);
            const total = quantity * selectedInfo.price;
            SumCount += quantity;
            SumPrice += total;
            tbody.innerHTML +=
                "<tr>" +
                "<td>" + selectedInfo.category + "</td>" +
                "<td>" + selectedInfo.breadName + "</td>" +
                "<td>" + quantity + "</td>" +
                "<td>" + total + "₩</td>" +
                "<td>" +
                "<svg class='delete-image' width='28' height='28' viewBox='0 0 28 28' fill='none' xmlns='http://www.w3.org/2000/svg' style='cursor:pointer'>" +
                "<rect x='0.709961' y='0.5' width='26.4728' height='27' rx='10' fill='#FF435C'/>" +
                "<path d='M4.94531 9.69788H23.4762' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/>" +
                "<path d='M7.26172 9.69788H21.1599V21.3806C21.1599 21.7248 20.9972 22.055 20.7076 22.2984C20.4181 22.5418 20.0252 22.6786 19.6157 22.6786H8.80596C8.3964 22.6786 8.00362 22.5418 7.71401 22.2984C7.42442 22.055 7.26172 21.7248 7.26172 21.3806V9.69788Z' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/>" +
                "<path d='M10.3506 9.69782V9.04878C10.3506 8.1881 10.7573 7.36267 11.4813 6.75408C12.2053 6.14549 13.1873 5.80359 14.2112 5.80359C15.2351 5.80359 16.2171 6.14549 16.9411 6.75408C17.6651 7.36267 18.0718 8.1881 18.0718 9.04878V9.69782' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/>" +
                "<path d='M11.8945 13.5939V18.7882' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/>" +
                "<path d='M16.5273 13.5939V18.7882' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/>" +
                "</svg>" +
                "</td>" +
                "<input type='hidden' name='category' value='" + selectedInfo.category + "' />" +
                "<input type='hidden' name='breadName' value='" + selectedInfo.breadName + "' />" +
                "<input type='hidden' name='quantity' value='" + quantity + "' />" +
                "<input type='hidden' name='price' value='" + total + "' />"+
                "</tr>"
                ;

                categoryList.push(selectedInfo.category);
                breadList.push(selectedInfo.breadName);
                quantityList.push(quantity);
                totalPriceList.push(total);

            totalCount.innerText = "총 수량 "+SumCount + "개";
            sumPrice.innerText = "총 발주 금액" + SumPrice + "원";
        });

        tbody.addEventListener('click', (e) => {
            if (e.target.closest('.delete-image')) {
                const row = e.target.closest('tr');
                if (row) row.remove();
            }
        });

        window.openPaymentConfirmModal = function () {
            const current = 80667020; // 예: 현재 잔액
            const payment = SumPrice;
            const remain = current - payment;

            document.getElementById("confirm-current").innerText = current.toLocaleString() + "원";
            document.getElementById("confirm-payment").innerText = payment.toLocaleString() + "원";
            document.getElementById("confirm-remaining").innerText = remain.toLocaleString() + "원";

            document.getElementById("payment-confirm-modal").classList.remove("hidden");
        }

        window.closePaymentConfirmModal = function () {
            document.getElementById("payment-confirm-modal").classList.add("hidden");
        }

        window.submitConfirmedPayment = function() {
            if(selectedInfo == null){
                alert("발주품목을 추가 하지 않았습니다.")
            }else{
            const form = document.getElementById('orderForm');
            form.action = '/branch/order/updateList';
            form.submit();
            alert("수정이 완료되었습니다.");
            closePaymentConfirmModal();
            }
        }


    });

</script>




<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>
</html>
