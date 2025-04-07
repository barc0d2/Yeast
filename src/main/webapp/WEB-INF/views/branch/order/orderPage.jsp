<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/css/branch/order/orderPage/style.css"/>
    <link rel="stylesheet" href="/css/branch/order/orderPage/global.css"/>
    <link rel="stylesheet" href="/css/branch/order/orderPage/styleguide.css"/>
</head>
<body>


<div class="screen">
    <div class="container">
        <div id="myModal" class="modal">
            <div class="modalHead">
                빵 품목리스트
                <select name="빵종류" id="">
                    <option value="" disabled selected>빵 종류</option>
                    <option>소금빵</option>
                </select>
                <select name="" id="">

                </select>
                <button id="modalClose">닫기</button>
            </div>
            <div class="modalBody">

            </div>
        </div>

        <div class="cancel">
            <div class="purchase-btn">결제</div>
        </div>
        <div class="back">
            <div class="back-btn">이전</div>
        </div>
        <div class="column">
            <div class="line">기본 정보</div>
            <div class="list">
                <div class="div">
                    <p class="p"><span class="text-wrapper">*</span> <span class="span">발주자</span></p>
                    <input name="" class="name">
                </div>
                <div class="div">
                    <div class="line-2">*납입예정일</div>
                    <div class="date">
                        <input type="date" class="date">
                    </div>
                </div>
                <div class="manager">
                    <div class="line-2">*담당자</div>
                    <div class="box">
                        <input type="text" class="name">
                        <div class="btn">
                            <div class="div-wrapper">
                                <div class="text" id="modalOpen">
                                    <div class="line-3">빵 품목 확인</div>
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
                <div class="total-amount">총 수량 350개</div>
            </div>
            <div class="total-amount-wrapper">
                <div class="total-amount">총 발주 금액 350,000원</div>
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
                    <tbody>
                    <tr>
                        <td>소금빵</td>
                        <td>사과소금빵</td>
                        <td>50</td>
                        <td>50,000</td>
                        <td>
                            <svg class="delete-image" width="28" height="28" viewBox="0 0 28 28" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <rect x="0.709961" y="0.5" width="26.4728" height="27" rx="10" fill="#FF435C"/>
                                <path d="M4.94531 9.69788H23.4762" stroke="white" stroke-width="2"
                                      stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M7.26172 9.69788H21.1599V21.3806C21.1599 21.7248 20.9972 22.055 20.7076 22.2984C20.4181 22.5418 20.0252 22.6786 19.6157 22.6786H8.80596C8.3964 22.6786 8.00362 22.5418 7.71401 22.2984C7.42442 22.055 7.26172 21.7248 7.26172 21.3806V9.69788Z"
                                      stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M10.3506 9.69782V9.04878C10.3506 8.1881 10.7573 7.36267 11.4813 6.75408C12.2053 6.14549 13.1873 5.80359 14.2112 5.80359C15.2351 5.80359 16.2171 6.14549 16.9411 6.75408C17.6651 7.36267 18.0718 8.1881 18.0718 9.04878V9.69782"
                                      stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M11.8945 13.5939V18.7882" stroke="white" stroke-width="2"
                                      stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M16.5273 13.5939V18.7882" stroke="white" stroke-width="2"
                                      stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>

                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>


        </div>
    </div>
</div>
</div>
<script>
    const modal = document.getElementById('modalOpen');
    const mymodal = document.getElementById('myModal');
    const modalClose = document.getElementById('modalClose');

    modal.onclick = function () {
        mymodal.style.display = "block";
    }
    modalClose.onclick = function () {
        mymodal.style.display = "none";
    }


</script>
<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>
</html>
