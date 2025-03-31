<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>YEAST 회원가입</title>
    <link rel="stylesheet" href="css/agree/style.css" />
    <link rel="stylesheet" href="css/agree/styleguide.css" />
    <link rel="stylesheet" href="css/agree/global.css" />
    <script>
        function toggleAllTerms(source) {
            let checkboxes = document.querySelectorAll('.outline-interface');
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
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
            <form id="registrationForm">
                <div class="frame-2">
                    <div class="group-3">
                        <select class="gender" required>
                            <option value="male">남</option>
                            <option value="female">여</option>
                        </select>
                        <p class="p"><span class="span">성별</span> <span class="text-wrapper-4">(필수)</span></p>
                    </div>
                    <div class="group-3">
                        <input class="rectangle" type="text" name="job"></input>
                        <div class="text-wrapper-5">직무</div>
                    </div>
                    <div class="group-4">
                        <div class="text-wrapper-6">소속 사업장(필수)</div>
                        <select class="gender" required>
                            <option value="male">가맹점</option>
                            <option value="female">회사</option>
                        </select>
                    </div>
                    <div class="group-5">
                        <input class="rectangle" type="text" name="supervisor" required></input>
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
                                <input class="rectangle-2" type="text" name="name" required></input>
                                <p class="div-2"><span class="span">이름</span> <span class="text-wrapper-4">(필수)</span></p>
                            </div>
                        </div>
                        <div class="group-9">
                            <input class="rectangle-3" type="text" name="id" required></input>
                            <p class="div-3"><span class="span">아이디</span> <span class="text-wrapper-4">(필수)</span></p>
                        </div>
                        <div class="group-9">
                            <input class="rectangle-3" type="password" name="password" required></input>
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
                            <input class="rectangle-3" type="date" name="birth-date" required></input>
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

            reader.onload = function(e) {
                profileImage.src = e.target.result;
                profileImage.classList.remove('default-image');
                profileImage.alt = '프로필 사진';
            };

            reader.readAsDataURL(file);
        }
    });

    // 폼 제출 이벤트 처리
    registrationForm.addEventListener('submit', function(event) {
        event.preventDefault(); // 기본 제출 동작 방지

        // 비밀번호 일치 확인
        const password = document.querySelector('input[name="password"]').value;
        const confirmPassword = document.querySelector('input[name="confirm-password"]').value;

        if (password !== confirmPassword) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }

        // 여기에 실제 폼 제출 로직 추가 (예: AJAX 요청)
        alert('회원가입 양식이 제출되었습니다.');
    });
</script>
</body>
</html>