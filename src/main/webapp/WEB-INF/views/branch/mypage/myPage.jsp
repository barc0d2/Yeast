<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="../../css/global/bmyPage.css" />
  <link rel="stylesheet" href="../../css/styleguide/bmyPage.css" />
  <link rel="stylesheet" href="../../css/style/bmyPage.css" />
</head>
<body>
<div class="main">
  <div class="container">
    <div class="column">
      <div class="image">
        <div class="insert-photo">
          <div class="frame">
            <img class="plus-circle-fill" src="/resources/uploadfile/image/myPage/plus-image.png" />
          </div>
          <div id="previewContainer" class="insert-photo"></div>
        </div>
        <div class="inser-new-img">
          <div class="new-img">새 이미지 첨부</div>
          <input type="file" id="fileInput" style="display: none;" multiple />
        </div>
      </div>
      <div class="div">
        <p class="p"><span class="span">이메일&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="email" name="email" id="email" class="blank" value="${member.email}" />
      </div>
      <div class="div">
        <p class="p"><span class="span">이름&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="name" id="name" class="blank" value="${member.name}" />
      </div>
      <div class="div">
        <p class="p"><span class="span">아이디&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="userId" id="userId" class="blank" value="${member.userId}" disabled />
      </div>
    </div>
    <div class="column-2">
      <div class="div">
        <p class="p"><span class="span">비밀번호&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="password" name="password" id="password" class="blank" />
      </div>
      <div class="div">
        <p class="p"><span class="span">주소&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="address" id="address" class="blank" value="${member.address}" />
      </div>
      <div class="div">
        <p class="p"><span class="span">전화번호&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="phone" id="phone" class="blank" value="${member.phone}" />
      </div>
      <div class="div">
        <p class="p"><span class="span">생년월일&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="date" name="birthdate" id="birthdate" class="blank" value="${member.birthdate}" />
      </div>
      <div class="div-2">
        <div class="text-wrapper-2">직무</div>
        <select name="position" class="blank-2">
          <option value="회장" <%= "회장".equals(member.position) ? "selected" : "" %>>회장</option>
          <option value="사장" <%= "사장".equals(member.position) ? "selected" : "" %>>사장</option>
          <option value="대표이사" <%= "대표이사".equals(member.position) ? "selected" : "" %>>대표이사</option>
          <option value="인사팀장" <%= "인사팀장".equals(member.position) ? "selected" : "" %>>인사팀장</option>
          <option value="인사사원" <%= "인사사원".equals(member.position) ? "selected" : "" %>>인사사원</option>
          <option value="회계팀장" <%= "회계팀장".equals(member.position) ? "selected" : "" %>>회계팀장</option>
          <option value="개발팀장" <%= "개발팀장".equals(member.position) ? "selected" : "" %>>개발팀장</option>
          <option value="공장장" <%= "공장장".equals(member.position) ? "selected" : "" %>>공장장</option>
          <option value="생산관리팀장" <%= "생산관리팀장".equals(member.position) ? "selected" : "" %>>생산관리팀장</option>
          <option value="점장" <%= "점장".equals(member.position) ? "selected" : "" %>>점장</option>
          <option value="마케팅팀장" <%= "마케팅팀장".equals(member.position) ? "selected" : "" %>>마케팅팀장</option>
          <option value="사원" <%= "사원".equals(member.position) ? "selected" : "" %>>사원</option>
          <option value="품질관리팀장" <%= "품질관리팀장".equals(member.position) ? "selected" : "" %>>품질관리팀장</option>
          <option value="생산직 사원" <%= "생산직 사원".equals(member.position) ? "selected" : "" %>>생산직 사원</option>
          <option value="매니저" <%= "매니저".equals(member.position) ? "selected" : "" %>>매니저</option>
          <option value="바리스타" <%= "바리스타".equals(member.position) ? "selected" : "" %>>바리스타</option>
          <option value="주방직원" <%= "주방직원".equals(member.position) ? "selected" : "" %>>주방직원</option>
          <option value="홀서빙" <%= "홀서빙".equals(member.position) ? "selected" : "" %>>홀서빙</option>
        </select>
      </div>
      <div class="div-2">
        <div class="text-wrapper-2">부서</div>
        <select name="business" class="blank-2">
          <option value="본사" <%= "본사".equals(member.business) ? "selected" : "" %>>본사</option>
          <option value="강남점" <%= "강남점".equals(member.business) ? "selected" : "" %>>강남점</option>
          <option value="홍대점" <%= "홍대점".equals(member.business) ? "selected" : "" %>>홍대점</option>
          <option value="종로점" <%= "종로점".equals(member.business) ? "selected" : "" %>>종로점</option>
          <option value="잠실점" <%= "잠실점".equals(member.business) ? "selected" : "" %>>잠실점</option>
        </select>
      </div>
      <div class="div-2">
        <div class="gender">성별</div>
        <select name="gender" class="blank-2">
          <option value="남" <%= "남".equals(member.gender) ? "selected" : "" %>>남자</option>
          <option value="여" <%= "여".equals(member.gender) ? "selected" : "" %>>여자</option>
        </select>
      </div>
      <div class="div-2">
        <p class="p"><span class="span">사수&nbsp;&nbsp;</span> <span class="span">(이름)</span></p>
        <input type="text" name="manager" id="manager" class="blank-2" value="${managerName.name}" readonly/>
      </div>
    </div>
  </div>
  <div class="save-btn">
    <div class="text-wrapper-3" onclick="saveChanges()">저장</div>
  </div>
  <div class="edit-btn" onclick="click()">
    <a href="/branch/mypage/myPagePopUp">
      <div class="text-wrapper-3">수정</div>
    </a>
  </div>
</div>

<script>
  function saveChanges() {
    const formData = {
      email: document.getElementById("email").value,
      name: document.getElementById("name").value,
      userId: document.getElementById("userId").value,
      password: document.getElementById("password").value,
      address: document.getElementById("address").value,
      phone: document.getElementById("phone").value,
      birthdate: document.getElementById("birthdate").value,
      position: document.getElementById("position").value,
      business: document.getElementById("business").value,
      gender: document.getElementById("gender").value
    };

    console.log("Updated Information:", formData);
    alert("정보가 업데이트되었습니다.");
  }

  document.getElementById("fileInput").addEventListener("change", function (event) {
    let files = event.target.files;
    let previewContainer = document.getElementById("previewContainer");
  });
</script>
<jsp:include page="whiteSideBar.jsp"/>
<jsp:include page="whiteTopBar.jsp"/>
</body>
</html>
