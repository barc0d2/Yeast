<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/company/bread/enrollForm/globals.css" />
    <link rel="stylesheet" href="/css/company/bread/enrollForm/style.css" />
    <link rel="stylesheet" href="/css/company/bread/enrollForm/styleguide.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <body>
    <div class="main">
      <div class="container">
        <header class="header">
          <p class="left-line">
            <span class="text-wrapper">메뉴 등록<br /></span>
            <span class="span">고객에게 서비스할 새로운 메뉴를 등록합니다. </span>
          </p>
          <div class="right-line">메뉴관리 / 등록</div>
        </header>
        <form class="form" enctype="multipart/form-data" method="post" action="">
          <div>
            <img id="thumbnail" class="image" onclick="chooseFile('.file-image')">
          </div>
          <div style="display: none;">
            <input type="file" class="file-image" name="image" required onchange="loadImg(this, '#thumbnail')">
          </div>
          <div class="column">
            <div class="list">
              <div class="div">
                <p class="p"><span class="text-wrapper-2">메뉴 종류</span> <span class="text-wrapper-3">*</span></p>
                <div class="select">
                  <input class="el" />
                  <img class="icon" src="img/icon.svg" />
                </div>
              </div>
              <div class="div">
                <p class="p"><span class="text-wrapper-2">메뉴 이름</span> <span class="text-wrapper-3">*</span></p>
                <div class="menu-name"><input class="text-wrapper-4"/></div>
              </div>
              <div class="div">
                <p class="p"><span class="text-wrapper-2">가격</span> <span class="text-wrapper-3">*</span></p>
                <div class="div-2">
                  <input class="text-wrapper-4"/>
                  <div class="text-wrapper-4">원</div>
                </div>
              </div>
              <div class="menu-descript">
                <div class="menu-descript-2">메뉴 설명</div>
                <div class="menu-description">
                  <textarea class="text-wrapper-5" style="border: none; resize: none"></textarea>
                </div>
              </div>
            </div>
            <div class="column-2">
              <div class="list-2">
                <div class="div">
                  <div class="text-wrapper-6">메뉴 칼로리</div>
                  <div class="div-2">
                    <input class="text-wrapper-4"/>
                    <div class="text-wrapper-4">kcal</div>
                  </div>
                </div>
                <div class="menu-info">
                  <div class="menu-info-2">메뉴 알레르기 정보</div>
                  <div class="info"><input class="text-wrapper-5"/></div>
                </div>
                <div class="sale-status">
                  <div class="text-wrapper-6">판매여부</div>
                  <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" style="width: 70px; height: 30px" id="flexSwitchCheckChecked" checked>
                  </div>
                </div>
                <div class="div">
                  <div class="text-wrapper-6">메뉴 등록일</div>
                  <div class="register-date">
                    <input class="date"/>
                    <img class="img" src="img/image.png" />
                  </div>
                </div>
              </div>
              <div class="end">
                <button type="submit" class="update-btn"><div class="text-wrapper-7">저장</div></button>
              </div>
            </div>
          </div>
        </form>
      </div>
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
  </script>
  </body>
</html>
