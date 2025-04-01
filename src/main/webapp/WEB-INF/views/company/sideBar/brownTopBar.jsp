<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #top-bar {
            height: 97px;
            width: calc(100% - 250px);
            position: fixed;
            right:0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
            z-index: 10;
        }

        #top-bar-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #FFF8E7;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
            border-bottom: 1px solid rgba(159, 159, 159, 0.05);
            z-index: -1;
        }

        .menu-management {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .menu-icons {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .menu-label {
            color: #888888;
            font-size: 20px;
            font-weight: 700;
        }
        .page-title {
            color: black;
            font-size: 32px;
            font-weight: 700;
        }

        .branch-info {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .branch-name {
            color: black;
            font-size: 28px;
            font-weight: 700;
        }

        .manager-info {
            display: flex;
            align-items: center;
            gap: 9px;
        }

        .manager-label {
            color: #888888;
            font-size: 20px;
            font-weight: 700;
        }

        .manager-name {
            color: #575757;
            font-size: 24px;
            font-weight: 700;
        }
    </style>
</head>
<body>
<div id="top-bar">
    <div id="top-bar-background"></div>
    <div class="menu-management">
        <div class="menu-icons">
            <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                        d="M8.30769 1H1.76923C1.3444 1 1 1.3444 1 1.76923V8.30769C1 8.73252 1.3444 9.07692 1.76923 9.07692H8.30769C8.73252 9.07692 9.07692 8.73252 9.07692 8.30769V1.76923C9.07692 1.3444 8.73252 1 8.30769 1Z"
                        stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                <path
                        d="M20.2305 1H13.6921C13.2673 1 12.9229 1.3444 12.9229 1.76923V8.30769C12.9229 8.73252 13.2673 9.07692 13.6921 9.07692H20.2305C20.6553 9.07692 20.9998 8.73252 20.9998 8.30769V1.76923C20.9998 1.3444 20.6553 1 20.2305 1Z"
                        stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                <path
                        d="M8.30769 12.9231H1.76923C1.3444 12.9231 1 13.2675 1 13.6923V20.2308C1 20.6556 1.3444 21 1.76923 21H8.30769C8.73252 21 9.07692 20.6556 9.07692 20.2308V13.6923C9.07692 13.2675 8.73252 12.9231 8.30769 12.9231Z"
                        stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                <path
                        d="M20.2305 12.9231H13.6921C13.2673 12.9231 12.9229 13.2675 12.9229 13.6923V20.2308C12.9229 20.6556 13.2673 21 13.6921 21H20.2305C20.6553 21 20.9998 20.6556 20.9998 20.2308V13.6923C20.9998 13.2675 20.6553 12.9231 20.2305 12.9231Z"
                        stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                <path d="M1 5.61536H9.07692" stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                <path d="M12.9229 5.61536H20.9998" stroke="#888888" stroke-linecap="round"
                      stroke-linejoin="round" />
                <path d="M12.9229 17.5385H20.9998" stroke="#888888" stroke-linecap="round"
                      stroke-linejoin="round" />
                <path d="M1 17.5385H9.07692" stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
            </svg>
            <div class="menu-label">메뉴관리</div>
        </div>
        <div class="page-title">메뉴조회</div>
    </div>

    <div class="branch-info">
        <div class="branch-name">회사</div>
        <div class="manager-info">
            <div class="manager-label">공장장</div>
            <div class="manager-name">황인태</div>
            <div class="manager-separator">
                <svg width="11" height="6" viewBox="0 0 11 6" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1 1L4.70455 4.67453C5.14205 5.10849 5.85795 5.10849 6.29545 4.67453L10 1"
                          stroke="#575757" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round"
                          stroke-linejoin="round" />
                </svg>
            </div>
        </div>
    </div>
</div>
</body>
</html>
