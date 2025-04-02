<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/css/company/employee/enrollForm/globals.css"/>
    <link rel="stylesheet" href="/css/company/employee/enrollForm/style.css"/>
    <link rel="stylesheet" href="/css/company/employee/enrollForm/styleguide.css"/>
</head>
<body>
<div class="main">
    <form class="form" action="">
        <div class="pre">
            <div class="text-wrapper">이전</div>
        </div>
        <div class="button">
            <button type="submit">
                <div class="update">
                    <div class="div">수정</div>
                </div>
            </button>

            <button>
                <div class="delete">
                    <div class="div">삭제</div>
                </div>
            </button>

        </div>
        <div class="write">
            <div class="column">
                <div class="image">
                    <div class="image-in">
                        <div class="text-wrapper-2">첨부한 이미지</div>
                        <div class="circle" onclick="">
                            <svg width="78" height="78" viewBox="0 0 78 78" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M78 39C78 60.5391 60.5391 78 39 78C17.4609 78 0 60.5391 0 39C0 17.4609 17.4609 0 39 0C60.5391 0 78 17.4609 78 39ZM41.4375 21.9375C41.4375 20.5913 40.3462 19.5 39 19.5C37.6538 19.5 36.5625 20.5913 36.5625 21.9375V36.5625H21.9375C20.5913 36.5625 19.5 37.6538 19.5 39C19.5 40.3462 20.5913 41.4375 21.9375 41.4375H36.5625V56.0625C36.5625 57.4087 37.6538 58.5 39 58.5C40.3462 58.5 41.4375 57.4087 41.4375 56.0625V41.4375H56.0625C57.4087 41.4375 58.5 40.3462 58.5 39C58.5 37.6538 57.4087 36.5625 56.0625 36.5625H41.4375V21.9375Z"
                                      fill="#C8C8C8"/>
                            </svg>
                        </div>


                    </div>
                </div>
                <div class="div-2">
                    <div class="title">이름</div>
                    <input type="text" class="input" name="userName" required>
                </div>
                <div class="div-2">
                    <div class="title">아이디</div>
                    <div class="input" aria-readonly="true"></div>
                </div>
                <div class="address">
                    <div class="title">집주소</div>
                    <input type="text" class="input" name="userId" required>
                </div>
            </div>
            <div class="column-2">
                <div class="div-2">
                    <div class="title">사수</div>
                    <input type="text" class="input" name="managerName">
                </div>
                <div class="div-2">
                    <div class="title">이메일</div>
                    <input type="text" class="input" name="email" required>
                </div>
                <div class="div-2">
                    <div class="title">전화번호</div>
                    <input type="text" class="input" name="phone" required>
                </div>
                <div class="div-2">
                    <div class="title">생년월일</div>
                    <input type="date" class="input" name="birthday" required>
                </div>
                <div class="job">
                    <div class="split">
                        <div class="div-3">
                            <div class="title">*가맹점</div>
                            <input type="text" class="input" name="branch" required>
                        </div>
                        <div class="div-3">
                            <div class="title">직무</div>
                            <input type="text" class="input" name="position">
                        </div>
                    </div>
                </div>
                <div class="gender">
                    <div class="title">성별</div>
                    <div class="input" aria-readonly="true"></div>
                </div>
            </div>
        </div>
    </form>
</div>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
