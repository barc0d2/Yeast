<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="/css/branch/sideBar/whiteSideBar.css">

    </head>

    <body>
        <div id="sidebar">
            <div id="sidebar-background"></div>
            <a href="/branch/dashboard">
            <div id="logo">
                <div id="logo-main" alt="Main Logo"></div>
                <div id="logo-sub"></div>
            </div>
            </a>
            <div id="menu-container">
                <div class="menu-item">
                    <a href="/branch/dashboard">
                        <div class="menu-icon">
                            <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path d="M34.25 3H20.5" stroke="#888888" stroke-linecap="round"
                                    stroke-linejoin="round" />
                                <path d="M34.25 10.5H20.5" stroke="#888888" stroke-linecap="round"
                                    stroke-linejoin="round" />
                                <path d="M34.25 18H20.5" stroke="#888888" stroke-linecap="round"
                                    stroke-linejoin="round" />
                                <path d="M34.25 33H20.5" stroke="#888888" stroke-linecap="round"
                                    stroke-linejoin="round" />
                                <path d="M34.25 25.5H20.5" stroke="#888888" stroke-linecap="round"
                                    stroke-linejoin="round" />
                                <path
                                    d="M1.75 4.25V14.25C1.75 14.9404 2.30964 15.5 3 15.5H13C13.6904 15.5 14.25 14.9404 14.25 14.25V4.25C14.25 3.55965 13.6904 3 13 3H3C2.30964 3 1.75 3.55965 1.75 4.25Z"
                                    stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                                <path
                                    d="M1.75 21.75V31.75C1.75 32.4403 2.30964 33 3 33H13C13.6904 33 14.25 32.4403 14.25 31.75V21.75C14.25 21.0596 13.6904 20.5 13 20.5H3C2.30964 20.5 1.75 21.0596 1.75 21.75Z"
                                    stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                        </div>
                        <div class="menu-text">대시보드</div>
                    </a>
                </div>
                <div class="menu-item">
                    <div class="menu-icon"><svg width="35" height="31" viewBox="0 0 35 31" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M32.5098 1H2.50977C1.81941 1 1.25977 1.55965 1.25977 2.25V22.25C1.25977 22.9403 1.81941 23.5 2.50977 23.5H32.5098C33.2 23.5 33.7598 22.9403 33.7598 22.25V2.25C33.7598 1.55965 33.2 1 32.5098 1Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M15.0098 23.5L12.5098 29.75" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M20.0098 23.5L22.5098 29.75" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M10.0098 29.75H25.0098" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg>
                    </div>
                    <div class="menu-text">매장관리</div>
                    <div class="arrow"><svg width="14" height="24" viewBox="0 0 14 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M2.85972 21.4274L10.4664 13.8208C11.3647 12.9224 11.3647 11.4524 10.4664 10.5541L2.85972 2.94744"
                                stroke="#888888" stroke-width="4.8" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg></div>
                </div>
                <div class="submenu">
                    <a href="/branch/employee/list">
                        <div class="submenu-item">직원관리</div>
                    </a>
                    <a href="/branch/store/updateForm">
                        <div class="submenu-item">매장 정보수정</div>
                    </a>
                    <a href="/branch/specification/salaryList">
                        <div class="submenu-item">임금 명세서</div>
                    </a>
                    <a href="/branch/specification/monthlyFee">
                        <div class="submenu-item">월 수수료</div>
                    </a>
                </div>
                <div class="menu-item">
                    <div class="menu-icon"><svg width="32" height="34" viewBox="0 0 32 34" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M16.2598 33.5C25.0098 33.5 31.2598 30.4047 31.2598 23.5153C31.2598 16.0269 27.5098 11.0345 20.0098 7.29032L22.9598 3.49615C23.1096 3.24723 23.1909 2.96315 23.1954 2.67273C23.1999 2.3823 23.1274 2.09587 22.9852 1.84245C22.8431 1.58902 22.6364 1.37763 22.386 1.22968C22.1357 1.08173 21.8507 1.0025 21.5598 1H10.9598C10.6689 1.0025 10.3838 1.08173 10.1335 1.22968C9.88314 1.37763 9.67644 1.58902 9.53432 1.84245C9.39217 2.09587 9.31967 2.3823 9.32414 2.67273C9.32862 2.96315 9.40989 3.24723 9.55977 3.49615L12.5098 7.31527C5.00977 11.0845 1.25977 16.0768 1.25977 23.5653C1.25977 30.4047 7.50977 33.5 16.2598 33.5Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M19.7166 16.7643C19.5977 16.4279 19.4142 16.122 19.1811 15.8615C18.6852 15.3074 17.9645 14.9587 17.1624 14.9587H15.066C13.7308 14.9587 12.6484 16.0411 12.6484 17.3763C12.6484 18.5124 13.4395 19.4952 14.5494 19.738L17.7411 20.4362C18.9845 20.7082 19.8707 21.81 19.8707 23.0828C19.8707 24.5786 18.6581 25.7922 17.1624 25.7922H15.3568C14.1776 25.7922 13.1744 25.0385 12.8026 23.9866"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M16.2598 14.9584V12.25" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M16.2598 28.5002V25.7917" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg>
                    </div>
                    <div class="menu-text">판매기록조회</div>
                    <div class="arrow"><svg width="14" height="24" viewBox="0 0 14 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M2.85972 21.4274L10.4664 13.8208C11.3647 12.9224 11.3647 11.4524 10.4664 10.5541L2.85972 2.94744"
                                stroke="#888888" stroke-width="4.8" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg></div>
                </div>
                <div class="submenu">
                    <a href="/branch/finance/list">
                        <div class="submenu-item">하루 매출</div>
                    </a>
                </div>
                <div id="order-menu" class="menu-item">
                    <div class="menu-icon">
                        <svg width="34" height="34" viewBox="0 0 34 34" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M30.5811 14.7501H3.78099C3.42347 14.747 3.06944 14.8207 2.74279 14.9662C2.41617 15.1116 2.12454 15.3254 1.88759 15.5932C1.65064 15.861 1.47388 16.1764 1.36923 16.5183C1.26459 16.8602 1.2345 17.2206 1.28099 17.5751L3.10599 31.325C3.18532 31.9302 3.48334 32.4857 3.94387 32.8862C4.40439 33.287 4.99559 33.5052 5.60599 33.5H28.7061C29.3163 33.5052 29.9076 33.287 30.3681 32.8862C30.8286 32.4857 31.1266 31.9302 31.2061 31.325L33.0311 17.5751C33.0768 17.2247 33.0481 16.8686 32.9463 16.5303C32.8446 16.1919 32.6723 15.8789 32.4408 15.612C32.2093 15.345 31.9238 15.1302 31.6033 14.9816C31.2828 14.8331 30.9343 14.7541 30.5811 14.7501Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M10.9312 21V27.25" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M17.1812 21V27.25" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M23.4312 21V27.25" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path
                                d="M23.3809 3.6001C24.8784 3.85882 26.2504 4.59957 27.2884 5.7097C28.3264 6.8198 28.9734 8.23855 29.1309 9.7501L29.6809 14.7501"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M4.68115 14.7501L5.23115 9.75015C5.39895 8.24755 6.05045 6.84017 7.08753 5.73997C8.1246 4.63977 9.49108 3.90635 10.9812 3.65015"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M23.4312 4.125C23.4312 4.53537 23.3503 4.94175 23.1933 5.32087C23.0362 5.70002 22.8061 6.04452 22.5159 6.3347C22.2257 6.6249 21.8812 6.85508 21.502 7.01213C21.1229 7.16918 20.7165 7.25 20.3062 7.25H14.0562C13.2274 7.25 12.4325 6.92075 11.8465 6.3347C11.2604 5.74865 10.9312 4.9538 10.9312 4.125C10.9312 3.2962 11.2604 2.50135 11.8465 1.91529C12.4325 1.32924 13.2274 1 14.0562 1H20.3062C21.135 1 21.9298 1.32924 22.5159 1.91529C23.1019 2.50135 23.4312 3.2962 23.4312 4.125Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                        </svg>
                    </div>
                    <div id="order-text" class="menu-text">발주신청</div>
                    <div class="arrow"><svg width="14" height="24" viewBox="0 0 14 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M2.85972 21.4274L10.4664 13.8208C11.3647 12.9224 11.3647 11.4524 10.4664 10.5541L2.85972 2.94744"
                                stroke="#888888" stroke-width="4.8" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg></div>
                </div>
                <div class="submenu">
                    <a href="/branch/order/orderPage"><div class="submenu-item">발주신청</div></a>
                    <a href="/branch/order/list"><div class="submenu-item">발주신청 내역</div></a>
                </div>

                <div class="menu-item">
                    <div class="menu-icon"><svg width="37" height="36" viewBox="0 0 37 36" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M14.1483 0.5H2.70602C1.96256 0.5 1.35986 1.10269 1.35986 1.84615V13.2885C1.35986 14.0319 1.96256 14.6346 2.70602 14.6346H14.1483C14.8918 14.6346 15.4945 14.0319 15.4945 13.2885V1.84615C15.4945 1.10269 14.8918 0.5 14.1483 0.5Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M35.0136 0.5H23.5713C22.8278 0.5 22.2251 1.10269 22.2251 1.84615V13.2885C22.2251 14.0319 22.8278 14.6346 23.5713 14.6346H35.0136C35.7569 14.6346 36.3597 14.0319 36.3597 13.2885V1.84615C36.3597 1.10269 35.7569 0.5 35.0136 0.5Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M14.1483 21.3654H2.70602C1.96256 21.3654 1.35986 21.9681 1.35986 22.7115V34.1538C1.35986 34.8972 1.96256 35.5 2.70602 35.5H14.1483C14.8918 35.5 15.4945 34.8972 15.4945 34.1538V22.7115C15.4945 21.9681 14.8918 21.3654 14.1483 21.3654Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path
                                d="M35.0136 21.3654H23.5713C22.8278 21.3654 22.2251 21.9681 22.2251 22.7115V34.1538C22.2251 34.8972 22.8278 35.5 23.5713 35.5H35.0136C35.7569 35.5 36.3597 34.8972 36.3597 34.1538V22.7115C36.3597 21.9681 35.7569 21.3654 35.0136 21.3654Z"
                                stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            <path d="M1.35986 8.5769H15.4945" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M22.2251 8.5769H36.3597" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M22.2251 29.4423H36.3597" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                            <path d="M1.35986 29.4423H15.4945" stroke="#888888" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg>
                    </div>
                    <a href="/branch/bread/list"><div class="menu-text">메뉴조회</div></a>

                </div>
                <div class="menu-item">
                    <div class="menu-icon"><svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <g clip-path="url(#clip0_273_6816)">
                                <path
                                    d="M15.8838 2.83203H31.6398C32.8118 2.83203 33.7618 3.71877 33.7618 4.81261V20.6295C33.7618 21.7234 32.8118 22.6101 31.6398 22.6101H18.7598"
                                    stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                                <path
                                    d="M7.88121 11.0012C10.2982 11.0012 12.2576 9.17247 12.2576 6.9166C12.2576 4.66076 10.2982 2.83203 7.88121 2.83203C5.46423 2.83203 3.50488 4.66076 3.50488 6.9166C3.50488 9.17247 5.46423 11.0012 7.88121 11.0012Z"
                                    stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                                <path
                                    d="M22.5098 14.5615C22.5098 13.2374 21.3597 12.1641 19.9411 12.1641H7.88209C4.22469 12.1641 1.25977 14.9313 1.25977 18.3449V23.8307H4.09789L5.04394 33.1641H10.7202L12.9004 16.9589H19.9411C21.3597 16.9589 22.5098 15.8855 22.5098 14.5615Z"
                                    stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                            </g>
                            <defs>
                                <clipPath id="clip0_273_6816">
                                    <rect width="35" height="35" fill="white" transform="translate(0.259766 0.5)" />
                                </clipPath>
                            </defs>
                        </svg>
                    </div>
                    <div class="menu-text">회사</div>
                    <div class="arrow"><svg width="14" height="24" viewBox="0 0 14 24" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path
                                d="M2.85972 21.4274L10.4664 13.8208C11.3647 12.9224 11.3647 11.4524 10.4664 10.5541L2.85972 2.94744"
                                stroke="#888888" stroke-width="4.8" stroke-miterlimit="10" stroke-linecap="round"
                                stroke-linejoin="round" />
                        </svg></div>
                </div>
                <div class="submenu">
                    <a href="/branch/introduce"><div class="submenu-item">회사소개</div></a>
                    <a href="/branch/introduction/allEmployeeList"><div class="submenu-item">전체 사원조회</div></a>
                </div>

            </div>

        </div>
        

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const menuItems = document.querySelectorAll('.menu-item');

                menuItems.forEach(item => {
                    // 화살표가 있는 메뉴 아이템만 클릭 이벤트 처리
                    const arrow = item.querySelector('.arrow');
                    if (arrow) {
                        item.addEventListener('click', function () {
                            // 현재 메뉴의 활성화 상태 토글
                            this.classList.toggle('active');

                            // 다음 형제 요소인 서브메뉴 토글
                            const submenu = this.nextElementSibling;
                            if (submenu && submenu.classList.contains('submenu')) {
                                submenu.classList.toggle('show');
                            }
                        });
                    } else {
                        // 화살표가 없는 메뉴는 클릭시 페이지 이동
                        item.addEventListener('click', function () {
                            const menuText = this.querySelector('.menu-text').textContent;
                            // 각 메뉴별 이동할 페이지 URL 설정
                            switch (menuText) {
                                case '메뉴조회':
                                    location.href = '/menu';
                                    break;
                                // 다른 메뉴들에 대한 페이지 이동 처리 추가
                            }
                        });
                    }
                });

                // 서브메뉴 아이템 클릭 이벤트
                const submenuItems = document.querySelectorAll('.submenu-item');
                submenuItems.forEach(item => {
                    item.addEventListener('click', function (e) {
                        e.stopPropagation(); // 상위 메뉴 클릭 이벤트 전파 방지
                        const menuText = this.textContent;
                        // 각 서브메뉴별 이동할 페이지 URL 설정
                        switch (menuText) {
                        }
                    });
                });
            });
        </script>
    </body>
    </html>