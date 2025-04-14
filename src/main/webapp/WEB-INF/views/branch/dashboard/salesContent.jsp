<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="body">
    <div class="inbody">
        <article class="branch">
            <header class="title">
                <h2 class="text-wrapper-12">금일 판매내역</h2>
            </header>
            <div id="salesContent" class="body-2">
                <div class="header">
                    <div class="div-wrapper">
                        <h4 class="text-wrapper-2">No.</h4>
                    </div>
                    <div class="div-wrapper">
                        <h4 class="text-wrapper-2">종류</h4>
                    </div>
                    <div class="div-wrapper">
                        <h4 class="text-wrapper-2">상품명</h4>
                    </div>
                    <div class="div-wrapper">
                        <h4 class="text-wrapper-2">판매개수</h4>
                    </div>
                    <div class="div-wrapper">
                        <h4 class="text-wrapper-2">매출</h4>
                    </div>
                </div>
                <div class="line-wrapper">
                    <c:choose>
                        <c:when test="${empty todaySales}">
                    <div class="div-2">
                                <div class="div-wrapper" style="width: 100%; text-align: center;">
                                    <p class="text-wrapper-3">금일 판매 데이터가 없습니다.</p>
                        </div>
                    </div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="sale" items="${todaySales}" varStatus="status">
                                <c:set var="categoryArray" value="${fn:split(sale.categoryList, ',')}" />
                                <c:set var="breadArray" value="${fn:split(sale.breadList, ',')}" />
                                <c:set var="quantityArray" value="${fn:split(sale.quantityList, ',')}" />

                                <c:forEach var="category" items="${categoryArray}" varStatus="itemStatus">
                    <div class="div-2">
                        <div class="div-wrapper">
                            <p class="text-wrapper-2">${itemStatus.count}</p>
                        </div>
                        <div class="div-wrapper">
                            <p class="text-wrapper-3">${category}</p>
                        </div>
                        <div class="div-wrapper">
                            <p class="text-wrapper-2">${breadArray[itemStatus.index]}</p>
                        </div>
                        <div class="div-wrapper">
                            <p class="text-wrapper-2">${quantityArray[itemStatus.index]}</p>
                        </div>
                        <div class="div-wrapper">
                            <p class="text-wrapper-2">
                                <fmt:formatNumber value="${quantityArray[itemStatus.index] * (breadPriceMap[breadArray[itemStatus.index]])}" pattern="#,###" />
                            </p>
                    </div>
                </div>
                                </c:forEach>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <footer class="total">
                <p class="element">
                    <span class="span">금일 총 매출 금액 : </span>
                    <span class="text-wrapper-4">
                        <c:choose>
                            <c:when test="${empty todaySales}">0</c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${todaySales[0].sellMoney}" pattern="#,###,###"/>
                            </c:otherwise>
                        </c:choose>
                    </span>
                    <span class="span">원</span>
                </p>
            </footer>
        </article>
    </div>
</div> 