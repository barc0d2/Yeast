<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>YEAST 회원가입</title>
  <link rel="stylesheet" href="/css/agree/global.css" />
  <link rel="stylesheet" href="/css/agree/style.css" />
  <link rel="stylesheet" href="/css/agree/styleguide.css" />

  <style>
    .popup {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.5);
      z-index: 1000;
      justify-content: center;
      align-items: center;
    }

    .popup-content {
      background-color: white;
      padding: 30px;
      border-radius: 10px;
      max-width: 500px;
      width: 90%;
      max-height: 80vh;
      overflow-y: auto;
      position: relative;
    }

    .popup-close {
      position: absolute;
      top: 10px;
      right: 10px;
      font-size: 24px;
      background: none;
      border: none;
      cursor: pointer;
    }
  </style>

  <script>
    function toggleAllTerms(source) {
      let checkboxes = document.querySelectorAll('.outline-interface');
      checkboxes.forEach(checkbox => checkbox.checked = source.checked);
      updateNextButton();
    }

    function updateNextButton() {
      const allCheckboxes = document.querySelectorAll('.outline-interface');
      const allChecked = Array.from(allCheckboxes).every(checkbox => checkbox.checked);
      const nextButton = document.querySelector('.next-button');
      nextButton.disabled = !allChecked;
      nextButton.style.opacity = allChecked ? '1' : '0.5';
      
      // 전체 동의 체크박스 상태 업데이트
      const allAgreeCheckbox = document.getElementById('all-agree');
      if (allAgreeCheckbox) {
        allAgreeCheckbox.checked = allChecked;
      }
    }

    // 체크박스 변경 시 다음 버튼 상태 업데이트
    document.addEventListener('DOMContentLoaded', function() {
      // 다음 버튼 초기 상태 설정
      updateNextButton();
      
      // 개별 체크박스 이벤트 리스너 설정
      document.querySelectorAll('.outline-interface').forEach(checkbox => {
        checkbox.addEventListener('change', function() {
          updateNextButton();
        });
      });
      
      // 다음 버튼 클릭 이벤트
      document.querySelector('.next-button').addEventListener('click', function() {
        const allCheckboxes = document.querySelectorAll('.outline-interface');
        const allChecked = Array.from(allCheckboxes).every(checkbox => checkbox.checked);
        
        if (!allChecked) {
          alert('모든 약관에 동의해주세요.');
          return;
        }
        
        // 모든 약관에 동의한 경우 회원가입 페이지로 이동
        window.location.href = '/member/register';
      });
    });

    function openPopup(content) {
      const popupContent = document.getElementById('popupContent');
      popupContent.innerHTML = getTermsContent(content);
      const popup = document.getElementById('termsPopup');
      popup.style.display = 'flex';
    }

    function closePopup() {
      const popup = document.getElementById('termsPopup');
      popup.style.display = 'none';
    }

    function getTermsContent(type) {
      const termsContent = {
        '제1조 (목적)': `
            <h2>이용약관 동의</h2>
            <p>제1조 (목적)</p>
            <p>본 약관은 YEAST(이하 "회사")가 제공하는 ERP 시스템(이하 "서비스")의 이용과 관련하여 회사와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.</p>
            <h3>제2조 (서비스 이용)</h3>
            <ol>
              <li>이용자는 본 서비스를 업무 목적으로만 사용해야 합니다.</li>
              <li>서비스 이용 시 관련 법령 및 본 약관을 준수해야 합니다.</li>
            </ol>
            <h3>제3조 (약관 동의 및 변경)</h3>
            <ol>
              <li>이용자는 본 약관에 동의해야 서비스를 이용할 수 있습니다.</li>
              <li>회사는 필요 시 약관을 개정할 수 있으며, 변경된 약관은 공지사항을 통해 공지됩니다.</li>
            </ol>
            <h3>제4조 (책임의 제한)</h3>
            <ol>
              <li>회사는 천재지변, 시스템 장애 등의 불가항력적 사유로 인한 서비스 장애에 대해 책임을 지지 않습니다.</li>
            </ol>
          `,
        '전자금융거래': `
            <h2>전자금융거래 이용약관</h2>
            <p>전자금융거래 이용약관 전문 내용입니다. 온라인 금융 서비스 이용에 관한 세부 규정을 설명합니다.</p>
            <h3>주요 내용</h3>
            <ol>
              <li>전자금융거래의 정의와 범위</li>
              <li>전자금융거래 서비스 이용 조건</li>
              <li>보안 및 개인정보 보호 규정</li>
              <li>분쟁 해결 절차</li>
            </ol>
          `,
        '개인정보': `
            <h2>개인정보 수집 및 이용 동의</h2>
            <p>개인정보 수집 및 이용에 관한 상세 내용입니다. 개인정보의 수집 목적, 항목, 보유 및 이용 기간 등을 명시합니다.</p>
            <h3>수집하는 개인정보 항목</h3>
            <ul>
              <li>성명</li>
              <li>연락처</li>
              <li>이메일 주소</li>
              <li>기타 회원가입에 필요한 정보</li>
            </ul>
            <h3>개인정보 이용 목적</h3>
            <ol>
              <li>서비스 제공 및 계약 이행</li>
              <li>고객 상담 및 민원 처리</li>
              <li>마케팅 및 광고에 활용</li>
            </ol>
          `,
        '제3자 제공': `
            <h2>개인정보 제3자 제공 동의</h2>
            <p>개인정보 제3자 제공에 관한 상세 내용입니다. 제공받는 자, 제공 목적, 제공 항목 등을 설명합니다.</p>
            <h3>제3자 제공 내역</h3>
            <table style="width:100%; border-collapse: collapse;">
              <thead>
                <tr>
                  <th style="border: 1px solid #ddd; padding: 8px;">제공받는 자</th>
                  <th style="border: 1px solid #ddd; padding: 8px;">제공 목적</th>
                  <th style="border: 1px solid #ddd; padding: 8px;">제공 항목</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td style="border: 1px solid #ddd; padding: 8px;">서비스 제휴사</td>
                  <td style="border: 1px solid #ddd; padding: 8px;">서비스 개선</td>
                  <td style="border: 1px solid #ddd; padding: 8px;">성명, 연락처</td>
                </tr>
              </tbody>
            </table>
          `
      };
      return termsContent[type] || '<p>약관 내용을 불러올 수 없습니다.</p>';
    }
  </script>
