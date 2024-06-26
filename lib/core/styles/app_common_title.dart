class AppCommonTitle {
  String  titleSkill (String title) {
    switch (title) {
      case "BEGINNER":
        return "MỚI BẮT ĐẦU";
      case "NOVICE":
        return "TIRO";
      case "RECREATIONAL":
        return "NGHIỆP DƯ";
      case "BASIC":
        return "CƠ BẢN";
      case "INTERMEDIATE":
        return "TRUNG BÌNH";
      case "ABOVE_AVERAGE":
        return "TRÊN TRUNG BÌNH";
      case "AMATEUR":
        return "NGHIỆP DƯ";
      case "SEMI_PROFESSIONAL":
        return "BÁN CHUYÊN NGHIỆP";
      case "PROFESSIONAL":
        return "CHUYÊN NGHIỆP";
      case "INTERNATIONAL":
        return "QUỐC TẾ";
      default:
        throw Exception("Invalid title in Vietnamese: $title");
    }
  }
  String getStatusTitle(String status) {
    switch (status) {
      case "ACTIVE":
        return "HOẠT ĐỘNG";
      case "INACTIVE":
        return "KHÔNG HOẠT ĐỘNG";
      case "PENDING":
        return "ĐANG CHỜ";
      case "BLOCKED":
        return "BỊ CHẶN";
      case "DELETED":
        return "ĐÃ XÓA";
      case "PLAYING":
        return "ĐANG CHƠI";
      case "TRAINING":
        return "ĐANG TẬP LUYỆN";
      case "RESTING":
        return "ĐANG NGHỈ NGƠI";
      case "TRAVELING":
        return "ĐANG ĐI DU LỊCH";
      case "APPLY":
        return "ỨNG TUYỂN";
      case "OTHER":
        return "KHÁC";
      default:
        throw Exception("Invalid status: $status");
    }
  }
  String getForm(String title)
  {
    switch(title)
    {
      case "KNOCKOUT":
        return "Loại trực tiếp";
      case "ROUND_ROBIN":
        return "Đấu vòng tròn";
      default:
        return title;
    }
  }
}