if (createDate != null) {
    Date sqlDate = new Date(createDate.getTime());
    member.setEnrollDate(sqlDate);
} else {
    member.setEnrollDate(null);
}
