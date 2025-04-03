breadList.forEach(bread -> {
    Timestamp createDate = bread.getCreateDate();
        if (createDate != null) {
            Date sqlDate = new Date(createDate.getTime());
            bread.setEnrollDate(sqlDate);
        } else {
            bread.setEnrollDate(null);
        }
});