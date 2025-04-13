<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="/css/company/mypage/updateForm/globals.css"/>
    <link rel="stylesheet" href="/css/company/mypage/updateForm/style.css"/>
    <link rel="stylesheet" href="/css/company/mypage/updateForm/styleguide.css"/>
</head>
<body>
<div class="main">
    <form class="form" action="/company/mypage/update" method="post" enctype="multipart/form-data">
        <a href="/company/dashboard">
            <div class="pre">
                <div class="text-wrapper">홈으로</div>
            </div>
        </a>
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

                <div class="image" style="cursor: pointer">
                    <section class="thumbnail">
                        <div class="overlap-group">
                            <img id="thumbnail" src="${member.imageChange}" class="image" onclick="chooseFile('.file-image')">
                            <div style="display: none;">
                                <input type="file" class="file-image" name="reupfile" onchange="loadImg(this, '#thumbnail')">
                            </div>
                            <input type="hidden" name="imageChange" value="${member.imageChange}">
                        </div>
                    </section>
                    <%--                    <div class="image-in">--%>
                    <%--                        <div class="text-wrapper-2">첨부한 이미지</div>--%>
                    <%--                        <div class="circle" onclick="">--%>
                    <%--                            <svg width="78" height="78" viewBox="0 0 78 78" fill="none"--%>
                    <%--                                 xmlns="http://www.w3.org/2000/svg">--%>
                    <%--                                <path d="M78 39C78 60.5391 60.5391 78 39 78C17.4609 78 0 60.5391 0 39C0 17.4609 17.4609 0 39 0C60.5391 0 78 17.4609 78 39ZM41.4375 21.9375C41.4375 20.5913 40.3462 19.5 39 19.5C37.6538 19.5 36.5625 20.5913 36.5625 21.9375V36.5625H21.9375C20.5913 36.5625 19.5 37.6538 19.5 39C19.5 40.3462 20.5913 41.4375 21.9375 41.4375H36.5625V56.0625C36.5625 57.4087 37.6538 58.5 39 58.5C40.3462 58.5 41.4375 57.4087 41.4375 56.0625V41.4375H56.0625C57.4087 41.4375 58.5 40.3462 58.5 39C58.5 37.6538 57.4087 36.5625 56.0625 36.5625H41.4375V21.9375Z"--%>
                    <%--                                      fill="#C8C8C8"/>--%>
                    <%--                            </svg>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>
                </div>
                <div style="display: none">
                    <input type="text" class="input" value="${member.userNo}" name="userNo" hidden="hidden">
                </div>
                <div class="div-2">
                    <div class="title">이름</div>
                    <input type="text" class="input" value="${member.userName}" name="userName" required>
                </div>
                <div class="div-2">
                    <div class="title">아이디</div>
                    <input type="text" class="input" value="${member.userId}" name="userId" readonly>
                </div>
                <div class="address">
                    <div class="title">집주소</div>
                    <input type="text" class="input" value="${member.address}" name="address" required>
                </div>
            </div>
            <div class="column-2">
                <div class="div-2">
                    <div class="title">사수</div>
                    <input type="text" class="input" value="${member.managerName}" name="managerName">
                    <div id="managerCheckMessage" style="margin-top: 10px; font-size: 12px; padding-left: 180px"></div>
                </div>
                <div class="div-2">
                    <div class="title">이메일</div>
                    <input type="text" class="input" value="${member.email}" name="email" required>
                </div>
                <div class="div-2">
                    <div class="title">전화번호</div>
                    <input type="tel" class="input" value="${member.phone}" name="phone" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required>
                </div>
                <div class="div-2">
                    <div class="title">생년월일</div>
                    <input type="date" class="input" value="${member.birthday}" name="birthday" required>
                </div>
                <div class="job">
                    <div class="split">
                        <div class="div-3">
                            <div class="title">*가맹점</div>
                            <select class="input" name="businessNo" required>
                                <c:forEach items="${businesses}" var="business">
                                    <option value="${business.businessNo}"
                                            <c:if test="${business.businessNo eq member.businessNo}">selected</c:if>>
                                            ${business.businessName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="div-3">
                            <div class="title">직무</div>
                            <select class="input" name="positionNo" required>
                                <c:forEach items="${positions}" var="position">
                                    <option value="${position.positionNo}"
                                            <c:if test="${position.positionNo eq member.positionNo}">selected</c:if>>
                                            ${position.positionName}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="gender">
                    <div class="title">성별</div>
                    <input type="text" class="input" value="${member.gender}" name="gender" readonly>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    function loadImg(changeInput, targetImg){
        //파일객체 -> files -> 선택된파일들이 담겨있음
        console.log(changeInput.files[0])
        const img = document.querySelector(targetImg);
        console.log(img)
        if(changeInput.files.length > 0){ //파일은 선택했을 때
            //파일을 읽어들일 객체
            const reader = new FileReader();

            //해당 파일을 읽얻들여 해당파일만의 고유한 url을 부여
            //url : Base64로 인코딩된 데이터 url(파일을 실제로 표현하는 형식인 바이너리 코드를 텍스트문자열로 인코딩한 방식)
            reader.readAsDataURL(changeInput.files[0]);

            //파일읽어들이기를 완료 했을 때 이벤트핸들러를 실행시켜줘
            reader.onload = function(ev){
                img.src = ev.target.result //이미지 요소에 불러온 파일의 url을 넣어준다.
            }


        } else { //파일이 있었는데 선택 후 취소했을 때
            img.src = null;
        }
    }

    function chooseFile(selector){
        const fileInput = document.querySelector(selector);
        fileInput.click();
    }

    // 사수 이름 검증
    const managerNameInput = document.querySelector('input[name="managerName"]');
    if (managerNameInput) {
        managerNameInput.addEventListener('blur', function() {
            const managerName = this.value;
            if (managerName.trim() !== '') {
                $.ajax({
                    url: "/member/check-manager",
                    data: { managerName: managerName },
                    success: function(result) {
                        const messageDiv = document.getElementById('managerCheckMessage');
                        if(result) {
                            messageDiv.style.color = "green";
                            messageDiv.textContent = "사용 가능한 사수입니다.";
                        } else {
                            messageDiv.style.color = "red";
                            messageDiv.textContent = "존재하지 않는 사수입니다.";
                        }
                    },
                    error: function() {
                        console.log("사수 검증 ajax 실패");
                    }
                });
            } else {
                document.getElementById('managerCheckMessage').textContent = "";
            }
        });
    }
</script>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</body>
</html>
