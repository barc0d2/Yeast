<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>비밀번호 변경</title>
  <style>
    body {
      font-family: sans-serif;
      position: relative;
      margin: 0;
      padding: 0;
    }

    form {
      position: absolute;
      width: 500px;
      padding: 40px;
      background-color: #f9f9f9;
      border-radius: 10px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      top: 30%;
      left: 40%;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 28px;
    }

    label {
      display: block;
      margin: 20px 0 8px;
      font-size: 18px;
    }

    input[type="password"] {
      width: 100%;
      padding: 14px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }

    button {
      margin-top: 30px;
      padding: 14px;
      width: 100%;
      background-color: #eaa333;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 18px;
      border-radius: 6px;
    }

    button:hover {
      background-color: #eeba37;
    }
  </style>
</head>
<body>

<form action="/company/updatePwd" method="post">
  <h2>비밀번호 변경</h2>

  <label for="currentPwd">현재 비밀번호</label>
  <input type="password" id="currentPwd" name="currentPwd" required>

  <label for="newPwd">새 비밀번호</label>
  <input type="password" id="newPwd" name="newPwd" required>

  <label for="confirmPwd">새 비밀번호 확인</label>
  <input type="password" id="confirmPwd" name="confirmPwd" required>

  <button type="submit">비밀번호 변경</button>
</form>

<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>

</body>
</html>
