<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/company/storemangement/payslip/globals.css" />
    <link rel="stylesheet" href="/css/company/storemangement/payslip/styleguide.css" />
    <link rel="stylesheet" href="/css/company/storemangement/payslip/style.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslipToggle/globals.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslipToggle/style.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslipToggle/styleguide.css" />
</head>
<body>
    <div class="store-specific">
        <div class="form">
            <div class="out-frame">
                <div class="frame">
                    <div class="frame-align">
                        <p class="worker-payment">
                            <span class="text-wrapper">근로자</span>
                            <span class="span">&nbsp;</span>
                            <span class="text-wrapper-2">임금명세서</span>
                        </p>
                        <div class="input">
                            <div class="line">
                                <div class="div">
                                    <div class="text"><div class="text-wrapper-3">이름</div></div>
                                    <div class="div-wrapper"><div class="text-wrapper-4">${member.userName}</div></div>
                                </div>
                                <div class="div">
                                    <div class="text"><div class="text-wrapper-3">사번</div></div>
                                    <div class="input-2"><div class="text-wrapper-4">${member.userNo}</div></div>
                                </div>
                            </div>
                            <div class="line">
                                <div class="div">
                                    <div class="text"><div class="business">사업장</div></div>
                                    <div class="input-3">
                                        <div class="text-wrapper-4">${member.businessName}</div>
                                    </div>
                                </div>
                                <div class="div">
                                    <div class="text"><div class="text-wrapper-3">직무</div></div>
                                    <div class="div-wrapper"><div class="text-wrapper-4">${member.positionName}</div></div>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="payment-wrapper"><div class="text-wrapper-5">급여액(월)</div></div>
                                <div class="input-4">
                                    <div class="text-wrapper-6 uu"><fmt:formatNumber value="${member.salary + member.bonus}" type="number" /></div>
                                    <div class="won">원</div>
                                </div>
                            </div>
                            <div class="line-2">
                                <div class="deduction">
                                    <p class="element">
                                        <span class="text-wrapper-7">*</span>
                                        <span class="text-wrapper-8">
                                            월소득액 $<fmt:formatNumber value="${member.salary + member.bonus}" type="number" />원 = 급여액 <fmt:formatNumber value="${member.salary + member.bonus}" type="number" />원 - 비과세액 0원
                                        </span>
                                    </p>
                                    <div class="text-wrapper-9">공제내역</div>
                                </div>
                            </div>
                            <div class="table">
                                <div class="table-in">
                                    <div class="line-3">
                                        <div class="text-2">
                                            <div class="div-3"><div class="text-wrapper-10">국민연금료</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                        <div class="input-in-wrapper">
                                            <div class="input-in"><div class="text-wrapper-10"><fmt:formatNumber value="${(member.salary + member.bonus)*0.03545}" pattern="#,###" />원×12.81%</div></div>
                                        </div>
                                        <div class="money">
                                            <fmt:formatNumber value="${(member.salary + member.bonus)*0.03545*0.1281}" pattern="#,###" var="o1"/>
                                            <div class="text-wrapper-11 o1">${o1}</div>
                                            <div class="text-wrapper-12">원</div>
                                        </div>
                                    </div>
                                    <div class="line-4">
                                        <div class="text-2">
                                            <div class="div-3"><div class="text-wrapper-10">건강보험료</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                        <div class="input-in-wrapper">
                                            <div class="input-in-2"><div class="text-wrapper-10"><fmt:formatNumber value="${member.salary + member.bonus}" pattern="#,###" />원×4.5%</div></div>
                                        </div>
                                        <div class="money-2">
                                            <fmt:formatNumber value="${(member.salary + member.bonus)*0.045}" pattern="#,###" var="o2"/>
                                            <div class="text-wrapper-13 o2">${o2}</div>
                                            <div class="text-wrapper-14">원</div>
                                        </div>
                                    </div>
                                    <div class="line-3">
                                        <div class="text-2">
                                            <div class="div-3"><div class="text-wrapper-10">장기요양보험료</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                        <div class="input-in-wrapper">
                                            <div id="input-in-2-jangi" ><div class="text-wrapper-10"><fmt:formatNumber value="${member.salary + member.bonus}" pattern="#,###" />원×3.545%</div></div>
                                        </div>
                                        <div class="money">
                                            <fmt:formatNumber value="${(member.salary + member.bonus)*0.03545}" pattern="#,###"  var="o3" />
                                            <div class="text-wrapper-11 o3">${o3}</div>
                                            <div class="text-wrapper-12">원</div>
                                        </div>
                                    </div>
                                    <div class="line-5">
                                        <div class="text-2">
                                            <div class="div-3"><div class="text-wrapper-10">고용보험료</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                        <div class="input-in-wrapper">
                                            <div class="input-in"><div class="text-wrapper-10"><fmt:formatNumber value="${member.salary + member.bonus}" pattern="#,###" />원×0.9%</div></div>
                                        </div>
                                        <div class="money">
                                            <fmt:formatNumber value="${(member.salary + member.bonus)*0.009}" pattern="#,###" var="o4" />
                                            <div class="text-wrapper-11 o4">${o4}</div>
                                            <div class="text-wrapper-12">원</div>
                                        </div>
                                    </div>
                                    <div class="line-3">
                                        <div class="text-2">
                                            <div class="div-3"><div class="text-wrapper-10">근로소득세</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                        <div class="text-2">
                                            <div class="div-3">
                                                <div class="text-wrapper-10">소득세법 시행령 189조 별표2(근로소득세간이세액표)</div>
                                                <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                                </svg>
                                            </div>
                                        </div>
                                        <div class="money">
                                            <fmt:formatNumber value="${(member.salary + member.bonus)*0.104}" pattern="#,###" var="o5" />
                                            <div class="text-wrapper-11 o5">${o5}</div>
                                            <div class="text-wrapper-12">원</div>
                                        </div>
                                    </div>
                                    <div class="line-6">
                                        <div class="text-2">
                                            <div class="div-3"><div class="text-wrapper-10">지방소득세</div></div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                        <div class="input-in-wrapper">
                                            <div id="jibang"><div class="text-wrapper-10 o2"><fmt:formatNumber value="${(member.salary + member.bonus)*0.104}" pattern="#,###" />원×10%</div></div>
                                        </div>
                                        <div class="money">
                                            <fmt:formatNumber value="${(member.salary + member.bonus)*0.0104}" pattern="#,###" var="o6"/>
                                            <div class="text-wrapper-11 o6">${o6}</div>
                                            <div class="text-wrapper-12">원</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                <!-- 공제 내역은 실제 공제 항목이 올바르게 서버에서 전달되었을 때 동적으로 출력 -->
                            </div>
                            <div class="div-2">
                                <div class="text-3"><div class="text-wrapper-5">공제액 합계</div></div>
                                <div class="input-5">
                                    <div class="text-wrapper-4 r1"></div>
                                    <div class="won">원</div>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="text-3"><div class="text-wrapper-5">예상 실수령액(월)</div></div>
                                <div class="input-6">
                                    <div class="text-wrapper-4 r2"></div>
                                    <div class="won">원</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

        <section class="click">
            <c:choose>
                <c:when test="${paid == 1}">
                    <button id="openModal" class="div-2" style="background:#d7f4ff">
                        <div class="text-4"><span class="text-wrapper-15">송금완료</span></div>
                    </button>
                </c:when>
                <c:otherwise>
                    <button onclick="toggleModal()" id="openModal" class="div-2" style="cursor: pointer">
                        <div class="text-4"><span class="text-wrapper-15">송금하기</span></div>
                    </button>
                </c:otherwise>
            </c:choose>

            <button class="div-2" style="cursor: pointer" onclick="location.href='/company/specification/list'">
                <div class="text-4"><span class="text-wrapper-15">목록으로</span></div>
            </button>
        </section>
    </div>
    <form class="toggle" id="toggle" style="display: none;
       position: fixed;
       top: 50%;
       left: 50%;
       transform: translate(-50%, -50%);"
       method="post" action="/company/specification/payment">
        <div class="question">
            <div class="text">정말로 송금하시겠습니까?</div>
        </div>
        <div class="output">
            <div class="outline">
                <div class="current-fund-wrapper">
                    <div class="text-wrapper">현 자금</div>
                </div>
                <div class="money">
                    <div class="div">
                        <fmt:formatNumber value="${money}" type="number" />
                    </div>
                    <div class="won">원</div>
                </div>
            </div>
            <div class="outline">
                <div class="div-wrapper">
                    <div class="text-wrapper">차감 금액</div>
                </div>
                <div class="money-2">
                    <input name="deduction" class="div" style="border: none; background: none; outline: none; padding: 0; margin: 0;" value="<fmt:formatNumber value="${member.salary + member.bonus}" type="number" />"/>
                    <div class="won">원</div>
                </div>
            </div>
            <div class="outline">
                <div class="div-wrapper">
                    <div class="text-wrapper">남은 잔액</div>
                </div>
                <div class="money-3">
                    <div id="remain" class="div">
                    <fmt:formatNumber value="${money - member.salary - member.bonus}" type="number" />
                    </div>
                    <div class="won">원</div>
                </div>
            </div>
            <input type="hidden" name="userNo" value="${member.userNo}"/>
        </div>
        <div class="send">
            <button type="submit" class="send-2">보내기</button>
        </div>

        <div class="cancel" onclick="toggleModal()">
            <button type="button" class="cancel-2">취소</button>
        </div>
    </form>
<script>
    const o1 = document.querySelector(".o1").textContent;
    let n1 = parseInt(o1.replace(/,/g, ''));
    const o2 = document.querySelector(".o2").textContent;
    let n2 = parseInt(o2.replace(/,/g, ''));
    const o3 = document.querySelector(".o3").textContent;
    let n3 = parseInt(o3.replace(/,/g, ''));
    const o4 = document.querySelector(".o4").textContent;
    let n4 = parseInt(o4.replace(/,/g, ''));
    const o5 = document.querySelector(".o5").textContent;
    let n5 = parseInt(o5.replace(/,/g, ''));
    const o6 = document.querySelector(".o6").textContent;
    let n6 = parseInt(o6.replace(/,/g, ''));
    const uu = document.querySelector(".uu").textContent;
    let nu = parseInt(uu.replace(/,/g, ''));

    let r1 = n1 + n2 + n3 + n4 + n5 + n6;

    let r2 = nu - r1;

    document.querySelector(".r1").innerText = r1.toLocaleString();

    document.querySelector(".r2").innerText = r2.toLocaleString();

    function toggleModal(){
        const modal = document.querySelector("#toggle");
        modal.style.display = modal.style.display === "none" ? "block" : "none";
    }
</script>

<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>

</body>
</html>
