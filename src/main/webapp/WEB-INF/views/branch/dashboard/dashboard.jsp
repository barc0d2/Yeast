<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <div id="inventory" class="inventory-container">
                <div class="inventory-header">
                    <h3>종류</h3>
                    <select name="category" class="category">단과자
                        <option value="단과자류">단과자</option>
                        <option value="식빵">식빵</option>
                        <option value="cookie">간식빵</option>
                        <option value="cookie">건강빵</option>
                        <option value="cookie">도넛</option>
                        <option value="cookie">페스츄리/파이</option>
                    </select>
                </div>
                <table class="inventory-list">
                    <thead>
                        <tr>
                            <th>상품번호</th>
                            <th>상품명</th>
                            <th>수량</th>
                            <th>재고상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>34</td>
                            <td class="stock-sufficient">재고여유</td>
                        </tr>
                        <tr>
                            <td>a_2</td>
                            <td>발효버터 소금빵</td>
                            <td>10</td>
                            <td class="stock-low">재고부족</td>
                        </tr>
                        <tr>
                            <td>a_2</td>
                            <td>발효버터 소금빵</td>
                            <td>10</td>
                            <td class="stock-low">재고부족</td>
                        </tr>
                        <tr>
                            <td>a_2</td>
                            <td>발효버터 소금빵</td>
                            <td>10</td>
                            <td class="stock-low">재고부족</td>
                        </tr>
                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>34</td>
                            <td class="stock-sufficient">재고여유</td>
                        </tr>
                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>34</td>
                            <td class="stock-sufficient">재고여유</td>
                        </tr>
                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>34</td>
                            <td class="stock-sufficient">재고여유</td>
                        </tr>

                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>0</td>
                            <td class="stock-off">재고소진</td>
                        </tr>
                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>34</td>
                            <td class="stock-sufficient">재고여유</td>
                        </tr>
                        <tr>
                            <td>a_1</td>
                            <td>추억의소세지빵</td>
                            <td>34</td>
                            <td class="stock-sufficient">재고여유</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <section class="production">
            <h2 class="text-wrapper">금일 매출 현황</h2>
            <div class="div-4">
                <div class="chart-content">
                    <canvas id="chartjs-doughnut"></canvas>
                </div>
                <div class="sales-details">
                    <table class="sales-details-table">
                        <thead>
                            <tr>
                                <th>종류</th>
                                <th>거래건수</th>
                                <th>매출</th>
                                <th>재고소진율</th>
                                <th>순수익</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>단과자</td>
                                <td>260</td>
                                <td>338,000</td>
                                <td>30%</td>
                                <td>202,800</td>
                            </tr>
                            <tr>
                                <td>식빵</td>
                                <td>260</td>
                                <td>338,000</td>
                                <td>30%</td>
                                <td>202,800</td>
                            </tr>
                            <tr>
                                <td>간식빵</td>
                                <td>260</td>
                                <td>338,000</td>
                                <td>30%</td>
                                <td>202,800</td>
                            </tr>
                            <tr>
                                <td>건강빵</td>
                                <td>260</td>
                                <td>338,000</td>
                                <td>30%</td>
                                <td>202,800</td>
                            </tr>
                            <tr>
                                <td>도넛</td>
                                <td>260</td>
                                <td>338,000</td>
                                <td>30%</td>
                                <td>202,800</td>
                            </tr>
                            <tr>
                                <td>페스츄리/파이</td>
                                <td>260</td>
                                <td>338,000</td>
                                <td>30%</td>
                                <td>202,800</td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="total-sales">
                        금일 총 매출 금액 : <strong>3,340,000</strong>원 <br>
                        금일 총 순수익 : <strong>2,004,000</strong>원
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