<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="/css/global/cmyPagePopUp.css" />
  <link rel="stylesheet" href="/css/style/cmyPagePopUp.css" />
  <link rel="stylesheet" href="/css/styleguide/cmyPagePopUp.css" />
</head>
<body>

<%
  String userId = (String) session.getAttribute("userId");
  String email = (String) session.getAttribute("email");
  String name = (String) session.getAttribute("name");
  String address = (String) session.getAttribute("address");
  String phone = (String) session.getAttribute("phone");
  String birthdate = (String) session.getAttribute("birthdate");
  String gender = (String) session.getAttribute("gender");
  String position = (String) session.getAttribute("position");
  String business = (String) session.getAttribute("business");
  String managerName = (String) session.getAttribute("managerName");
%>

<div class="a">
  <div class="mypage-edit-wrapper">
    <div class="mypage-edit">
      <div class="main">
        <a href="/branch/mypage/myPage">
          <div class="save-cloe">
            <div class="save-close">저장 후 닫기</div>
          </div>
        </a>
        <div class="container">
          <div class="column">
            <div class="image">
              <div class="insert-photo">
                <div class="frame"><img class="plus-circle-fill" src="/resources/uploadfile/image/myPage/plus-image.png" /></div>
                <div id="previewContainer" class="insert-photo"></div>
              </div>
              <div class="inser-new-img">
                <div class="new-img">새 이미지 첨부</div>
                <input type="file" id="fileInput" style="display: none;" multiple />
              </div>
            </div>
            <div class="div">
              <p class="p"><span class="span">이메일&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <input type="email" id="email" class="blank" value="<%= email != null ? email : "" %>" />
            </div>
            <div class="div">
              <p class="p"><span class="span">이름&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <input type="text" id="name" class="blank" value="<%= name != null ? name : "" %>" />
            </div>
            <div class="div">
              <p class="p"><span class="span">아이디&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <input type="text" id="userId" class="blank" value="<%= userId != null ? userId : "" %>" />
            </div>
          </div>
          <div class="column-2">
            <div class="div">
              <p class="p"><span class="span">비밀번호&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <input type="password" id="password" class="blank" />
            </div>
            <div class="div">
              <p class="p"><span class="span">주소&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <input type="text" id="address" class="blank" value="<%= address != null ? address : "" %>" />
            </div>
            <div class="div">
              <p class="p"><span class="span">전화번호&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <input type="text" id="phone" class="blank" value="<%= phone != null ? phone : "" %>" />
            </div>
            <div class="div">
              <p class="p"><span class="span">생년월일&nbsp;&nbsp;</span> <span class="span">(필수)</span></p>
              <div class="blank">
                <input type="date" name="birthdate" id="birthdate" class="blank" value="<%= birthdate != null ? birthdate : "" %>" />
              </div>
            </div>
            <div class="div-2">
              <div class="text-wrapper-2">직무</div>
              <select id="position" class="blank-2">
                <option value="">직무 선택</option>
                <option value="매니저" <%= "매니저".equals(position) ? "selected" : "" %>>매니저</option>
                <option value="직원" <%= "직원".equals(position) ? "selected" : "" %>>직원</option>
              </select>
            </div>
            <div class="div-2">
              <div class="text-wrapper-2">부서</div>
              <select id="business" class="blank-2">
                <option value="선택">선택</option>
                <option value="본사" <%= "본사".equals(business) ? "selected" : "" %>>본사</option>
                <option value="강남점" <%= "강남점".equals(business) ? "selected" : "" %>>강남점</option>
                <option value="홍대점" <%= "홍대점".equals(business) ? "selected" : "" %>>홍대점</option>
                <option value="종로점" <%= "종로점".equals(business) ? "selected" : "" %>>종로점</option>
                <option value="잠실점" <%= "잠실점".equals(business) ? "selected" : "" %>>잠실점</option>
              </select>
            </div>
            <div class="div-2">
              <div class="gender">성별</div>
              <select id="gender" class="blank-2">
                <option value="남" <%= "남".equals(gender) ? "selected" : "" %>>남자</option>
                <option value="여" <%= "여".equals(gender) ? "selected" : "" %>>여자</option>
              </select>
            </div>
            <div class="div-2">
              <p class="p"><span class="span">사수&nbsp;&nbsp;</span> <span class="span">(이름)</span></p>
              <input type="text" name="manager" id="manager" class="blank-2" value="<%= request.getAttribute("managerName") != null ? request.getAttribute("managerName") : "" %>" readonly/>
            </div>
          </div>
        </div>
        <div class="div-wrapper">
          <div id="updateBtn" class="text-wrapper-3">마이페이지 수정</div>
        </div>
      </div>
      <div class="logo">
        <img class="logo-2" src="../../../../resources/uploadfile/image/logo/logo%201.png" />
        <img class="logo-3" src="../../../../resources/uploadfile/image/logo/logo2%201.png" />
      </div>
    </div>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const businessSelect = document.getElementById("business");
    const positionSelect = document.getElementById("position");

    const positions = {
      "본사": ["회장", "사장", "대표이사", "인사팀장", "인사사원", "회계팀장", "개발팀장", "공장장", "생산관리팀장", "점장"],
      "강남점": ["마케팅팀장", "사원", "품질관리팀장", "생산직 사원", "매니저", "바리스타", "주방직원", "홀서빙"],
      "홍대점": ["마케팅팀장", "사원", "품질관리팀장", "생산직 사원", "매니저", "바리스타", "주방직원", "홀서빙"],
      "종로점": ["마케팅팀장", "사원", "품질관리팀장", "생산직 사원", "매니저", "바리스타", "주방직원", "홀서빙"],
      "잠실점": ["마케팅팀장", "사원", "품질관리팀장", "생산직 사원", "매니저", "바리스타", "주방직원", "홀서빙"]
    };

    businessSelect.addEventListener("change", function () {
      const selectedBusiness = businessSelect.value;

      // 직무 선택 초기화
      positionSelect.innerHTML = "<option value=''>직무 선택</option>";

      const relevantPositions = positions[selectedBusiness] || positions["강남점", "홍대점", "종로점", "잠실점"];

      relevantPositions.forEach(function (position) {
        let option = document.createElement("option");
        option.value = position;
        option.textContent = position;
        positionSelect.appendChild(option);
      });
    });

    businessSelect.dispatchEvent(new Event("change"));
  });


  document.getElementById("updateBtn").addEventListener("click", function() {
    let formData = {
      userId: document.getElementById("userId").value,
      email: document.getElementById("email").value,
      name: document.getElementById("name").value,
      address: document.getElementById("address").value,
      phone: document.getElementById("phone").value,
      birthdate: document.getElementById("birthdate").value,
      gender: document.getElementById("gender").value,
      position: document.getElementById("position").value,
      business: document.getElementById("business").value
    };
    console.log("업데이트된 데이터:", formData);

    fetch("/updateUser", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(formData)
    })
            .then(response => response.json())
            .then(data => {
              if (data.success) {
                alert("정보가 업데이트되었습니다.");
                window.location.href = "/branch/mypage/myPage";
              } else {
                alert("정보 수정에 실패했습니다.");
              }
            })
            .catch(error => {
              alert("서버 오류 발생");
            });
  });

  document.querySelector(".inser-new-img").addEventListener("click", function () {
    document.getElementById("fileInput").click();
  });

  document.getElementById("fileInput").addEventListener("change", function (event) {
    let files = event.target.files;
    let previewContainer = document.getElementById("previewContainer");

    previewContainer.innerHTML = "";

    for (let file of files) {
      let reader = new FileReader();
      reader.onload = function (e) {
        let img = document.createElement("img");
        img.src = e.target.result;
        img.classList.add("preview-img");
        previewContainer.appendChild(img);
      };
      reader.readAsDataURL(file);
    }
  });
</script>

</body>
</html>
