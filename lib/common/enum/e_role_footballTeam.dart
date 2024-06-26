enum ERole {
  goalkeeper,
  defender,
  midfielder,
  forward,
  free,
  other;

  static ERole init(String? roleString) {
    switch (roleString?.toUpperCase()) {
      case "GOALKEEPER":
        return ERole.goalkeeper;
      case "DEFENDER":
        return ERole.defender;
      case "MIDFIELDER":
        return ERole.midfielder;
      case "FORWARD":
        return ERole.forward;
      case "FREE":
        return ERole.free;
      default:
        return ERole.other;
    }
  }

  String get title {
    switch (this) {
      case ERole.goalkeeper:
        return 'GOALKEEPER';
      case ERole.defender:
        return 'DEFENDER';
      case ERole.midfielder:
        return 'MIDFIELDER';
      case ERole.forward:
        return 'FORWARD';
      case ERole.free:
        return 'FREE';
      case ERole.other:
        return 'OTHER';
    }
  }

  static List<String> getAllRolesTile() {
    return [
      ERole.goalkeeper.title,
      ERole.defender.title,
      ERole.midfielder.title,
      ERole.forward.title,
      ERole.free.title,
    ];
  }
}
