 enum EStatusMatch {
  unconfirmed,
  scheduled,
  in_progress,
  completed,
  cancelled,
  postponed;

  static EStatusMatch init(String? statusString) {
    switch (statusString?.toUpperCase()) {
      case "UNCONFIRMED":
        return EStatusMatch.unconfirmed;
      case "SCHEDULED":
        return EStatusMatch.scheduled;
      case "IN_PROGRESS":
        return EStatusMatch.in_progress;
      case "COMPLETED":
        return EStatusMatch.completed;
      case "CANCELLED":
        return EStatusMatch.cancelled;
      case "POSTPONED":
        return EStatusMatch.postponed;
      default:
        return EStatusMatch.unconfirmed;
    }
  }

  String get title {
    switch (this) {
      case EStatusMatch.unconfirmed:
        return "UNCONFIRMED";
      case EStatusMatch.scheduled:
        return "Đã lên lịch";
      case EStatusMatch.in_progress:
        return "IN_PROGRESS";
      case EStatusMatch.completed:
        return "COMPLETED";
      case EStatusMatch.cancelled:
        return "CANCELLED";
      case EStatusMatch.postponed:
        return "POSTPONED";
    }
  }

  List<EStatusMatch> getAllStatuses() {
    return [
      EStatusMatch.unconfirmed,
      EStatusMatch.scheduled,
      EStatusMatch.in_progress,
      EStatusMatch.completed,
      EStatusMatch.cancelled,
      EStatusMatch.postponed
    ];
  }
}