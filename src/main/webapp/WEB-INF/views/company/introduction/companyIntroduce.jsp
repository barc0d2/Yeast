<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <style>
    body {
      margin: 0;
      padding: 0;
    }

    .companyIntroduce {
      margin-left: 250px;
      padding-top: 100px;
      width: calc(100% - 250px);
      box-sizing: border-box;
    }

    .companyIntroduce img {
      width: 100%;
      height: auto;
      display: block;
    }

  </style>
</head>
<body>
<div class="companyIntroduce">
<img src="/resources/uploadfile/companyIntroduce.png" />
</div>
</body>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>
</html>
