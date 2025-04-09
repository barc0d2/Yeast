<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>매장 정보 수정</title>
  <link rel="stylesheet" href="/css/branch/store/updateForm/globals.css"/>
  <link rel="stylesheet" href="/css/branch/store/updateForm/style.css"/>
  <link rel="stylesheet" href="/css/branch/store/updateForm/styleguide.css"/>
</head>
<body>
<form class="store" action="/branch/store/updatveThings" method="post" enctype="multipart/form-data">
  <div class="form">
    <section class="thumbnail">
      <div class="overlap-group">
        <img id="thumbnail" src="${business.imageChange}" class="image" onclick="chooseFile('.file-image')">
        <div style="display: none;">
          <input type="file" class="file-image" name="reupfile" onchange="loadImg(this, '#thumbnail')">
        </div>
        <input type="hidden" name="imageChange" value="${business.imageChange}">
      </div>
    </section>
    <section class="list">
      <div class="div">
        <label for="branch-number" class="text">지점 번호</label>
        <div class="input">
          <input type="text" id="branch-number" class="text-wrapper-2"  name="businessNo" value="${business.businessNo}"
                 readonly/>
        </div>
      </div>
      <div class="div">
        <label for="branch-name" class="text">지점명</label>
        <div class="div-wrapper">
          <input type="text" id="branch-name" class="text-wrapper-2" name="businessName" value="${business.businessName}"/>
        </div>
      </div>
      <div class="div">
        <label for="phone-number" class="text">전화번호</label>
        <div class="div-wrapper">
          <input
                  type="tel"
                  id="phone-number"
                  class="text-wrapper-4"
                  name="phone"
                  value="${business.phone}"
                  pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
          />
        </div>
      </div>
      <div class="work">
        <label for="location" class="p"
        ><span class="span">주소</span> <span class="text-wrapper-4" aria-label="필수 입력">*</span></label>
        <div class="input-2">
          <input type="text" value="${business.location}" name="location" id="location" required/>
        </div>
      </div>
    </section>
  </div>
  <header class="header">
    <div class="title">
      <h1 class="line">지점 정보 수정</h1>
      <p class="line-2">지점 세부 내용을 수정합니다.</p>
    </div>
    <div class="right-button">
      <div class="submit">
        <a href="/branch/store/list">
          <div class="content">
            <div class="BUTTON">목록으로</div>
          </div>
        </a>
      </div>
      <div class="submit">
        <div class="content">
          <button type="submit" class="BUTTON">수정하기</button>
        </div>
      </div>
    </div>
  </header>
</form>
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
<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>
</body>
</html>
