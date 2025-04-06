<%--branch 용 --%>

<jsp:include page="../sideBar/whiteSideBar.jsp"/>
<jsp:include page="../sideBar/whiteTopBar.jsp"/>

<%--company 용 --%>
<jsp:include page="../sideBar/brownSideBar.jsp"/>
<jsp:include page="../sideBar/brownTopBar.jsp"/>

<%-- body에 추가적으로 적용해야하는 요소 --%>
body {
    width: 100%;
    min-height: 100vh;
    height: auto;
    overflow-y: auto;
    position:relative;
}

<%--내용 전체를 담은 (가운데에 위치해야할) 컨테이너에 추가적으로 적용해야하는 요소--%>

.container{
    position:absolute;
    top:149px; <%--97px + 50px 최소값 97px--%>
    left:calc(50% + 125px);
    <%-- 왼쪽이 가려지면 transform 없애고 left 250px + 50px--%>
    transform: translateX(-50%);
    width: 1494px; <%--width는 기존 각자의 컨테이너 값을 사용 권장 혹은 역랑껏 수정--%>
    height: auto;
}