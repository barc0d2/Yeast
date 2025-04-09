<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.min.js"></script>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.1.0/chartjs-plugin-datalabels.min.js"></script>
    <link rel="stylesheet" href="/css/branch/dashboard/globals.css" />
    <link rel="stylesheet" href="/css/branch/dashboard/styleguide.css" />
    <link rel="stylesheet" href="/css/branch/dashboard/style.css" />
</head>

<body>

  <div id="wrapper">
    <main class="frame">
        <section class="sales">

        </section>
        <section class="production">
            <h2 class="text-wrapper">금일 매출 현황</h2>
            <div class="div-4">
                <div class="chart-content">
                    <canvas id="chartjs-doughnut"></canvas>
                </div>
                <div class="sales-details">
                        <div class="div-2">
                            <div class="div-wrapper-2">
                                <h3 class="text-wrapper-13">종류</h3>
                            </div>
                            <div class="div-wrapper-2">
                                <h3 class="text-wrapper-13">판매개수</h3>
                            </div>
                            <div class="div-wrapper-2">
                                <h3 class="text-wrapper-13">매출</h3>
                            </div>
                        </div>
                    <c:choose>
                        <c:when test="${empty todaySales}">
                        <div class="div-2">
                            <div class="div-wrapper" style="width: 100%; text-align: center;">
                                <p class="text-wrapper-3">금일 판매 데이터가 없습니다.</p>
                            </div>
                        </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="sale" items="${todaySales}" varStatus="status">
                                <c:set var="categoryArray" value="${fn:split(sale.categoryList, ',')}"/>
                                <c:set var="quantityArray" value="${fn:split(sale.quantityList, ',')}" />

                                <c:forEach var="category" items="${categoryArray}" varStatus="itemStatus">
                                    <div class="div-2">
                                        <div class="div-wrapper">
                                            <p class="text-wrapper-3">${category}</p>
                                        </div>
                                        <div class="div-wrapper">
                                            <p class="text-wrapper-2">${quantityArray[itemStatus.index]}</p>
                                        </div>
                                        <div class="div-wrapper">
                                            <p class="text-wrapper-2">
                                                <fmt:formatNumber value="${quantityArray[itemStatus.index] * (breadPriceMap[breadArray[itemStatus.index]] != null ? breadPriceMap[breadArray[itemStatus.index]] : 2000)}" pattern="#,###" />
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
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

  </div>
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

            new Chart(document.getElementById("chartjs-doughnut"), {
                type: "pie",
                data: {
                    labels: ["단과자", "식빵", "간식빵", "건강빵", "도넛", "페스츄리"],
                    datasets: [{
                        data: [260, 125, 54, 146, 100, 70],
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
  <jsp:include page="../sideBar/whiteSideBar.jsp"/>
  <jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>

</html>