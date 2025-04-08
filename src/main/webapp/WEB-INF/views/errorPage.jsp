<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Layout</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        html,
        body{
            width: 100%;
            height: 100%;
            align-items: center;
            align-content: center;
            display: flex;
            justify-content: center;
        }
        .errorPage{
            position: relative;
            width: 1413px;
            height: 874px;
            background-image: url('/resources/uploadfile/errorPage.jpg');
            background-repeat: no-repeat;
            background-size: cover;
        }
        .errorMsg{
            position: absolute;
            top: 40%;
            left: 57%;
            color: white;
            font-size: 40px;
        }
        .back{
            color: white;
            position: absolute;
            width: 120px;
            height: 50px;
            top: 10px;
            right: 10px;
            border: #5c5c5c 1px solid;
            padding: 10px;
            border-radius: 10px;
            font-size: 20px;
            cursor: pointer;
            background: rgba(255, 255, 255, 0.3);
        }
        .back:hover{
            background-color: #afafaf;
        }
    </style>
</head>
<body>
    <div class="errorPage">
        <button class="back" onclick="history.back()">이전으로</button>
        <h1 class="errorMsg">${errorMsg}</h1>
    </div>
</body>

</html>