<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 31.
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/login.css">
</head>

<body>
<div id="frame">
    <img class="Background" src="images/login/background.jpg" />
    <form id="Main">
        <div id="Title">
            빵처럼 부드럽고, <br />효율적인 통합 관리 프로그램</div>
        <div id="Input">
            <div id="Id">
                <div>
                    아이디
                    <input type="text" id="userId" name="userId" class="input" required>
                </div>
            </div>
            <div id="Password">
                <div>
                    비밀번호
                    <input type="password" id="userPwd" name="userPwd" class="input" required>
                </div>
            </div>
        </div>
        <div id="Underlogo">
            <div id="Address">
                www.yeast.com<br />
            </div>
            <div data-svg-wrapper class="Vector62">
                <svg width="508" height="2" viewBox="0 0 508 2" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1 1.75253L506.999 0.752577" stroke="#191919" stroke-width="0.5"
                          stroke-linecap="round" />
                </svg>
            </div>
            <div id="KhAcademy">
                kh academy<br /> </div>
        </div>
        <div id="Logo">
            <img class="Image" src="images/login/logo.png" />
            <img class="Text" src="images/login/logoText.png" />
        </div>
        <div id="Checkbox">
            <div class="findIdPwd">
                ID/PW 찾기
            </div>
            <div class="Join">
                회원가입
            </div>
            <label class="Session" style="white-space: nowrap;">
                <input type="checkbox" id="Session" name="Session">
                로그인 유지
            </label>
            <div data-svg-wrapper class="Line" style="left: 363px; top: 2px; position: absolute">
                <svg width="2" height="16" viewBox="0 0 2 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M1 15L1 1" stroke="#888888" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </div>
        </div>
        <div id="underContent">
            “ 진정한 빵맛을 보러온 당신에게...”
        </div>
        <div id="Bread"></div>
    </form>
</div>
</body>

</html>