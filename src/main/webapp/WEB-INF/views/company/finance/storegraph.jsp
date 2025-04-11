<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매장 매출 대시보드</title>
    <link rel="stylesheet" href="/css/finance/storegraph.css" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>
    <div id="outFrame">
        <div class="container">
        <c:forEach var="sell" items="${list}">
        <div class="dashboard">
            <div class="header">${sell.businessName}</div>
            <div class="quantityList" style="display: none">${sell.quantityList}</div>
            <div class="breadList" style="display: none">${sell.breadList}</div>
            <div class="chart-container">
                <canvas class="chart-canvas"></canvas>
            </div>
            <table class="sales-table">
                <tr>
                    <td class="rank">Top 5</td>
                </tr>
                <tr>
                    <td class="rank"></td>
                    <td class="product"></td>
                    <td class="quantity"></td>
                </tr>
            </table>
            <div class="summary">
                <div class="summary-item">
                    <div class="summary-label">판매개수</div>
                    <div class="summary-value totalSales"></div>
                </div>
                <div class="summary-item">
                    <div class="summary-label">총매출</div>
                    <div class="summary-value">
                        <fmt:formatNumber value="${sell.sellMoney}" pattern="#,###" />
                    </div>
                </div>
            </div>
            <button class="detail-button" onclick="location.href='/company/finance/detail?businessNo=${sell.businessNo}'">상세보기</button>
        </div>
        </c:forEach>
        </div>
        <div class="pagination">
            <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                </c:when>
                <c:otherwise>
                <a class="page-link" href="/company/finance/chart?cpage=${pi.currentPage - 1}">
                    <svg width="75" height="87" viewBox="0 0 75 87" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M26.044 50.6C25.404 49.2347 24.7853 48.04 24.188 47.016C23.548 45.992 22.9293 45.1387 22.332 44.456H59.644V41.768H22.332C22.9293 41.0427 23.548 40.168 24.188 39.144C24.7853 38.12 25.404 36.9467 26.044 35.624H23.804C21.116 38.7387 18.3 41.0427 15.356 42.536V43.688C18.3 45.1387 21.116 47.4427 23.804 50.6H26.044Z" fill="#575757"/>
                    </svg>
                </a>
                </c:otherwise>
            </c:choose>
            <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                </c:when>
                <c:otherwise>
                <a class="page-link" href="/company/finance/chart?cpage=${pi.currentPage + 1}">
                    <svg width="75" height="87" viewBox="0 0 75 87" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M48.956 50.6C49.596 49.2347 50.2147 48.04 50.812 47.016C51.452 45.992 52.0707 45.1387 52.668 44.456H15.356V41.768H52.668C52.0707 41.0427 51.452 40.168 50.812 39.144C50.2147 38.12 49.596 36.9467 48.956 35.624H51.196C53.884 38.7387 56.7 41.0427 59.644 42.536V43.688C56.7 45.1387 53.884 47.4427 51.196 50.6H48.956Z" fill="#575757"/>
                    </svg>
                </a>
                </c:otherwise>
            </c:choose>

        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            window.theme = {
                primary: '#007bff',
                success: '#28a745',
                warning: '#ffc107'
            };

            document.querySelectorAll(".dashboard").forEach(row =>{
                let quantityList = row.querySelector(".quantityList").textContent.trim();
                let breadList = row.querySelector(".breadList").textContent.trim();

                let quantityArray = quantityList.split(",").map(Number);
                let breadArray = breadList.split(",");

                let breadSales = breadArray.map((bread, index) => ({
                    breadName: bread,
                    quantity: quantityArray[index]
                }));

                breadSales.sort((a, b) => b.quantity - a.quantity);
                let top5BreadSales = breadSales.slice(0, 5);

                let table = row.querySelector(".sales-table");
                let canvas = row.querySelector(".chart-canvas");
                let totalElement = row.querySelector(".totalSales")
                renderTop5Sales(table, top5BreadSales, canvas, totalElement);
            })

            function renderTop5Sales(table, salesData, canvas, totalElement) {

                let labels = [];
                let data = [];
                let totalSales = 0;

                if (!table) return;

                // 기존 데이터 제거 (Top 5 행 제외)
                table.querySelectorAll("tr:not(:first-child)").forEach(row => row.remove());
                // 상위 5개 데이터 삽입
                salesData.forEach((item, index) => {
                    let row = document.createElement("tr");
                    row.innerHTML = '<td class="rank">' + (index + 1) + '</td>'
                                + '<td class="product">' + (item.breadName) +'</td>'
                                + '<td class="quantity">' + (item.quantity) + '</td>'
                    ;
                    table.appendChild(row);

                    labels.push(item.breadName);
                    data.push(item.quantity);
                    totalSales += item.quantity;
                });
                totalElement.textContent = totalSales + " 개";
                renderPieChart(canvas, labels, data);
            }


            function renderPieChart(canvas, labels, data) {
                new Chart(canvas, {
                    type: "pie",
                    data: {
                        labels: labels,
                        datasets: [{
                            data: data,
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
            }
        });
    </script>
    <jsp:include page="../sideBar/brownSideBar.jsp"/>
    <jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>