</head>
<body>
<main class="register">
  <div class="overlap-group-wrapper">
    <div class="overlap-group">
      <section class="agreement-frame">
        <header class="welcome">
          <h1 class="text-wrapper">Welcome to YEAST..!</h1>
          <nav class="agreement-button">
            <div class="frame">
              <button class="button"><span class="div">이용약관</span></button>
              <span class="text-wrapper-2">회원가입</span>
            </div>
          </nav>
        </header>
        <section class="first-agreement">
          <h2 class="text-wrapper-3">YEAST ERP 이용약관</h2>
          <p class="p">서비스 이용을 위해 아래 이용약관 및 정보이용에 동의해 주세요.</p>
        </section>
        <form class="all-agreement">
          <div class="frame-wrapper">
            <label class="div-wrapper">
              <div class="frame-2">
                <input type="checkbox" id="all-agree" onclick="toggleAllTerms(this)" />
                <span class="text-wrapper-4">전체 동의</span>
              </div>
            </label>
          </div>
          <div class="frame-3">
            <label class="div-wrapper">
              <div class="frame-2">
                <input type="checkbox" id="terms-agree" class="outline-interface" />
                <span class="text-wrapper-4">이용약관 동의</span>
              </div>
            </label>
            <button type="button" class="detail-view-btn" onclick="openPopup('제1조 (목적)')">상세보기</button>
          </div>
          <div class="frame-3">
            <label class="frame-4">
              <div class="frame-2">
                <input type="checkbox" id="financial-agree" class="outline-interface" />
                <span class="text-wrapper-5">전자금융거래 이용약관 동의</span>
              </div>
            </label>
            <button type="button" class="detail-view-btn" onclick="openPopup('전자금융거래')">상세보기</button>
          </div>
          <div class="frame-3">
            <label class="div-wrapper">
              <div class="frame-2">
                <input type="checkbox" id="privacy-agree" class="outline-interface" />
                <span class="text-wrapper-6">개인정보 수집 및 이용 동의</span>
              </div>
            </label>
            <button type="button" class="detail-view-btn" onclick="openPopup('개인정보')">상세보기</button>
          </div>
          <div class="frame-3">
            <label class="frame-5">
              <div class="frame-2">
                <input type="checkbox" id="third-party-agree" class="outline-interface" />
                <span class="text-wrapper-7">개인정보 제3자 제공 동의</span>
              </div>
            </label>
            <button type="button" class="detail-view-btn" onclick="openPopup('제3자 제공')">상세보기</button>
          </div>
        </form>
        <button type="button" class="next-button" disabled><span class="text-wrapper-8">다음</span></button>
      </section>
      <div class="view">
        <img class="logo" src="/images/logo.png" alt="YEAST 로고" />
        <img class="img" src="/images/logo3.png" alt="YEAST ERP 로고" />
      </div>
    </div>
  </div>
</main>

<!-- 팝업 -->
<div id="termsPopup" class="popup">
  <div class="popup-content">
    <button class="popup-close" onclick="closePopup()">&times;</button>
    <div id="popupContent"></div>
  </div>
</div>

<script>
  // 페이지 로드 시 초기화
  document.addEventListener('DOMContentLoaded', function() {
    // 다음 버튼 초기 상태 설정
    updateNextButton();
    
    // 다음 버튼 클릭 이벤트
    document.querySelector('.next-button').addEventListener('click', function() {
      const allCheckboxes = document.querySelectorAll('.outline-interface');
      const allChecked = Array.from(allCheckboxes).every(checkbox => checkbox.checked);
      
      if (!allChecked) {
        alert('모든 약관에 동의해주세요.');
        return;
      }
      
      // 모든 약관에 동의한 경우 회원가입 페이지로 이동
      window.location.href = '/member/register';
    });
  });
</script>
</body>
</html>