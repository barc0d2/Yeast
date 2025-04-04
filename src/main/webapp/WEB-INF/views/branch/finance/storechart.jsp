<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sales Record Table</title>
    <link rel="stylesheet" href="/css/finance/storechart.css" />
</head>
<body>
    <div class="container">
    <div class="table-container">
        <table id="salesTable">
            <thead>
                <tr>
                    <th data-sort="no">No.</th>
                    <th data-sort="product">상품명</th>
                    <th data-sort="type">종류</th>
                    <th data-sort="sales-quantity">판매개수</th>
                    <th data-sort="remaining-quantity">남은개수</th>
                    <th data-sort="sales">매출(원)</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="bread" items="${list}">
                <tr>
                    <td>${bread.breadNo}</td>
                    <td>${bread.breadName}</td>
                    <td>${bread.categoryName}</td>
                    <td class="saleQuantity"></td>
                    <td class="remain" data-remain="${bread.invenCount}"></td>
                    <td class="money" data-price="${bread.price}"></td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <td>총합</td>
                    <td></td>
                    <td></td>
                    <td id="totalSaleQuantity">0</td>
                    <td id="totalRemain">0</td>
                    <td id="totalMoney">0</td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let totalSaleQuantity = 0;
            let totalRemain = 0;
            let totalMoney = 0;

            document.querySelectorAll("#salesTable tbody tr").forEach(row => {
                let remainElement = row.querySelector(".remain");
                let moneyElement = row.querySelector(".money")
                let price = parseInt(moneyElement.dataset.price || "0");
                let remain = parseInt(remainElement.dataset.remain || "0");

                let saleQuantity = Math.floor((Math.random() * (remain - (remain*0.8)))+remain*0.8)* + 1;
                let newRemain = remain - saleQuantity;
                let rowTotalMoney = saleQuantity * price;

                row.querySelector(".saleQuantity").textContent = saleQuantity + '개';
                remainElement.textContent = newRemain + '개';
                moneyElement.textContent = rowTotalMoney.toLocaleString() + '원';

                totalSaleQuantity += saleQuantity;
                totalRemain += newRemain;
                totalMoney += rowTotalMoney;
            });
            document.getElementById("totalSaleQuantity").textContent = totalSaleQuantity + '개';
            document.getElementById("totalRemain").textContent = totalRemain + '개';
            document.getElementById("totalMoney").textContent = totalMoney.toLocaleString() + '원';
        });

        document.addEventListener('DOMContentLoaded', () => {
            const table = document.getElementById('salesTable');
            const headers = table.querySelectorAll('th');
            const tbody = table.querySelector('tbody');

            // Sorting function
            function sortTable(columnIndex, type, direction) {
                const rows = Array.from(tbody.querySelectorAll('tr'));
                
                rows.sort((a, b) => {
                    const cellA = a.querySelectorAll('td')[columnIndex].textContent.trim();
                    const cellB = b.querySelectorAll('td')[columnIndex].textContent.trim();
                    
                    // Remove non-numeric characters for numeric sorting
                    const cleanValue = (val) => val.replace(/[^0-9.-]/g, '');
                    
                    // Determine sorting method based on type
                    switch(type) {
                        case 'no':
                        case 'sales-quantity':
                        case 'remaining-quantity':
                        case 'sales':
                            const numA = parseFloat(cleanValue(cellA));
                            const numB = parseFloat(cleanValue(cellB));
                            return direction === 'asc' ? numA - numB : numB - numA;
                        
                        case 'product':
                        case 'type':
                        default:
                            return direction === 'asc' 
                                ? cellA.localeCompare(cellB) 
                                : cellB.localeCompare(cellA);
                    }
                });

                rows.forEach(row => tbody.appendChild(row));

                headers.forEach(header => {
                    header.classList.remove('sort-asc', 'sort-desc');
                });
                headers[columnIndex].classList.add(direction === 'asc' ? 'sort-asc' : 'sort-desc');
            }

            headers.forEach((header, index) => {
                let sortDirection = 'asc';
                header.addEventListener('click', () => {
                    const sortType = header.getAttribute('data-sort');
                    sortTable(index, sortType, sortDirection);
                    sortDirection = sortDirection === 'asc' ? 'desc' : 'asc';
                });
            });

            document.getElementById('periodSelect').addEventListener('change', function() {
                console.log('기간 필터:', this.value)
            });

            document.getElementById('branchSelect').addEventListener('change', function() {
                console.log('지점 필터:', this.value);
                const selectedBranch = this.value;
                const rows = tbody.querySelectorAll('tr');
                
                rows.forEach(row => {
                    const branchCell = row.querySelectorAll('td')[2];
                    if (selectedBranch === '전체 지점' || branchCell.textContent === selectedBranch) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>