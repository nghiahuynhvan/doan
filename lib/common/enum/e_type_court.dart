enum ETypeCourt {
  FIVE_A_SIDE,
  SEVEN_A_SIDE,
  ELEVEN_A_SIDE,
  FUTSAL,
  BEACH_FOOTBALL,
  INDOOR_FOOTBALL,
  OTHER;

  static ETypeCourt init(String? typeString) {
    switch (typeString) {
      case "FIVE_A_SIDE":
        return ETypeCourt.FIVE_A_SIDE;
      case "SEVEN_A_SIDE":
        return ETypeCourt.SEVEN_A_SIDE;
      case "ELEVEN_A_SIDE":
        return ETypeCourt.ELEVEN_A_SIDE;
      case "FUTSAL":
        return ETypeCourt.FUTSAL;
      case "BEACH_FOOTBALL":
        return ETypeCourt.BEACH_FOOTBALL;
      case "INDOOR_FOOTBALL":
        return ETypeCourt.INDOOR_FOOTBALL;
      case "OTHER":
        return ETypeCourt.OTHER;
      default:
        return ETypeCourt.OTHER;
    }
  }

  String get title {
    switch (this) {
      case ETypeCourt.FIVE_A_SIDE:
        return "FIVE_A_SIDE";
      case ETypeCourt.SEVEN_A_SIDE:
        return "SEVEN_A_SIDE";
      case ETypeCourt.ELEVEN_A_SIDE:
        return "ELEVEN_A_SIDE";
      case ETypeCourt.FUTSAL:
        return "FUTSAL";
      case ETypeCourt.BEACH_FOOTBALL:
        return "BEACH_FOOTBALL";
      case ETypeCourt.INDOOR_FOOTBALL:
        return "INDOOR_FOOTBALL";
      case ETypeCourt.OTHER:
        return "OTHER";
      default:
        return "";
    }
  }

  static List<String> GetAllTypes() {
    return [
      ETypeCourt.FIVE_A_SIDE.title,
      ETypeCourt.SEVEN_A_SIDE.title,
      ETypeCourt.ELEVEN_A_SIDE.title,
      ETypeCourt.FUTSAL.title,
      ETypeCourt.BEACH_FOOTBALL.title,
      ETypeCourt.INDOOR_FOOTBALL.title,
      ETypeCourt.OTHER.title
    ];
  }
}
