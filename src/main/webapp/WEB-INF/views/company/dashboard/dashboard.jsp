<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
    <script
            src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.1.0/chartjs-plugin-datalabels.min.js"></script>
    <link rel="stylesheet" href="/css/company/dashboard/globals.css" />
    <link rel="stylesheet" href="/css/company/dashboard/styleguide.css" />
    <link rel="stylesheet" href="/css/company/dashboard/style.css" />
</head>

<body>
<main class="frame">
    <section class="sales">
        <div class="body">
            <div class="inbody">
                <article class="branch">
                    <header class="title">
                        <h2 class="text-wrapper-12">전체 판매내역</h2>
                    </header>
                    <div class="body-2">
                        <div class="header">
                            <div class="div-wrapper">
                                <h4 class="text-wrapper-2">No.</h4>
                            </div>
                            <div class="div-wrapper">
                                <h4 class="text-wrapper-2">종류</h4>
                            </div>
                            <div class="div-wrapper">
                                <h4 class="text-wrapper-2">상품명</h4>
                            </div>
                            <div class="div-wrapper">
                                <h4 class="text-wrapper-2">판매개수</h4>
                            </div>
                            <div class="div-wrapper">
                                <h4 class="text-wrapper-2">매출</h4>
                            </div>
                        </div>
                        <div class="line-wrapper">
                            <div class="div-2">
                                <div class="div-wrapper">
                                    <p class="text-wrapper-3">단과자</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">200</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">338,000</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">30%</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">202,800</p>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="div-wrapper">
                                    <p class="text-wrapper-3">식빵</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">200</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">338,000</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">30%</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">202,800</p>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="div-wrapper">
                                    <p class="text-wrapper-3">간식빵</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">200</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">338,000</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">30%</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">202,800</p>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="div-wrapper">
                                    <p class="text-wrapper-3">건강빵</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">200</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">338,000</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">30%</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">202,800</p>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="div-wrapper">
                                    <p class="text-wrapper-3">도넛</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">200</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">338,000</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">30%</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">202,800</p>
                                </div>
                            </div>
                            <div class="div-2">
                                <div class="div-wrapper">
                                    <p class="text-wrapper-3">페스츄리</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">200</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">338,000</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">30%</p>
                                </div>
                                <div class="div-wrapper">
                                    <p class="text-wrapper-2">202,800</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <footer class="total">
                        <p class="element">
                            <span class="span">금일 총 매출 금액 : </span>
                            <span class="text-wrapper-4">3,340,000</span>
                            <span class="span">원</span>
                        </p>
                    </footer>
                </article>
            </div>
        </div>
    </section>
    <section class="production">
        <h2 class="text-wrapper">생산현황</h2>
        <div class="div-4">
            <div class="chart-content">
                <canvas id="chartjs-doughnut"></canvas>
            </div>
            <div class="div-6">
                <p class="p">
                    <span class="span">총 생산금액 : </span>
                    <span class="text-wrapper-4"><fmt:formatNumber value="${totalAmount}" pattern="#,###,###"/></span>
                    <span class="span">원</span>
                </p>
                <div class="div-7">
                    <h3 class="text-wrapper-5">생산완료 파트</h3>
                    <ul class="div-8">
                        <c:forEach var="item" items="${productionData}" varStatus="status">
                        <li class="div-9">
                                <time class="element-2">
                                    <c:choose>
                                        <c:when test="${item.createTime != null}">
                                            <fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm"/>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm"/>
                                        </c:otherwise>
                                    </c:choose>
                                </time>
                                <p class="text-wrapper-6">${item.categoryName}</p>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <section class="employee">
        <h2 class="text-wrapper-12">전체직원 목록</h2>
        <div class="list">
            <div class="div-2">
                <div class="div-wrapper-2">
                    <h3 class="text-wrapper-13">이름</h3>
                </div>
                <div class="div-wrapper-2">
                    <h3 class="text-wrapper-13">소속</h3>
                </div>
                <div class="div-wrapper-2">
                    <h3 class="text-wrapper-13">직무</h3>
                </div>
                <div class="div-wrapper-2">
                    <h3 class="text-wrapper-13">연락처</h3>
                </div>
            </div>
            <ul class="div-8">
                <c:choose>
                    <c:when test="${empty memberList}">
                        <!-- 데이터가 없을 경우 메시지 표시 -->
                <li class="div-2">
                            <div class="div-wrapper-2 text-center" style="width: 100%;">
                                <p class="text-wrapper-13">등록된 직원 정보가 없습니다.</p>
                    </div>
                </li>
                    </c:when>
                    <c:otherwise>
                        <!-- memberList에서 데이터 반복 표시 -->
                        <c:forEach var="member" items="${memberList}">
                <li class="div-2">
                    <div class="div-wrapper-2">
                                    <p class="text-wrapper-13">${member.userName}</p>
                    </div>
                    <div class="div-wrapper-2">
                                    <p class="text-wrapper-13">${member.businessName}</p>
                    </div>
                    <div class="div-wrapper-2">
                                    <p class="text-wrapper-13">${member.positionName}</p>
                    </div>
                    <div class="div-wrapper-2">
                                    <p class="text-wrapper-13">${member.phone}</p>
                    </div>
                </li>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </section>
</main>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const colorPalette = [
            '#007bff',   // primary (blue)
            '#28a745',   // success (green)
            '#ffc107',   // warning (yellow)
            '#dee2e6',    // gray
            '#cecece',
            '#575757'
        ];

        // 카테고리 이름과 수량 데이터 가져오기
        const categoryLabels = [
            <c:forEach var="item" items="${productionData}" varStatus="status">
                "${item.categoryName}"<c:if test="${!status.last}">, </c:if>
            </c:forEach>
        ];
        
        const inventoryData = [
            <c:forEach var="item" items="${productionData}" varStatus="status">
                ${item.invenCount}<c:if test="${!status.last}">, </c:if>
            </c:forEach>
        ];
        
        // 콘솔에 데이터 출력하여 확인
        console.log("카테고리 라벨:", categoryLabels);
        console.log("재고 데이터:", inventoryData);

        new Chart(document.getElementById("chartjs-doughnut"), {
            type: "pie",
            data: {
                labels: categoryLabels.length > 0 ? categoryLabels : ["데이터 없음"],
                datasets: [{
                    data: inventoryData.length > 0 ? inventoryData : [100],
                    backgroundColor: colorPalette,
                    borderColor: "transparent"
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom'
                    },
                    datalabels: {
                        color: 'white',
                        font: {
                            weight: 'bold',
                            size: 16
                        },
                        formatter: function (value, context) {
                            return value > 0 ? value : '';
                        },
                        anchor: 'center',
                        align: 'center'
                    }
                }
            },
            plugins: [ChartDataLabels]
        });
    });
</script>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>

</html>