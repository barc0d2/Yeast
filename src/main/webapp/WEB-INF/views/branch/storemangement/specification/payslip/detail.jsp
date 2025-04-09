<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslip/globals.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslip/styleguide.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslip/style.css" />
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
                                <div class="div-wrapper"><div class="text-wrapper-4">${employee.userName}</div></div>
                            </div>
                            <div class="div">
                                <div class="text"><div class="text-wrapper-3">사번</div></div>
                                <div class="input-2"><div class="text-wrapper-4">${employee.userNo}</div></div>
                            </div>
                        </div>
                        <div class="line">
                            <div class="div">
                                <div class="text"><div class="business">사업장</div></div>
                                <div class="input-3">
                                    <div class="text-wrapper-4">${employee.businessName}</div>
                                </div>
                            </div>
                            <div class="div">
                                <div class="text"><div class="text-wrapper-3">직무</div></div>
                                <div class="div-wrapper"><div class="text-wrapper-4">${employee.positionName}</div></div>
                            </div>
                        </div>
                        <div class="div-2">
                            <div class="payment-wrapper"><div class="text-wrapper-5">급여액(월)</div></div>
                            <div class="input-4">
                                <div class="text-wrapper-6"><fmt:formatNumber value="${employee.salary}" type="number" /></div>
                                <div class="won">원</div>
                            </div>
                        </div>
                        <div class="line-2">
                            <div class="deduction">
                                <p class="element">
                                    <span class="text-wrapper-7">*</span>
                                    <span class="text-wrapper-8">
                                        월소득액 $<fmt:formatNumber value="${employee.salary}" type="number" />원 = 급여액 <fmt:formatNumber value="${employee.salary}" type="number" />원 - 비과세액 0원
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
                                        <div class="input-in"><div class="text-wrapper-10">71,270원×12.81%</div></div>
                                    </div>
                                    <div class="money">
                                        <div class="text-wrapper-11">9,120</div>
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
                                        <div class="input-in-2"><div class="text-wrapper-10">2,010,580원×4.5%</div></div>
                                    </div>
                                    <div class="money-2">
                                        <div class="text-wrapper-13">90,450</div>
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
                                        <div id="input-in-2-jangi" ><div class="text-wrapper-10">2,010,580원×3.545%</div></div>
                                    </div>
                                    <div class="money">
                                        <div class="text-wrapper-11">71,270</div>
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
                                        <div class="input-in"><div class="text-wrapper-10">2,010,580원×0.9%</div></div>
                                    </div>
                                    <div class="money">
                                        <div class="text-wrapper-11">18,090</div>
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
                                    <div class="input-in-wrapper">
                                        <div id="text-glo">
                                            <div class="text-wrapper-10">소득세법 시행령 189조 별표2(근로소득세간이세액표)</div>
                                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M7 0.258789C3.54825 0.258789 0.75 3.05692 0.75 6.50881C0.75 9.96069 3.54825 12.7588 7 12.7588C10.4517 12.7588 13.25 9.96069 13.25 6.50881C13.25 3.05692 10.4517 0.258789 7 0.258789ZM7 3.3838C7.34519 3.3838 7.625 3.6638 7.625 4.0088C7.625 4.3538 7.34519 4.6338 7 4.6338C6.65481 4.6338 6.375 4.3538 6.375 4.0088C6.375 3.6638 6.65481 3.3838 7 3.3838ZM7 5.2588C7.34519 5.2588 7.625 5.5388 7.625 5.8838V9.00881C7.625 9.35381 7.34519 9.63381 7 9.63381C6.65481 9.63381 6.375 9.35381 6.375 9.00881V5.8838C6.375 5.5388 6.65481 5.2588 7 5.2588Z" fill="#2A343D"/>
                                            </svg>

                                        </div>
                                    </div>
                                    <div class="money">
                                        <div class="text-wrapper-11">19,850</div>
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
                                        <div id="jibang"><div class="text-wrapper-10">19,850원×10%</div></div>
                                    </div>
                                    <div class="money">
                                        <div class="text-wrapper-11">1,980</div>
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
                                <div class="text-wrapper-4">210,760</div>
                                <div class="won">원</div>
                            </div>
                        </div>
                        <div class="div-2">
                            <div class="text-3"><div class="text-wrapper-5">예상 실수력액(월)</div></div>
                            <div class="input-6">
                                <div class="text-wrapper-4"><fmt:formatNumber value="${employee.salary - 210760}" type="number" /></div>
                                <div class="won">원</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    <section class="click">
        <button class="div-2" onclick="openPaySlipToggle(${employee.userNo}, ${employee.salary})">
            <div class="text-4"><span class="text-wrapper-15">송금하기</span></div>
        </button>

        <button class="div-2" onclick="location.href='/branch/storemangement/specification/table/table'">
            <div class="text-4"><span class="text-wrapper-15">목록으로</span></div>
        </button>
    </section>

</div>

<script>
    const userName = "${employee.userName}";
    const encodedUserName = encodeURIComponent(userName);

    // 이건 사용 안 한다면 지워도 돼
    function openRemitModal(userNo) {
        document.getElementById("remitModal").style.display = "block";
        document.getElementById("modalBackdrop").style.display = "block";
    }

    function closeRemitModal() {
        document.getElementById("remitModal").style.display = "none";
        document.getElementById("modalBackdrop").style.display = "none";
    }

    // ✅ 여기가 중요!
    function openPaySlipToggle(userNo, salary) {
        const url = `/branch/storemangement/specification/payslipToggle/payslipToggle?userNo=${employee.userNo}&salary=${employee.salary}`;

        console.log("employee.userNo =", "${employee.userNo}");
        console.log("employee.salary =", "${employee.salary}");
        fetch(url)
            .then(response => response.text())
            .then(html => {
                document.getElementById("modal-body").innerHTML = html;
                document.getElementById("payslipModal").style.display = "block";
            })
            .catch(error => {
                console.error("모달 로딩 실패:", error);
            });
    }
</script>

<jsp:include page="../../../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../../../sideBar/whiteTopBar.jsp"/>

<!-- ✅ 모달은 여기 유지 -->
<div id="payslipModal" class="modal-overlay" style="display: none;">
    <div class="modal-content">
        <span id="closeModal" class="modal-close" onclick="document.getElementById('payslipModal').style.display='none'">&times;</span>
        <div id="modal-body">

            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    const cancelBtn = document.querySelector(".cancel");

                    if (cancelBtn) {
                        cancelBtn.addEventListener("click", function () {
                            document.getElementById("payslipModal").style.display = "none";

                            window.location.href = "/branch/storemangement/specification/payslip/paySlip";
                        });
                    }
                });
            </script>
        </div>
    </div>
</div>

</body>
</html>
