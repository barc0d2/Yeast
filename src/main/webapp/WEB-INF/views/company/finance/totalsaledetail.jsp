<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sales Record Table</title>
    <link rel="stylesheet" href="/css/finance/totalsaledetail.css" />
</head>
<body>
    <div class="container">
        <div class="filter-container">
            <div>
                <select id="periodSelect">
                    <option value="week" <c:if test="${param.period == 'week'}">selected</c:if>>최근 7일</option>
                    <option value="month" <c:if test="${param.period == 'month'}">selected</c:if>>최근 한달</option>
                    <option value="year" <c:if test="${param.period == 'year'}">selected</c:if>>최근 1년</option>
                </select>
                <select id="branchSelect">
                    <option value="">전체 지점</option>
                    <c:forEach var="business" items="${businessList}">
                        <option value="${business.businessNo}"
                            ${param.businessNo == business.businessNo ? 'selected' : ''}>
                                ${business.businessName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="table-container">
            <table id="salesTable">
                <thead>
                    <tr>
                        <th data-sort="no">NO.</th>
                        <th data-sort="date">일자</th>
                        <th data-sort="quantity">판매 수량</th>
                        <th data-sort="store">지점 매출</th>
                        <th data-sort="wholesale">도매 매출</th>
                        <th data-sort="total">전체 매출</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="sell" items="${sellList}">
                    <tr>
                        <td>${sell.sellNo}</td>
                        <td>${sell.enrollDate}</td>
                        <td class="quantity" data-quantity="${sell.quantityList}"></td>
                        <td><fmt:formatNumber value="${sell.sellMoney}" pattern="#,###" /></td>
                        <td>1,800,000</td>
                        <td>3,000,000</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="pagination">
            <ul>
                <c:choose>
                    <c:when test="${ pi.currentPage eq 1 }">
                    </c:when>
                    <c:otherwise>
                        <li class="pre-page">
                            <a class="page-link" href="/company/finance/wholesaleDetail?cpage=${pi.currentPage - 1}&businessNo=${param.businessNo}&period=${param.period}">
                                <svg width="29" height="26" style="transform: translateX(-8px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M19.9226 22.4738C20.6925 21.7753 20.6925 20.6469 19.9226 19.9484L12.2627 12.9989L19.9226 6.04936C20.6925 5.35083 20.6925 4.22243 19.9226 3.5239C19.1526 2.82537 17.9089 2.82537 17.139 3.5239L8.07745 11.7451C7.30752 12.4436 7.30752 13.572 8.07745 14.2706L17.139 22.4918C17.8891 23.1724 19.1526 23.1724 19.9226 22.4738Z" fill="black"/>
                        </svg></a></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <c:choose>
                        <c:when test="${p == pi.currentPage}">
                            <li class="cpage">
                                <div class="selectPage">${p}</div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="page">
                            <div class="unSelectPage">
                                <a class="page-link" href="/company/finance/wholesaleDetail?cpage=${p}&businessNo=${param.businessNo}&period=${param.period}">${p}</a>
                            </div>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                    </c:when>
                    <c:otherwise>
                        <li class="next-page">
                            <a class="page-link" href="/company/finance/wholesaleDetail?cpage=${pi.currentPage + 1}&businessNo=${param.businessNo}&period=${param.period}">
                                <svg width="29" height="26" style="transform: translateX(-6px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M8.07745 3.52616C7.30752 4.22469 7.30752 5.35309 8.07745 6.05163L15.7373 13.0011L8.07745 19.9506C7.30752 20.6492 7.30752 21.7776 8.07745 22.4761C8.84738 23.1746 10.0911 23.1746 10.861 22.4761L19.9226 14.2549C20.6925 13.5564 20.6925 12.428 19.9226 11.7294L10.861 3.50825C10.1109 2.82763 8.84738 2.82763 8.07745 3.52616Z" fill="black"/>
                        </svg></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
<%--    <td>${bread.breadNo}</td>
    <td class="category">${bread.categoryName}</td>
    <td class="breadName">${bread.breadName}</td>
    <td class="price">${bread.price}</td>
    <td><input name="select" onclick="select()" style="transform: scale(1.5)" type="radio"></td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    </div>
    <div id="modalFooter">
        <div id="breadCount">수량: <input id="quantityInput" type="number" min="0" max="200" step="1" value="0"/></div>
        <p id="priceCalc">갯수 X <br> 가격 : ? X ?</p>
        <p id="totalPrice">합산: ?</p>
        <button id="push">가져오기</button>--%>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            function updateURL() {
                const businessNo = document.getElementById('branchSelect').value;
                const period = document.getElementById('periodSelect').value;

                let url = "/company/finance/totalSaleDetail?businessNo="+businessNo+"&period="+period;

                window.location.href = url;
            }

            document.getElementById('branchSelect').addEventListener('change', updateURL);
            document.getElementById('periodSelect').addEventListener('change', updateURL);

            document.querySelectorAll(".quantity").forEach(td => {
                const quantityData = td.dataset.quantity;
                if (quantityData) {
                    const sum = quantityData.split(",")
                        .map(Number)
                        .reduce((acc, num) => acc + num, 0);
                    td.textContent = sum;
                }
            });

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
                        case 'quantity':
                        case 'store':
                        case 'wholesale':
                        case 'total':
                            const numA = parseFloat(cleanValue(cellA));
                            const numB = parseFloat(cleanValue(cellB));
                            return direction === 'asc' ? numA - numB : numB - numA;

                        case 'date':
                            // Convert date to comparable format
                            const parseDate = (dateStr) => {
                                const [year, month, day] = dateStr.split('/').map(Number);
                                return new Date(2025, month - 1, day);
                            };
                            const dateA = parseDate(cellA);
                            const dateB = parseDate(cellB);
                            return direction === 'asc' ? dateA - dateB : dateB - dateA;

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
    <jsp:include page="../sideBar/brownSideBar.jsp"/>
    <jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>

