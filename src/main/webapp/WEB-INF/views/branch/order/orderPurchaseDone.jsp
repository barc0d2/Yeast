<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/order/orderPurchaseDone/style.css" />
    <link rel="stylesheet" href="/css/order/orderPurchaseDone/global.css" />
    <link rel="stylesheet" href="/css/order/orderPurchaseDone/styleguide.css" />
  <body>
    <div class="screen">
      <div class="content">
        <div class="purchase-complete"><div class="add-product-btn">결제 완료</div></div>
        <div class="column">
          <div class="basic-info">기본 정보</div>
          <div class="list">
            <div class="div">
              <p class="line"><span class="text-wrapper">*</span> <span class="span">발주자</span></p>
              <div class="name"><div class="text-wrapper-2">호원준</div></div>
            </div>
            <div class="div">
              <div class="line-2">*납입예정일</div>
              <div class="date">
                <div class="text-wrapper-2">2025-03-19</div>
                <img class="image" src="../../../../resources/uploadfile/image/orderManagement/calendar.png" />
              </div>
            </div>
            <div class="manager">
              <div class="line-2">*담당자</div>
              <div class="name-wrapper"><div class="text-wrapper-2">호원준</div></div>
            </div>
            <div class="btn">
              <div class="div-wrapper">
                <div class="text"><div class="confirm">빵 품목 확인</div></div>
              </div>
              <div class="div-wrapper">
                <div class="text"><div class="back">이전으로</div></div>
              </div>
            </div>
          </div>
        </div>
        <div class="back-btn-wrapper"><div class="back-btn">이전</div></div>
        <div class="cancel"><div class="purchase-cancel-btn">결제 취소</div></div>
        <div class="frame">
          <div class="body">
            <div class="select">
              <div class="product-name">
                <div class="client-name">품명</div>
                <img class="vector" src="../../../../resources/uploadfile/image/orderBreadListPopUp/Vector-underarrow.png" />
              </div>
              <div class="product-amount">
                <div class="client-name-2">구매개수</div>
                <img class="img" src="../../../../resources/uploadfile/image/orderBreadListPopUp/Vector-underarrow.png" />
              </div>
            </div>
            <div class="table">
              <div class="label">
                <div class="text-wrapper-3">회사명</div>
                <div class="text-wrapper-4">빵 종류</div>
                <div class="text-wrapper-5">빵이름</div>
                <div class="amount">갯수</div>
                <div class="text-wrapper-3">구매가격</div>
                <div class="delete-btn">삭제</div>
              </div>
              <div class="row">
                <div class="company">아스트</div>
                <div class="text-wrapper-4">소금빵</div>
                <div class="text-wrapper-5">사과소금빵</div>
                <div class="amount-2">50</div>
                <div class="price">50,000</div>
                <div class="delete">
                  <div class="delete-btn-2">삭제</div>
                  <div class="delete-image">
                    <img
                      class="recycle-bin-remove"
                      src="../../../../resources/uploadfile/image/delete/delete-image.png"
                    />
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="company">이스트</div>
                <div class="text-wrapper-4">단팥빵</div>
                <div class="text-wrapper-5">앙금단팥빵</div>
                <div class="amount">50</div>
                <div class="price-2">50,000</div>
                <div class="delete">
                  <div class="delete-btn-2">삭제</div>
                  <div class="delete-image">
                    <img
                      class="recycle-bin-remove"
                      src="../../../../resources/uploadfile/image/delete/delete-image.png"
                    />
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="company">이스트</div>
                <div class="text-wrapper-4">오금빵</div>
                <div class="text-wrapper-5">오금지린빵</div>
                <div class="amount">50</div>
                <div class="price-2">50,000</div>
                <div class="delete">
                  <div class="delete-btn-2">삭제</div>
                  <div class="delete-image">
                    <img
                      class="recycle-bin-remove"
                      src="../../../../resources/uploadfile/image/delete/delete-image.png"
                    />
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="company">이스트</div>
                <div class="text-wrapper-4">호두빵</div>
                <div class="text-wrapper-5">호두과자빵</div>
                <div class="amount">50</div>
                <div class="price-2">50,000</div>
                <div class="delete">
                  <div class="delete-btn-2">삭제</div>
                  <div class="delete-image">
                    <img class="recycle-bin-remove" src="../../../../resources/uploadfile/image/delete/delete-image.png" />
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="company">이스트</div>
                <div class="text-wrapper-4">슈크림빵</div>
                <div class="text-wrapper-3">슈바슈크림빵</div>
                <div class="amount">50</div>
                <div class="price-2">50,000</div>
                <div class="delete">
                  <div class="delete-btn-2">삭제</div>
                  <div class="delete-image">
                    <img
                      class="recycle-bin-remove"
                      src="../../../../resources/uploadfile/image/delete/delete-image.png"
                    />
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="company">이스트</div>
                <div class="text-wrapper-4">초코빵</div>
                <div class="text-wrapper-5">소라초코빵</div>
                <div class="amount-2">50</div>
                <div class="price">50,000</div>
                <div class="delete">
                  <div class="delete-btn-2">삭제</div>
                  <div class="delete-image"><img class="recycle-bin-remove" src="../../../../resources/uploadfile/image/delete/delete-image.png" /></div>
                </div>
              </div>
            </div>
          </div>
          <div class="total">
            <div class="total-amount-wrapper"><div class="total-amount">총 수량 350개</div></div>
            <div class="total-amount-wrapper"><div class="total-amount">총 발주 금액 350,000원</div></div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
