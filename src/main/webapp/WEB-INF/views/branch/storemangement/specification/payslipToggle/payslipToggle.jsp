<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslipToggle/globals.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslipToggle/style.css" />
    <link rel="stylesheet" href="/css/branch/storemangement/payslipToggle/styleguide.css" />
</head>
<body>
<div class="toggle">
    <div class="question">
        <div class="text">정말로 송금하시겠습니까?</div>
    </div>
    <div class="output">
        <div class="outline">
            <div class="current-fund-wrapper">
                <div class="text-wrapper">현 자금</div>
            </div>
            <div class="money">
                <div class="div">
                    <fmt:formatNumber value="${money}" type="number" />
                </div>
                <div class="won">원</div>
            </div>
        </div>
        <div class="outline">
            <div class="div-wrapper">
                <div class="text-wrapper">실수령액(월)</div>
            </div>
            <div class="money-2">
                <div class="div">
                    <fmt:formatNumber value="${salary}" type="number" />
                </div>
                <div class="won">원</div>
            </div>
        </div>
        <div class="outline">
            <div class="div-wrapper">
                <div class="text-wrapper">남은 잔액</div>
            </div>
            <div class="money-3">
                <div class="div">
                    <fmt:formatNumber value="${remaining}" type="number" />
                </div>
                <div class="won">원</div>
            </div>
        </div>
    </div>
    <div class="send">
        <form id="sendForm" method="post" action="/branch/storemangement/specification/payslipToggle/send">
            <input type="hidden" name="userNo" value="${userNo}" />
            <input type="hidden" name="salary" value="${salary}" />
            <button type="button" class="send-2">보내기</button>
        </form>
    </div>

    <div class="cancel" onclick="window.location.href='/branch/storemangement/specification/payslipToggle/cancel?userNo=${userNo}';">
        <button type="button" class="cancel-2">취소</button>
    </div>


</div>
</body>
</html>
