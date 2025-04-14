<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/company/storemangement/monthlyFee/globals.css" />
    <link rel="stylesheet" href="/css/company/storemangement/monthlyFee/styleguide.css" />
    <link rel="stylesheet" href="/css/company/storemangement/monthlyFee/style.css" />
</head>
<body>
<h1>디버깅</h1>
<p>salary: ${salary}</p>
<p>totalSellMoney: ${totalSellMoney}</p>
<p>money: ${money}</p>
<div class="company">
    <div class="form">
        <div class="filter-container">
        </div>
        <div class="out-frame">
            <div class="frame">
                <div class="frame-align">
                    <p class="branch-payment">
                        <span class="text-wrapper">사업장 </span> <span class="span">월 수수료</span>
                    </p>
                    <div class="input">
                        <div class="line">
                            <div class="div">
                                <div class="text"><div class="text-wrapper-2">이름</div></div>
                                <div class="name-wrapper"><div class="text-wrapper-3">${sessionScope.loginUser.userName}</div></div>
                            </div>
                            <div class="div">
                                <div class="text"><div class="text-wrapper-2">사번</div></div>
                                <div class="div-wrapper"><div class="text-wrapper-3">${sessionScope.loginUser.userNo}</div></div>
                            </div>
                        </div>
                        <div class="line">
                            <div class="div">
                                <div class="text"><div class="business">사업장</div></div>
                                <div class="input-2"><div class="text-wrapper-3">${sessionScope.loginUser.businessName}</div></div>
                            </div>
                            <div class="div">
                                <div class="text"><div class="text-wrapper-2">직무</div></div>
                                <div class="posiotion-wrapper"><div class="text-wrapper-3">${sessionScope.loginUser.positionName}</div></div>
                            </div>
                        </div>
                        <div class="line-2">
                            <div class="input-3">
                                <div class="text-wrapper-4"><fmt:formatNumber value="${monthSellMoney}" type="number" /></div>
                                <div class="won">원</div>
                            </div>
                            <div class="total-salary"><div class="text-wrapper-3">월 수익 총액</div></div>
                        </div>
                        <div class="line-3">
                            <div class="deduction"><div class="deduction-detail">공제내역</div></div>
                            <div class="table">
                                <div class="table-in">
                                    <div class="line-4">
                                        <div class="text-2">
                                            <div class="name"><div class="text-wrapper-5">브랜드 수수료</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>
                                        </div>
                                        <div class="input-in-wrapper">
                                            <div class="input-in"><div class="text-wrapper-5"><fmt:formatNumber value="${monthSellMoney}" type="number" />원×5%</div></div>
                                        </div>
                                        <div class="money">
                                            <div class="number"><fmt:formatNumber value="${(monthSellMoney * 0.05)}" type="number" /></div>
                                            <div class="won-2">원</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="line-2">
                            <div class="text-3"><div class="text-wrapper-6">공제액 합계</div></div>
                            <div class="input-4">
                                <div class="text-wrapper-3"><fmt:formatNumber value="${(monthSellMoney * 0.05)}" type="number" /></div>
                                <div class="won">원</div>
                            </div>
                        </div>
                        <div class="line-2">
                            <div class="text-3"><div class="text-wrapper-6">예상 실수령액(월)</div></div>
                            <div class="input-4">
                                <div class="text-wrapper-3"><fmt:formatNumber value="${(monthSellMoney * 0.05)}" type="number" /></div>
                                <div class="won">원</div>
                            </div>
                        </div>
                        <c:choose>
                            <c:when test="${status == 1}">
                                <div class="line-5 status-done" id="statusBox">
                                    <div class="text-3">
                                        <div class="text-wrapper-6">지급 여부</div>
                                    </div>
                                    <div class="incomplete-wrapper">
                                        <div class="text-wrapper-3" id="statusText">완료</div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="line-5 status-pending" id="statusBox">
                                    <div class="text-3">
                                        <div class="text-wrapper-6">지급 여부</div>
                                    </div>
                                    <div class="incomplete-wrapper">
                                        <div class="text-wrapper-3" id="statusText">미완료</div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <c:choose>
            <c:when test="${status == 0}">
            <form action="/branch/specification/monthlyFeePay" method="POST">
                <button class="click" type="submit">
                    <div id="payForm">
                        <input type="hidden" name="money" value="<fmt:formatNumber value='${monthSellMoney * 0.5}' type='number' maxFractionDigits='0' groupingUsed='false'/>">
                        <div class="submitPay" >송금하기</div>
                    </div>
                </button>
            </form>
            </c:when>
            <c:otherwise>
            <div class="click">
                <div class="submitPay" style="color:gray">송금완료</div>
            </div>
            </c:otherwise>
        </c:choose>
</div>
<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>
</html>
