<style>
    a{
        color:black;
        text-decoration: none;
    }
    .outFrame {
        width: 1530px;
        height: 1300px;

        align-items: center;
        gap: 27px;
        top: 46px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        flex-direction: column;
        position: relative;
    }
    #pagination{
        position : absolute;
        bottom : 20px;
    }

    ul, li{
        display:flex;
        list-style: none;
        list-style-type: none;
        padding: 0; /* 기본 여백 제거 */
        margin: 0; /* 기본 마진 제거 */
        flex-direction: row;
        gap:20px;
    }
    .page {
        display: flex;
        flex-direction: row;
        width: 36px;
        height: 36px;
        align-items: center;
        justify-content: center;
        gap: 10px;
        padding: 10px;
        background-color: #ffffff;
        border-radius: 6px;
        border: 1px solid;
        border-color: #9e9e9e;
    }
    .unSelectPage {
        color: #000000;
        position: relative;
        width: fit-content;
        margin-top: -10.00px;
        margin-bottom: -8.00px;
        font-family: "Kakao OTF", Helvetica;
        font-weight:  700;
        font-size:24px;
        letter-spacing: 0px;
        line-height: 139.9999976158142%;
        white-space: nowrap;
        font-style: normal;
    }

    .selectPage {
        color: #ffffff;
        position: relative;
        width: fit-content;
        margin-top: -10.00px;
        margin-bottom: -8.00px;
        font-family: "Kakao OTF", Helvetica;
        font-weight:  700;
        font-size:24px;
        letter-spacing:0px;
        line-height: 139.9999976158142%;
        white-space: nowrap;
        font-style: normal;
    }

    .pre-page {
        display: flex;
        flex-direction: row;
        width: 36px;
        height: 36px;
        align-items: center;
        gap: 8px;
        padding: 10px;
        background-color: rgba(255, 255, 255, 1);
        border-radius: 8px;
        overflow: hidden;
        border: 1px solid;
        border-color: rgba(232, 232, 232, 1);
        box-shadow: 0px 1px 1px 0px rgba(0, 0, 0, 0.06);
    }

    .next-page {
        display: flex;
        flex-direction: row;
        width: 36px;
        height: 36px;
        align-items: center;
        gap: 8px;
        padding: 10px;
        background-color: rgba(255, 255, 255, 1);
        border-radius: 8px;
        overflow: hidden;
        border: 1px solid;
        border-color: rgba(232, 232, 232, 1);
        box-shadow: 0px 1px 1px 0px rgba(0, 0, 0, 0.06);
    }

    .cpage {
        display: flex;
        flex-direction: row;
        width: 36px;
        height: 36px;
        align-items: center;
        justify-content: center;
        background: #ff9538;
        gap: 10px;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid;
        border-color: #9e9e9e;
    }

</style>

<%--outFrame은 외부 컨테이너--%>

<div  class="outFrame">
    <div id="pagination">
        <ul>
            <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                </c:when>
                <c:otherwise>
                    <li class="pre-page"><a class="page-link" href="/company/bread/list?currentPage=${pi.currentPage - 1}"><svg width="29" height="26" style="transform: translateX(-8px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19.9226 22.4738C20.6925 21.7753 20.6925 20.6469 19.9226 19.9484L12.2627 12.9989L19.9226 6.04936C20.6925 5.35083 20.6925 4.22243 19.9226 3.5239C19.1526 2.82537 17.9089 2.82537 17.139 3.5239L8.07745 11.7451C7.30752 12.4436 7.30752 13.572 8.07745 14.2706L17.139 22.4918C17.8891 23.1724 19.1526 23.1724 19.9226 22.4738Z" fill="black"/>
                    </svg></a></li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <c:choose>
                    <c:when test="${p == pi.currentPage}">
                        <li class="cpage"><div class="selectPage">${p}</div></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page"><div class="unSelectPage"><a class="page-link" href="/company/bread/list?currentPage=${p}">${p}</a></div></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                </c:when>
                <c:otherwise>
                    <li class="next-page"><a class="page-link" href="/company/bread/list?currentPage=${pi.currentPage + 1}"><svg width="29" height="26" style="transform: translateX(-6px)" viewBox="0 0 29 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.07745 3.52616C7.30752 4.22469 7.30752 5.35309 8.07745 6.05163L15.7373 13.0011L8.07745 19.9506C7.30752 20.6492 7.30752 21.7776 8.07745 22.4761C8.84738 23.1746 10.0911 23.1746 10.861 22.4761L19.9226 14.2549C20.6925 13.5564 20.6925 12.428 19.9226 11.7294L10.861 3.50825C10.1109 2.82763 8.84738 2.82763 8.07745 3.52616Z" fill="black"/>
                    </svg></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
