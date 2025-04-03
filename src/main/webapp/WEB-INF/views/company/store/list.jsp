<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="/css/company/store/list/globals.css"/>
    <link rel="stylesheet" href="/css/company/store/list/style.css"/>
    <link rel="stylesheet" href="/css/company/store/list/styleguide.css"/>
</head>
<body>
<div class="frame">
    <div class="div">
        <div class="list">

            <c:forEach var="s" items="${list}">
                <div class="detail">
                    <div class="overlap-group">
                        <div class="row">
                            <div class="update">
                                <div class="in">
                                    <svg width="18" height="17" viewBox="0 0 18 17" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <g opacity="0.6">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                  d="M9.7835 10.2694L7.30884 10.6234L7.66217 8.14807L14.0262 1.78407C14.612 1.19828 15.5617 1.19828 16.1475 1.78407C16.7333 2.36986 16.7333 3.31961 16.1475 3.9054L9.7835 10.2694Z"
                                                  stroke="black" stroke-width="1.2" stroke-linecap="round"
                                                  stroke-linejoin="round"/>
                                            <path d="M13.3188 2.49121L15.4402 4.61254" stroke="black" stroke-width="1.2"
                                                  stroke-linecap="round" stroke-linejoin="round"/>
                                            <path d="M13.5869 10.3452V15.3452C13.5869 15.8975 13.1392 16.3452 12.5869 16.3452H2.58691C2.03463 16.3452 1.58691 15.8975 1.58691 15.3452V5.34521C1.58691 4.79293 2.03463 4.34521 2.58691 4.34521H7.58691"
                                                  stroke="black" stroke-width="1.2" stroke-linecap="round"
                                                  stroke-linejoin="round"/>
                                        </g>
                                    </svg>

                                    <div class="text">수정하기</div>
                                </div>
                            </div>
                            <div class="delete">
                                <div class="in-2">
                                    <svg width="21" height="20" viewBox="0 0 21 20" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M7.7198 7.05046C7.96388 6.81859 8.35961 6.81859 8.60368 7.05046L10.6617 9.00562L12.7198 7.05047C12.9639 6.8186 13.3596 6.8186 13.6037 7.05047C13.8478 7.28234 13.8478 7.65828 13.6037 7.89016L11.5456 9.84531L13.6037 11.8005C13.8478 12.0323 13.8478 12.4083 13.6037 12.6402C13.3596 12.872 12.9639 12.872 12.7198 12.6402L10.6617 10.685L8.60369 12.6402C8.35961 12.872 7.96389 12.872 7.71981 12.6402C7.47573 12.4083 7.47573 12.0323 7.71981 11.8005L9.77787 9.84531L7.7198 7.89015C7.47572 7.65828 7.47572 7.28234 7.7198 7.05046Z"
                                              fill="#FF0000"/>
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                              d="M6.75902 3.32891C9.33198 3.05573 11.9915 3.05573 14.5644 3.32891C16.0864 3.49051 17.3155 4.62944 17.4945 6.0837C17.8022 8.58293 17.8022 11.1077 17.4945 13.6069C17.3155 15.0612 16.0864 16.2001 14.5644 16.3617C11.9915 16.6349 9.33198 16.6349 6.75902 16.3617C5.23704 16.2001 4.00795 15.0612 3.82891 13.6069C3.52122 11.1077 3.52122 8.58293 3.82891 6.0837C4.00795 4.62944 5.23704 3.49051 6.75902 3.32891ZM14.4256 4.50907C11.9449 4.24568 9.37855 4.24568 6.89786 4.50907C5.94417 4.61033 5.18079 5.3254 5.07045 6.22165C4.77404 8.62922 4.77404 11.0614 5.07045 13.469C5.18079 14.3652 5.94417 15.0803 6.89786 15.1816C9.37855 15.445 11.9449 15.445 14.4256 15.1816C15.3793 15.0803 16.1427 14.3652 16.253 13.469C16.5494 11.0614 16.5494 8.62922 16.253 6.22165C16.1427 5.3254 15.3793 4.61033 14.4256 4.50907Z"
                                              fill="#FF0000"/>
                                    </svg>

                                    <div class="text-wrapper">삭제</div>
                                </div>
                            </div>
                        </div>
                        <div class="name">${s.businessName}</div>
                        <div class="image">
                            <img src="${s.imageChange}"/>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="insert">
                <div class="button">
                    <svg width="78" height="78" viewBox="0 0 78 78" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M78 39C78 60.5391 60.5391 78 39 78C17.4609 78 0 60.5391 0 39C0 17.4609 17.4609 0 39 0C60.5391 0 78 17.4609 78 39ZM41.4375 21.9375C41.4375 20.5913 40.3462 19.5 39 19.5C37.6538 19.5 36.5625 20.5913 36.5625 21.9375V36.5625H21.9375C20.5913 36.5625 19.5 37.6538 19.5 39C19.5 40.3462 20.5913 41.4375 21.9375 41.4375H36.5625V56.0625C36.5625 57.4087 37.6538 58.5 39 58.5C40.3462 58.5 41.4375 57.4087 41.4375 56.0625V41.4375H56.0625C57.4087 41.4375 58.5 40.3462 58.5 39C58.5 37.6538 57.4087 36.5625 56.0625 36.5625H41.4375V21.9375Z"
                              fill="#C8C8C8"/>
                    </svg>
                    <div class="message-wrapper">
                        <div class="message">지점 추가</div>
                    </div>


                </div>
            </div>
        </div>
        <div class="page-bar">
            <div class="next-page"><img class="icon-2" src="img/image.svg"/></div>
            <div class="pre-page"><img class="icon-2" src="img/icon-2.svg"/></div>
            <div class="page">
                <div class="text-wrapper-2">1</div>
            </div>
            <div class="div-wrapper">
                <div class="text-wrapper-2">2</div>
            </div>
            <div class="page-2">
                <div class="text-wrapper-3">3</div>
            </div>
            <div class="page-3">
                <div class="text-wrapper-2">4</div>
            </div>
            <div class="page-4">
                <div class="text-wrapper-2">5</div>
            </div>
            <div class="page-5">
                <div class="text-wrapper-2">6</div>
            </div>
            <div class="page-6">
                <div class="text-wrapper-2">7</div>
            </div>
            <div class="page-7">
                <div class="text-wrapper-2">8</div>
            </div>
            <div class="page-8">
                <div class="text-wrapper-2">9</div>
            </div>
            <div class="page-9">
                <div class="text-wrapper-4">10</div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
