<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.kh.yeast.domain.vo.Member" %>
<%
  Member member = (Member) request.getAttribute("member");
%>

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
        <input type="text" name="name" id="name" class="blank" value="${member.userName}" />
      </div>
      <div class="div">
        <p class="p"><span class="span">아이디&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="userId" id="userId" class="blank" value="${member.userId}" />
      </div>
    </div>
    <div class="column-2">
      <div class="div">
        <p class="p"><span class="span">비밀번호&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="password" name="password" id="password" class="blank" value="${member.userPwd}"/>
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
        <input type="date" name="birthdate" id="birthdate" class="blank" value="${member.birthday}" />
      </div>
      <div class="div-2">
        <p class="p"><span class="span">직무&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="address" id="position" class="blank-2" value="${member.positionName}" />
      </div>
      <div class="div-2">
        <p class="p"><span class="span">부서&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="address" id="business" class="blank-2" value="${member.businessName}" />
      </div>
      <div class="div-2">
        <p class="p"><span class="span">성별&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
        <input type="text" name="address" id="gender" class="blank-2" value="${member.gender}" />
      </div>
      <div class="div-2">
        <p class="p"><span class="span">사수&nbsp;&nbsp;</span> <span class="span">(이름)</span></p>
        <input type="text" name="manager" id="manager" class="blank-2" value="${member.managerName}" readonly/>
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
      birthday: document.getElementById("birthday").value,
      positionName: document.getElementById("positionName").value,
      businessName: document.getElementById("businessName").value,
      gender: document.getElementById("gender").value,
      managerName: document.getElementById("managerName").value
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
