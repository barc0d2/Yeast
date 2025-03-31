<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Sales Record Table</title>
    <link rel="stylesheet" href="css/finance/storedetail.css" />
</head>
<body>
    <div class="container">
    <div class="filter-container">
        <div>
            <select id="periodSelect">
                <option>최근 30일</option>
                <option>최근 7일</option>
                <option>최근 1년</option>
            </select>
            <select id="branchSelect">
                <option>전체 지점</option>
                <option>잠실점</option>
                <option>강남점</option>
                <option>명동점</option>
            </select>
        </div>
    </div>
    <div class="table-container">
        <table id="salesTable">
            <thead>
                <tr>
                    <th data-sort="no">NO.</th>
                    <th data-sort="date">일자</th>
                    <th data-sort="branch">지점</th>
                    <th data-sort="quantity">판매수량</th>
                    <th data-sort="sales">매출</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>00001</td>
                    <td>25/03/19</td>
                    <td>잠실점</td>
                    <td>150개</td>
                    <td>2,400,000</td>
                </tr>
                <tr>
                    <td>00002</td>
                    <td>25/03/18</td>
                    <td>강남점</td>
                    <td>120개</td>
                    <td>1,920,000</td>
                </tr>
                <tr>
                    <td>00003</td>
                    <td>25/03/17</td>
                    <td>명동점</td>
                    <td>180개</td>
                    <td>2,880,000</td>
                </tr>
                <tr>
                    <td>00004</td>
                    <td>25/03/16</td>
                    <td>잠실점</td>
                    <td>200개</td>
                    <td>3,200,000</td>
                </tr>
                <tr>
                    <td>00005</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
                <tr>
                    <td>00006</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
                <tr>
                    <td>00007</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
                <tr>
                    <td>00008</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
                <tr>
                    <td>00009</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
                <tr>
                    <td>00010</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
                <tr>
                    <td>00011</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr><tr>
                    <td>00012</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr><tr>
                    <td>00013</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr><tr>
                    <td>00014</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr><tr>
                    <td>00015</td>
                    <td>25/03/15</td>
                    <td>강남점</td>
                    <td>90개</td>
                    <td>1,440,000</td>
                </tr>
            </tbody>
        </table>
    
</div>
</div>
    <script>
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
                        case 'quantity':
                        case 'sales':
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
                        
                        case 'branch':
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