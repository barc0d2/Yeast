<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
  <head>
    <title>사용자 정보 양식</title>
    <link rel="stylesheet" href="css/branch/employee/enrollForm/globals.css" />
    <link rel="stylesheet" href="css/branch/employee/enrollForm/styleguide.css" />
    <link rel="stylesheet" href="css/branch/employee/enrollForm/style.css" />
  </head>
  <body>
    <main class="main">
      <form class="form" action="#" method="post">
        <button type="button" class="pre">
          <span class="text-wrapper">이전</span>
        </button>
        <div class="button">
          <button type="submit" class="update">
            <span class="div">수정</span>
          </button>
          <button type="button" class="delete">
            <span class="div">삭제</span>
          </button>
        </div>
        <div class="write">
          <section class="column">
            <div class="image">
              <img id="profile" class="image-in" onclick="chooseFile('.file-image')">
            </div>
            <div style="display: none;">
              <input type="file" class="file-image" name="image" required onchange="loadImg(this, '#profile')">
            </div>
            <div class="div-2">
              <label for="name" class="title">이름</label>
              <div class="input">
                <input type="text" id="name" name="name" class="hint" value="호원준" required />
              </div>
            </div>
            <div class="div-2">
              <label for="id" class="title">아이디</label>
              <div class="input">
                <input type="text" id="id" name="id" class="hint" value="호원준" required />
              </div>
            </div>
            <div class="address">
              <label for="address" class="title">집주소</label>
              <div class="input">
                <input type="text" id="address" name="address" class="hint" value="서울특별시" required />
              </div>
            </div>
          </section>
          <section class="column-2">
            <div class="div-2">
              <label for="password" class="title">비밀번호</label>
              <div class="input">
                <input type="password" id="password" name="password" class="hint" value="123123" required />
              </div>
            </div>
            <div class="div-2">
              <label for="email" class="title">이메일</label>
              <div class="input">
                <input type="email" id="email" name="email" class="hint" value="호원준@호원준.com" required />
              </div>
            </div>
            <div class="div-2">
              <label for="phone" class="title">전화번호</label>
              <div class="input">
                <input type="tel" id="phone" name="phone" class="hint" value="010-1111-2222" required />
              </div>
            </div>
            <div class="div-2">
              <label for="birthdate" class="title">생년월일</label>
              <div class="input">
                <input type="date" id="birthdate" name="birthdate" class="hint" value="2025-03-20" required />
              </div>
            </div>
            <div class="job">
              <div class="split">
                <div class="div-3">
                  <label for="company" class="title">*가맹점</label>
                  <div class="input">
                    <input type="text" id="company" name="company" class="hint" value="회사" required />
                  </div>
                </div>
                <div class="div-3">
                  <label for="position" class="title">직무</label>
                  <div class="input">
                    <input type="text" id="position" name="position" class="hint" value="직원" />
                  </div>
                </div>
              </div>
            </div>
            <div class="gender">
              <label for="gender" class="title">성별</label>
              <div class="input">
                <select id="gender" name="gender" class="select">
                  <option value="male" selected>Male</option>
                  <option value="female">Female</option>
                  <option value="other">Other</option>
                </select>
              </div>
            </div>
          </section>
        </div>
      </form>
    </main>
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
