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
    <div class="container">
        <!-- 잠실 지점 -->
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
            <button class="detail-button" onclick="">상세보기</button>
        </div>
        </c:forEach>
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