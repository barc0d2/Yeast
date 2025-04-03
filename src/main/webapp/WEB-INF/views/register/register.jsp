<!DOCTYPE html>
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const profileInput = document.getElementById('profileInput');
      const profileImage = document.getElementById('profileImage');
      const registrationForm = document.getElementById('registrationForm');
      let selectedFile = null;

      // 이미지 클릭 시 파일 선택 트리거
      if (profileImage) {
        profileImage.addEventListener('click', function() {
          profileInput.click();
        });
      }

      if (profileInput) {
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
      }

      // 아이디 중복 체크
      const idCheckButton = document.querySelector('.id-check-button');
      if (idCheckButton) {
        idCheckButton.addEventListener('click', function() {
          const idInput = document.querySelector('input[name="userId"]');
          idCheck(idInput);
        });
      }

      let eventFlag;
      function idCheck(idInput) {
        const id = idInput.value;

        if(id.trim().length >= 5) {
          clearTimeout(eventFlag);
          eventFlag = setTimeout(function() {
            $.ajax({
              url: "/member/check-id",
              data: { checkId: id },
              success: function(result) {
                const messageDiv = document.getElementById('idCheckMessage');
                if(result === "NNNNY") {
                  messageDiv.style.color = "green";
                  messageDiv.textContent = "사용 가능한 아이디입니다.";
                } else {
                  messageDiv.style.color = "red";
                  messageDiv.textContent = "이미 사용중인 아이디입니다.";
                }
              },
              error: function() {
                console.log("아이디 중복체크 ajax 실패");
              }
            });
          }, 500);
        } else {
          document.getElementById('idCheckMessage').textContent = "아이디는 5자 이상이어야 합니다.";
        }
      }

      // 이메일 중복 체크
      const emailCheckButton = document.querySelector('.email-check-button');
      if (emailCheckButton) {
        emailCheckButton.addEventListener('click', function() {
          const emailInput = document.querySelector('input[name="email"]');
          emailCheck(emailInput);
        });
      }

      let emailEventFlag;
      function emailCheck(emailInput) {
        const email = emailInput.value;

        if(email.trim().length > 0) {
          clearTimeout(emailEventFlag);
          emailEventFlag = setTimeout(function() {
            $.ajax({
              url: "/member/check-email",
              data: { checkEmail: email },
              success: function(result) {
                const messageDiv = document.getElementById('emailCheckMessage');
                if(result === "NNNNY") {
                  messageDiv.style.color = "green";
                  messageDiv.textContent = "사용 가능한 이메일입니다.";
                } else {
                  messageDiv.style.color = "red";
                  messageDiv.textContent = "이미 사용중인 이메일입니다.";
                }
              },
              error: function() {
                console.log("이메일 중복체크 ajax 실패");
              }
            });
          }, 500);
        } else {
          document.getElementById('emailCheckMessage').textContent = "이메일을 입력해주세요.";
        }
      }

      // 폼 제출 이벤트 처리
      if (registrationForm) {
        registrationForm.addEventListener('submit', function(event) {
          event.preventDefault();

          // 아이디 중복 체크 확인
          const idCheckMessage = document.getElementById('idCheckMessage');
          if (idCheckMessage.style.color !== 'green') {
            alert('아이디 중복 체크를 해주세요.');
            return;
          }

          // 이메일 중복 체크 확인
          const emailCheckMessage = document.getElementById('emailCheckMessage');
          if (emailCheckMessage.style.color !== 'green') {
            alert('이메일 중복 체크를 해주세요.');
            return;
          }

          // 비밀번호 일치 확인
          const password = document.querySelector('input[name="userPwd"]').value;
          const confirmPassword = document.querySelector('input[name="confirm-password"]').value;

          if (password !== confirmPassword) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
          }

          // FormData 객체 생성
          const formData = new FormData(this);
          
          // 프로필 이미지가 있다면 추가
          if (selectedFile) {
            formData.append('profileImage', selectedFile);
          }

          // CSRF 토큰 추가
          const csrfToken = document.querySelector('meta[name="_csrf"]').content;
          formData.append('_csrf', csrfToken);

          // 서버로 데이터 전송
          fetch('/member/register', {
            method: 'POST',
            body: formData,
          })
          .then(response => {
            if (!response.ok) {
              return response.text().then(text => {
                throw new Error(text || 'Network response was not ok');
              });
            }
            return response;
          })
          .then(response => {
            alert('회원가입이 완료되었습니다.');
            window.location.href = '/login';
          })
          .catch(error => {
            console.error('Error:', error);
            alert('회원가입 중 오류가 발생했습니다. 다시 시도해주세요.');
          });
        });
      }
    });
  </script>
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
            <select class="gender" value="${m.gender}" name="gender" required>
              <option value="">성별을 선택하세요</option>
              <option value="M">남</option>
              <option value="F">여</option>
            </select>
            <p class="p"><span class="span">성별</span> <span class="text-wrapper-4">(필수)</span></p>
          </div>
          <div class="group-3">
            <select class="rectangle" name="positionNo" required>
              <option value="">직무를 선택하세요</option>
              <option value="1">C_회장</option>
              <option value="2">C_사장</option>
              <option value="3">C_대표이사</option>
              <option value="4">C_인사팀장</option>
              <option value="5">C_인사사원</option>
              <option value="6">C_회계팀장</option>
              <option value="7">C_마케팅팀장</option>
              <option value="8">C_개발팀장</option>
              <option value="9">C_사원</option>
              <option value="10">C_공장장</option>
              <option value="11">C_품질관리팀장</option>
              <option value="12">C_생산관리팀장</option>
              <option value="13">C_생산직 사원</option>
              <option value="14">B_점장</option>
              <option value="15">B_매니저</option>
              <option value="16">B_바리스타</option>
              <option value="17">B_주방직원</option>
              <option value="18">B_홀서빙</option>
            </select>
            <div class="text-wrapper-5">직무</div>
          </div>
          <div class="group-4">
            <div class="text-wrapper-6">소속(필수)</div>
            <select class="rectangle" name="businessNo" required>
              <option value="">소속을 선택하세요</option>
              <option value="1">YEAST본사</option>
              <option value="2">서울 강남점</option>
              <option value="3">서울 홍대점</option>
              <option value="4">서울 종로점</option>
              <option value="5">서울 잠실점</option>
            </select>
          </div>
          <div class="group-5">
            <input class="rectangle" type="text" name="managerNo">
            <div class="text-wrapper-6">사수(선택)</div>
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
                <input class="rectangle-2" type="text" value="${m.userName}" name="userName" required></input>
                <p class="div-2"><span class="span">이름</span> <span class="text-wrapper-4">(필수)</span></p>
              </div>
            </div>
            <div class="group-9">
              <p class="div-3"><span class="span">아이디</span> <span class="text-wrapper-4">(필수)</span></p>
              <div class="id-check-container">
                <input class="rectangle-3 with-button" type="text" value="${m.userId}" name="userId" required></input>
                <button type="button" class="id-check-button">중복확인</button>
              </div>
              <div class="idCheckMessage" id="idCheckMessage" style="margin-top: 10px; font-size: 12px; padding-left: 180px"></div>
            </div>
            <div class="group-9">
              <input class="rectangle-3" type="password" value="${m.userPwd}" name="userPwd" required></input>
              <p class="div-3"><span class="span">비밀번호</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-9">
              <input class="rectangle-3" type="password" name="confirm-password" required></input>
              <p class="div-3"><span class="span">비밀번호 확인</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
          </div>
          <div class="frame-5">
            <div class="group-10">
              <div class="email-check-container">
                <input class="rectangle-3 with-button" type="email" value="${m.email}" name="email" required></input>
                <button type="button" class="email-check-button">중복확인</button>
              </div>
              <div id="emailCheckMessage" style="margin-top: 10px; font-size: 12px; padding-left: 180px"></div>
              <p class="div-4"><span class="span">이메일</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-11">
              <input class="rectangle-3" type="date" value="${m.birthday}" name="birthday" required></input>
              <p class="div-3"><span class="span">생년월일</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-11">
              <input class="rectangle-3" type="text" value="${m.phone}" name="phone" required></input>
              <p class="div-3"><span class="span">전화번호</span> <span class="text-wrapper-4">(필수)</span></p>
            </div>
            <div class="group-11">
              <input class="rectangle-3" type="text" value="${m.address}" name="address" required></input>
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
</body>
</html>
