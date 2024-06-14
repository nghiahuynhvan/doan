enum SkillLevel {
  beginner,
  novice,
  recreational,
  basic,
  intermediate,
  aboveAverage,
  amateur,
  semiProfessional,
  professional,
  international;

  String get title {
    switch (this) {
      case SkillLevel.beginner:
        return 'BEGINNER';
      case SkillLevel.novice:
        return 'NOVICE';
      case SkillLevel.recreational:
        return 'RECREATIONAL';
      case SkillLevel.basic:
        return 'BASIC';
      case SkillLevel.intermediate:
        return 'INTERMEDIATE';
      case SkillLevel.aboveAverage:
        return 'ABOVE_AVERAGE';
      case SkillLevel.amateur:
        return 'AMATEUR';
      case SkillLevel.semiProfessional:
        return 'SEMI_PROFESSIONAL';
      case SkillLevel.professional:
        return 'PROFESSIONAL';
      case SkillLevel.international:
        return 'INTERNATIONAL';
    }
  }

  static SkillLevel init(String skillLevelString) {
    switch (skillLevelString.toUpperCase()) {
      case "BEGINNER":
        return SkillLevel.beginner;
      case "NOVICE":
        return SkillLevel.novice;
      case "RECREATIONAL":
        return SkillLevel.recreational;
      case "BASIC":
        return SkillLevel.basic;
      case "INTERMEDIATE":
        return SkillLevel.intermediate;
      case "ABOVE_AVERAGE":
        return SkillLevel.aboveAverage;
      case "AMATEUR":
        return SkillLevel.amateur;
      case "SEMI_PROFESSIONAL":
        return SkillLevel.semiProfessional;
      case "PROFESSIONAL":
        return SkillLevel.professional;
      case "INTERNATIONAL":
        return SkillLevel.international;
      default:
        return SkillLevel.beginner;
    }
  }

  static List<String> getAllSkillLevels() {
    return [
      SkillLevel.beginner.title,
      SkillLevel.novice.title,
      SkillLevel.recreational.title,
      SkillLevel.basic.title,
      SkillLevel.intermediate.title,
      SkillLevel.aboveAverage.title,
      SkillLevel.amateur.title,
      SkillLevel.semiProfessional.title,
      SkillLevel.professional.title,
      SkillLevel.international.title
    ];
  }
}
