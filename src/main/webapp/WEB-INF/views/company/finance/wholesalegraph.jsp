<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매장 매출 대시보드</title>
    <link rel="stylesheet" href="/css/finance/wholesalegraph.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- 잠실 지점 -->
    <div class="dashboard">
        <div class="header">잠실 지점</div>
        <div class="chart-container">
            <canvas id="chartjs-doughnut-1"></canvas>
        </div>
        <table class="sales-table">
            <tr>
                <td class="rank">Top 5</td>
            </tr>
            <tr>
                <td class="rank">1</td>
                <td class="product">초코소보로</td>
                <td class="quantity">30</td>
            </tr>
            <tr>
                <td class="rank">2</td>
                <td class="product">크로아상</td>
                <td class="quantity">20</td>
            </tr>
            <tr>
                <td class="rank">3</td>
                <td class="product">소금빵</td>
                <td class="quantity">15</td>
            </tr>
            <tr>
                <td class="rank">4</td>
                <td class="product">단팥빵</td>
                <td class="quantity">10</td>
            </tr>
            <tr>
                <td class="rank">5</td>
                <td class="product">베이글</td>
                <td class="quantity">5</td>
            </tr>
        </table>
        <div class="summary">
            <div class="summary-item">
                <div class="summary-label">판매개수</div>
                <div class="summary-value">80 개</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">총매출</div>
                <div class="summary-value">2,300,000 원</div>
            </div>
        </div>
        <button class="detail-button">상세보기</button>
    </div>

    <!-- 강남 지점 -->
    <div class="dashboard">
        <div class="header">잠실 지점</div>
        <div class="chart-container">
            <canvas id="chartjs-doughnut-2"></canvas>
        </div>
        <table class="sales-table">
            <tr>
                <td class="rank">Top 5</td>
            </tr>
            <tr>
                <td class="rank">1</td>
                <td class="product">초코소보로</td>
                <td class="quantity">30</td>
            </tr>
            <tr>
                <td class="rank">2</td>
                <td class="product">크로아상</td>
                <td class="quantity">20</td>
            </tr>
            <tr>
                <td class="rank">3</td>
                <td class="product">소금빵</td>
                <td class="quantity">15</td>
            </tr>
            <tr>
                <td class="rank">4</td>
                <td class="product">단팥빵</td>
                <td class="quantity">10</td>
            </tr>
            <tr>
                <td class="rank">5</td>
                <td class="product">베이글</td>
                <td class="quantity">5</td>
            </tr>
        </table>
        <div class="summary">
            <div class="summary-item">
                <div class="summary-label">판매개수</div>
                <div class="summary-value">80 개</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">총매출</div>
                <div class="summary-value">2,300,000 원</div>
            </div>
        </div>
        <button class="detail-button">상세보기</button>
    </div>

    <!-- 홍대 지점 -->
    <div class="dashboard">
        <div class="header">잠실 지점</div>
        <div class="chart-container">
            <canvas id="chartjs-doughnut-3"></canvas>
        </div>
        <table class="sales-table">
            <tr>
                <td class="rank">Top 5</td>
            </tr>
            <tr>
                <td class="rank">1</td>
                <td class="product">초코소보로</td>
                <td class="quantity">30</td>
            </tr>
            <tr>
                <td class="rank">2</td>
                <td class="product">크로아상</td>
                <td class="quantity">20</td>
            </tr>
            <tr>
                <td class="rank">3</td>
                <td class="product">소금빵</td>
                <td class="quantity">15</td>
            </tr>
            <tr>
                <td class="rank">4</td>
                <td class="product">단팥빵</td>
                <td class="quantity">10</td>
            </tr>
            <tr>
                <td class="rank">5</td>
                <td class="product">베이글</td>
                <td class="quantity">5</td>
            </tr>
        </table>
        <div class="summary">
            <div class="summary-item">
                <div class="summary-label">판매개수</div>
                <div class="summary-value">80 개</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">총매출</div>
                <div class="summary-value">2,300,000 원</div>
            </div>
        </div>
        <button class="detail-button">상세보기</button>
    </div>

    <!-- 서초 지점 -->
    <div class="dashboard">
        <div class="header">잠실 지점</div>
        <div class="chart-container">
            <canvas id="chartjs-doughnut-4"></canvas>
        </div>
        <table class="sales-table">
            <tr>
                <td class="rank">Top 5</td>
            </tr>
            <tr>
                <td class="rank">1</td>
                <td class="product">초코소보로</td>
                <td class="quantity">30</td>
            </tr>
            <tr>
                <td class="rank">2</td>
                <td class="product">크로아상</td>
                <td class="quantity">20</td>
            </tr>
            <tr>
                <td class="rank">3</td>
                <td class="product">소금빵</td>
                <td class="quantity">15</td>
            </tr>
            <tr>
                <td class="rank">4</td>
                <td class="product">단팥빵</td>
                <td class="quantity">10</td>
            </tr>
            <tr>
                <td class="rank">5</td>
                <td class="product">베이글</td>
                <td class="quantity">5</td>
            </tr>
        </table>
        <div class="summary">
            <div class="summary-item">
                <div class="summary-label">판매개수</div>
                <div class="summary-value">80 개</div>
            </div>
            <div class="summary-item">
                <div class="summary-label">총매출</div>
                <div class="summary-value">2,300,000 원</div>
            </div>
        </div>
        <button class="detail-button">상세보기</button>
        <jsp:include page="../sideBar/brownSideBar.jsp"/>
        <jsp:include page="../sideBar/brownTopBar.jsp"/>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            window.theme = {
                primary: '#007bff',
                success: '#28a745',
                warning: '#ffc107'
            };

            // 잠실 지점 차트
            new Chart(document.getElementById("chartjs-doughnut-1"), {
                type: "pie",
                data: {
                    labels: ["초코소보로", "크로아상", "소금빵", "단팥빵", "베이글", "그 외"],
                    datasets: [{
                        data: [30, 20, 15, 10, 5, 4],
                        backgroundColor: [
                            "#8A4DF2", 
                            window.theme.success, 
                            window.theme.warning, 
                            "#dee2e6", "#EA3A88", "#5286F8"
                        ],
                        borderColor: "transparent"
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                }
            });

            // 강남 지점 차트
            new Chart(document.getElementById("chartjs-doughnut-2"), {
                type: "pie",
                data: {
                    labels: ["초코소보로", "크로아상", "소금빵", "단팥빵", "베이글", "그 외"],
                    datasets: [{
                        data: [30, 20, 15, 10, 5, 4],
                        backgroundColor: [
                            "#8A4DF2", 
                            window.theme.success, 
                            window.theme.warning, 
                            "#dee2e6", "#EA3A88", "#5286F8"
                        ],
                        borderColor: "transparent"
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                }
            });

            // 홍대 지점 차트
            new Chart(document.getElementById("chartjs-doughnut-3"), {
                type: "pie",
                data: {
                    labels: ["초코소보로", "크로아상", "소금빵", "단팥빵", "베이글", "그 외"],
                    datasets: [{
                        data: [30, 20, 15, 10, 5, 4],
                        backgroundColor: [
                            "#8A4DF2", 
                            window.theme.success, 
                            window.theme.warning, 
                            "#dee2e6", "#EA3A88", "#5286F8"
                        ],
                        borderColor: "transparent"
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                }
            });

            // 서초 지점 차트
            new Chart(document.getElementById("chartjs-doughnut-4"), {
                type: "pie",
                data: {
                    labels: ["초코소보로", "크로아상", "소금빵", "단팥빵", "베이글", "그 외"],
                    datasets: [{
                        data: [30, 20, 15, 10, 5, 4],
                        backgroundColor: [
                            "#8A4DF2", 
                            window.theme.success, 
                            window.theme.warning, 
                            "#dee2e6", "#EA3A88", "#5286F8"
                        ],
                        borderColor: "transparent"
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                }
            });
        });
    </script>
</body>
</html>