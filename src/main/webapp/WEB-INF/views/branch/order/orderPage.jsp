<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/branch/order/orderPage/style.css"/>
    <link rel="stylesheet" href="/css/branch/order/orderPage/global.css"/>
    <link rel="stylesheet" href="/css/branch/order/orderPage/styleguide.css"/>
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
                        <c:forEach var="bread" items="${list}">
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
        <button type="button" class="purchase-btn" id="submitOrderBtn" onclick="submit2()">
            <div class="cancel">결제</div>
        </button>

        <div class="back">
            <div class="back-btn">이전</div>
        </div>
        <div class="column">
            <div class="line">기본 정보</div>
            <div class="list">
                <div class="div">
                    <p class="p"><span class="text-wrapper">*</span> <span class="span">발주자</span></p>
                    <input name="branchName" class="name">
                </div>
                <div class="div">
                    <div class="line-2">*배송요청일</div>
                    <div class="date">
                        <input type="date" name="orderDate" class="date">
                    </div>
                </div>
                <div class="manager">
                    <div class="box">
                        <div class="btn">
                            <div class="div-wrapper" onclick="submit1()">
                                <div class="text" id="modalOpen">
                                    <div class="line-3" >빵 품목 확인</div>
                                </div>
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
                    </tbody>
                </table>
            </div>


        </div>
    </form>
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

        let SumCount = 0;
        let SumPrice = 0;


        let breadList = [];
        let categoryList = [];
        let quantityList = [];
        let totalPriceList = [];

        let selectedInfo = null;
        modal.onclick = function () {
            mymodal.style.display = "block";
        };
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
                "</tr>" +
                "<input type='hidden' name='category' value='" + selectedInfo.category + "' />" +
                "<input type='hidden' name='breadName' value='" + selectedInfo.breadName + "' />" +
                "<input type='hidden' name='quantity' value='" + quantity + "' />" +
                "<input type='hidden' name='price' value='" + total + "' />";

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
    });


    function submit1() {
        const branchName = document.querySelector('input[name="branchName"]').value;
        const orderDate = document.querySelector('input[name="orderDate"]').value;

        $.ajax({
            url: "/api/order/insert",
            type: "POST",
            data: {
                branchName: branchName,
                orderDate: orderDate
            },
            success: function (res) {
                console.log('성공:', res);
            },
            error: function (err) {
            }
        })
    }


    function submit2() {
        const form = document.getElementById('orderForm');
        form.action = '/branch/order/insertList';
        form.submit();
    }
</script>




<%--<jsp:include page="../sideBar/whiteSideBar.jsp"/>--%>
<%--<jsp:include page="../sideBar/whiteTopBar.jsp"/>--%>
</body>
</html>
