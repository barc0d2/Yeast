<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/company/bread/detail/globals.css" />
    <link rel="stylesheet" href="/css/company/bread/detail/style.css" />
    <link rel="stylesheet" href="/css/company/bread/detail/styleguide.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  </head>
  <body>
    <div class="main">
      <div class="container">
        <header class="header">
          <p class="left-line">
            <span class="text-wrapper">메뉴 상세내용<br /></span>
            <span class="span">고객에게 서비스할 새로운 메뉴를 등록합니다. </span>
          </p>
          <div class="right-line">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 메뉴 상세내용</div>
        </header>
        <div class="form">
          <div>
            <img id="thumbnail" class="image" src="${bread.imageChange}">
          </div>
          <div class="column">
            <div class="list">
              <div class="div">
                <p class="p"><span class="text-wrapper-2">메뉴 종류</span> <span class="text-wrapper-3">*</span></p>
                <div class="select">
                  <select name="categoryNo" class="el" disabled>
                      <option value="${bread.categoryNo}">${bread.categoryName}</option>
                  </select>
                </div>
              </div>
              <div class="div">
                <p class="p"><span class="text-wrapper-2">메뉴 이름</span> <span class="text-wrapper-3">*</span></p>
                <div class="menu-name"><input value="${bread.breadName}" class="text-wrapper-4" readonly/></div>
              </div>
              <div class="div">
                <p class="p"><span class="text-wrapper-2">가격</span> <span class="text-wrapper-3">*</span></p>
                <div class="div-2">
                  <input name="price" class="text-wrapper-4" readonly value="${bread.price}"/>
                  <div class="text-wrapper-4">원</div>
                </div>
              </div>
              <div class="menu-descript">
                <div class="menu-descript-2">메뉴 설명</div>
                <div class="menu-description">
                  <textarea class="text-wrapper-5" style="border: none; resize: none" readonly>${bread.breadContent}</textarea>
                </div>
              </div>
            </div>
            <div class="column-2">
              <div class="list-2">
                <div class="div">
                  <div class="text-wrapper-6">메뉴 칼로리</div>
                  <div class="div-2">
                    <input class="text-wrapper-4" readonly value="${bread.calories}"/>
                    <div class="text-wrapper-4">kcal</div>
                  </div>
                </div>
                <div class="menu-info">
                  <div class="menu-info-2">메뉴 알레르기 정보</div>
                  <div class="info"><textarea class="text-wrapper-5" readonly>${bread.allergy}</textarea></div>
                </div>
                <div class="sale-status">
                  <div class="text-wrapper-6">판매여부</div>
                  <div class="form-check form-switch">
                    <c:choose>
                      <c:when test="${bread.status == 1}">
                        <input class="form-check-input" type="checkbox" role="switch" style="width: 70px; height: 30px" id="flexSwitchCheckChecked" name="status" value="1" checked readonly>
                      </c:when>
                      <c:otherwise>
                        <input class="form-check-input" type="checkbox" role="switch" style="width: 70px; height: 30px" id="flexSwitchCheckChecked" name="status" value="0" readonly>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </div>
              <div></div>
              <div class="end">
                <button class="update-btn" type="button" onclick="location.href='/company/bread/updateForm?breadNo=${bread.breadNo}'"><div class="text-wrapper-7">수정</div></button>
                <button class="update-btn" onclick="location.href='/company/bread/list'"><div class="text-wrapper-7">이전</div></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
