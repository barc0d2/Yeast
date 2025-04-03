
//리스트 변환 예시
breadList.forEach(bread -> {
    Timestamp createDate = bread.getCreateDate();
        if (createDate != null) {
            Date sqlDate = new Date(createDate.getTime());
            bread.setEnrollDate(sqlDate);
        } else {
            bread.setEnrollDate(null);
        }
});
//단일 객체 변환 예시
Timestamp createDate = bread.getCreateDate();
    if (createDate != null) {
Date sqlDate = new Date(createDate.getTime());
        bread.setEnrollDate(sqlDate);
    } else {
        bread.setEnrollDate(null);
}