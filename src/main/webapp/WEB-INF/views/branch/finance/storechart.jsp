<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <th data-sort="no">No.</th>
                    <th data-sort="product">상품명</th>
                    <th data-sort="type">종류</th>
                    <th data-sort="sales-quantity">판매개수</th>
                    <th data-sort="remaining-quantity">남은개수</th>
                    <th data-sort="sales">매출(원)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>00001</td>
                    <td>버터 크로와상</td>
                    <td>크로와상</td>
                    <td>150개</td>
                    <td>50개</td>
                    <td>750,000</td>
                </tr>
                <tr>
                    <td>00002</td>
                    <td>초코 크로와상</td>
                    <td>크로와상</td>
                    <td>120개</td>
                    <td>40개</td>
                    <td>600,000</td>
                </tr>
                <tr>
                    <td>00003</td>
                    <td>플레인 베이글</td>
                    <td>베이글</td>
                    <td>200개</td>
                    <td>75개</td>
                    <td>1,000,000</td>
                </tr>
                <tr>
                    <td>00004</td>
                    <td>치즈 베이글</td>
                    <td>베이글</td>
                    <td>180개</td>
                    <td>60개</td>
                    <td>900,000</td>
                </tr>
                <tr>
                    <td>00005</td>
                    <td>통밀 소금빵</td>
                    <td>소금빵</td>
                    <td>500개</td>
                    <td>200개</td>
                    <td>500,000</td>
                </tr>
                <tr>
                    <td>00006</td>
                    <td>올리브 소금빵</td>
                    <td>소금빵</td>
                    <td>250개</td>
                    <td>100개</td>
                    <td>1,250,000</td>
                </tr>
                <tr>
                    <td>00007</td>
                    <td>클래식 단팥빵</td>
                    <td>단팥빵</td>
                    <td>120개</td>
                    <td>30개</td>
                    <td>600,000</td>
                </tr>
                <tr>
                    <td>00008</td>
                    <td>대만식 단팥빵</td>
                    <td>단팥빵</td>
                    <td>400개</td>
                    <td>150개</td>
                    <td>400,000</td>
                </tr>
                <tr>
                    <td>00009</td>
                    <td>통밀 식빵</td>
                    <td>식빵</td>
                    <td>100개</td>
                    <td>25개</td>
                    <td>750,000</td>
                </tr>
                <tr>
                    <td>00010</td>
                    <td>우유 식빵</td>
                    <td>식빵</td>
                    <td>80개</td>
                    <td>20개</td>
                    <td>240,000</td>
                </tr>
                <tr>
                    <td>00011</td>
                    <td>바닐라 크로와상</td>
                    <td>크로와상</td>
                    <td>220개</td>
                    <td>80개</td>
                    <td>660,000</td>
                </tr>
                <tr>
                    <td>00012</td>
                    <td>블루베리 베이글</td>
                    <td>베이글</td>
                    <td>90개</td>
                    <td>30개</td>
                    <td>450,000</td>
                </tr>
                <tr>
                    <td>00013</td>
                    <td>마늘 소금빵</td>
                    <td>소금빵</td>
                    <td>350개</td>
                    <td>125개</td>
                    <td>525,000</td>
                </tr>
                <tr>
                    <td>00014</td>
                    <td>고구마 식빵</td>
                    <td>식빵</td>
                    <td>180개</td>
                    <td>60개</td>
                    <td>900,000</td>
                </tr>
                <tr>
                    <td>00015</td>
                    <td>단옥수수 단팥빵</td>
                    <td>단팥빵</td>
                    <td>200개</td>
                    <td>75개</td>
                    <td>400,000</td>
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