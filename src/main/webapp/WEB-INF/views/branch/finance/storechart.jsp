<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sales Record Table</title>
    <link rel="stylesheet" href="/css/finance/storechart.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <div id="businessNo" style="display: none">${bread.businessNo}</div>
                    <tr>
                        <td>${bread.breadNo}</td>
                        <td class="breadName">${bread.breadName}</td>
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
        <button type="submit" class="update-btn"><div class="text-wrapper-7">저장</div></button>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let totalSaleQuantity = 0;
            let totalRemain = 0;
            let totalMoney = 0;
            let saleQuantityList = [];
            let breadList = [];
            let businessNo = 0;
            let remainList = [];

            document.querySelectorAll("#salesTable tbody tr").forEach(row => {
                let remainElement = row.querySelector(".remain");
                let moneyElement = row.querySelector(".money")
                let breadNameElement = row.querySelector(".breadName");
                let breadName = breadNameElement.textContent;
                let price = parseInt(moneyElement.dataset.price || "0");
                let remain = parseInt(remainElement.dataset.remain || "0");
                let businessNoElement = document.querySelector("#businessNo")||"0"
                businessNo = parseInt(businessNoElement ? businessNoElement.textContent.trim() : "0");
                remainList.push(remain);

                let saleQuantity = Math.floor((Math.random() * (remain - (remain*0.8)))+remain*0.8)* + 1;
                let newRemain = remain - saleQuantity;
                let rowTotalMoney = saleQuantity * price;

                row.querySelector(".saleQuantity").textContent = saleQuantity + '개';
                remainElement.textContent = newRemain + '개';
                moneyElement.textContent = rowTotalMoney.toLocaleString() + '원';

                totalSaleQuantity += saleQuantity;
                totalRemain += newRemain;
                totalMoney += rowTotalMoney;

                saleQuantityList.push(saleQuantity);
                breadList.push(breadName);


                console.log("businessNo : "+businessNo);
            });
            document.getElementById("totalSaleQuantity").textContent = totalSaleQuantity + '개';
            document.getElementById("totalRemain").textContent = totalRemain + '개';
            document.getElementById("totalMoney").textContent = totalMoney.toLocaleString() + '원';


            document.querySelector(".update-btn").addEventListener("click", function (event) {
                event.preventDefault();
                sendData(breadList, saleQuantityList, totalMoney, businessNo, remainList);
            });
        });

        function sendData(breadList, saleQuantityList, totalMoney, businessNo, remainList) {
            let data = {
                breadList: breadList.join(","),
                quantityList: saleQuantityList.join(","),
                totalList: remainList.join(","),
                sellMoney: totalMoney,
                businessNo: businessNo
            }

            $.ajax({
                url: "/api/store/insert",
                type:"POST",
                data: data,
                success: function(res){
                    alert("저장 성공!");
                },
                error: function(err){
                    alert("저장 실패!");
                }
            })
        }

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
        });
    </script>
    <jsp:include page="../sideBar/whiteSideBar.jsp"/>
    <jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>
</html>