<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="_csrf" content="${_csrf.token}"/>
  <title>YEAST 회원가입</title>
  <link rel="stylesheet" href="/css/register/style.css" />
  <link rel="stylesheet" href="/css/register/styleguide.css" />
  <link rel="stylesheet" href="/css/register/global.css" />
  <style>
    html, body {
      margin: 0;
      padding: 0;
      min-height: 100vh;
      overflow-x: hidden;
    }
    .register {
      width: 100%;
      min-height: 100vh;
      overflow-y: auto;
      overflow-x: hidden;
      padding-bottom: 50px;
    }
    .div {
      min-height: 100vh;
      position: relative;
    }
  </style>
  <script>
    // encodeURIComponent 함수 정의
    function encodeURIComponent(str) {
      return encodeURIComponent(str);
    }
  </script>
</head>
<body>
<div class="register">
  <div class="div">
    <div class="group">
      <div class="group-2">
        <div class="overlap-group-wrapper">
          <div class="overlap-group">
            <div class="text-wrapper">이용약관</div>
            <div class="frame"><div class="text-wrapper-2">회원가입</div></div>
          </div>
        </div>
        <div class="text-wrapper-3">Welcome to YEAST..!</div>
      </div>
      <form id="registrationForm" enctype="multipart/form-data">
        <div class="frame-2">
          <div class="group-3">
            <select class="gender" name="gender" required>
              <option value="">성별을 선택하세요</option>
              <option value="male">남</option>
              <option value="female">여</option>
            </select>
            <p class="p"><span class="span">성별</span> <span class="text-wrapper-4">(필수)</span></p>
          </div>
          <div class="group-3">
            <input class="rectangle" type="text" name="positionName"></input>
            <div class="text-wrapper-5">직무</div>
          </div>
          <div class="group-4">
            <div class="text-wrapper-6">소속(필수)</div>
            <select class="rectangle" name="businessName" required>
              <option value="">소속을 선택하세요</option>
              <option value="가맹점">가맹점</option>
              <option value="회사">회사</option>
            </select>
          </div>
          <div class="group-5">
            <input class="rectangle" type="text" name="managerName" required></input>
            <div class="text-wrapper-6">사수(필수)</div>
          </div>

        </div>
        <div class="group-6">
          <div class="frame-3">
            <div class="frame-4">
              <div class="group-7">
                <div class="profile-container">
                  <img id="profileImage" class="profile-preview default-image"
                       src="data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' width='200' height='200'><text x='50%' y='50%' text-anchor='middle' dy='.3em' fill='%23999'>프로필 사진 추가</text></svg>"
                       alt="프로필 사진">

                  <input type="file"
                         id="profileInput"
                         class="profile-input"
                         accept="image/*">
                </div>
              </div>
              <div class="group-8">
                <input class="rectangle-2" type="text" name="userName" required></input>
                <p class="div-2"><span class="span">이름</span> <span class="text-wrapper-4">(필수)</span></p>
              </div>
            </div>
            <div class="group-9">
              <input class="rectangle-3" type="text" name="userId" required></input>
              <p class="div-3"><span class="span">아이디</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-9">
              <input class="rectangle-3" type="password" name="userPwd" required></input>
              <p class="div-3"><span class="span">비밀번호</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-9">
              <input class="rectangle-3" type="password" name="confirm-password" required></input>
              <p class="div-3"><span class="span">비밀번호 확인</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
          </div>
          <div class="frame-5">
            <div class="group-10">
              <input class="rectangle-3" type="email" name="email" required></input>
              <p class="div-4"><span class="span">이메일</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-11">
              <input class="rectangle-3" type="date" name="birthday" required></input>
              <p class="div-3"><span class="span">생년월일</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-11">
              <input class="rectangle-3" type="tel" name="phone" required></input>
              <p class="div-3"><span class="span">전화번호</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-11">
              <input class="rectangle-3" type="text" name="address" required></input>
              <p class="div-3"><span class="span">주소</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
          </div>
        </div>
        <div class="div-wrapper">
          <input type="submit" class="text-wrapper-7" value="회원가입" />
        </div>
      </form>
    </div>
    <div class="view"><img class="logo" src="../../../../../../../../UI/project%20img/logo.png" /> <img class="logo-2" src="../../../../../../../../UI/project%20img/logo3.png" /></div>
  </div>
</div>

<script>
  const profileInput = document.getElementById('profileInput');
  const profileImage = document.getElementById('profileImage');
  const registrationForm = document.getElementById('registrationForm');
  let selectedFile = null;

  // 이미지 클릭 시 파일 선택 트리거
  profileImage.addEventListener('click', function() {
    profileInput.click();
  });

  profileInput.addEventListener('change', function(event) {
    const file = event.target.files[0];

    if (file) {
      // 파일 크기 제한 (예: 5MB)
      if (file.size > 5 * 1024 * 1024) {
        alert('파일 크기는 5MB를 초과할 수 없습니다.');
        return;
      }

      const reader = new FileReader();
      selectedFile = file;

      reader.onload = function(e) {
        profileImage.src = e.target.result;
        profileImage.classList.remove('default-image');
        profileImage.alt = '프로필 사진';
      };

      reader.readAsDataURL(file);
    }
  });

  // 아이디 중복 체크
  const idInput = document.querySelector('input[name="userId"]');
  let idCheckTimeout;

  idInput.addEventListener('input', function() {
    clearTimeout(idCheckTimeout);
    idCheckTimeout = setTimeout(() => {
      const userId = this.value;
      if (userId.length >= 4) {
        fetch('/member/check-id?userId=' + encodeURIComponent(userId))
          .then(response => response.json())
          .then(data => {
            const messageDiv = document.getElementById('idCheckMessage');
            messageDiv.textContent = data.message;
            messageDiv.style.color = data.available ? 'green' : 'red';
          })
          .catch(error => {
            console.error('Error:', error);
            alert('아이디 중복 체크 중 오류가 발생했습니다.');
          });
      }
    }, 500);
  });

  // 폼 제출 이벤트 처리
  registrationForm.addEventListener('submit', function(event) {
    event.preventDefault();

    // 비밀번호 일치 확인
    const password = document.querySelector('input[name="userPwd"]').value;
    const confirmPassword = document.querySelector('input[name="confirm-password"]').value;

    if (password !== confirmPassword) {
      alert('비밀번호가 일치하지 않습니다.');
      return;
    }

    // FormData 객체 생성
    const formData = new FormData(this);
    if (selectedFile) {
      formData.append('profileImage', selectedFile);
    }

    // 서버로 데이터 전송
    fetch('/member/register', {
      method: 'POST',
      body: formData,
      headers: {
        'X-CSRF-TOKEN': document.querySelector('meta[name="_csrf"]').content
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data => {
      if (data.success) {
        alert(data.message);
        window.location.href = '/login'; // 로그인 페이지로 리다이렉트
      } else {
        alert(data.message);
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('회원가입 중 오류가 발생했습니다. 다시 시도해주세요.');
    });
  });
</script>
</body>
</html>